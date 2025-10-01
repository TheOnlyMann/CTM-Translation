# pip install fonttools
from fontTools.ttLib import TTFont

def get_bitmap_strikes(tt):
    strikes = []
    # CBDT/CBLC (color bitmaps)
    if "CBLC" in tt:
        cblc = tt["CBLC"]
        for s in cblc.strikes:
            # Each strike has a ppem size (xPpem/yPpem). Use yPpem as nominal.
            strikes.append(s[1])  # (xPpem, yPpem)
    # EBDT/EBLC (legacy)
    if "EBLC" in tt:
        eblc = tt["EBLC"]
        for s in eblc.strikes:
            strikes.append(s[1])
    # sbix (Apple)
    if "sbix" in tt:
        sbix = tt["sbix"]
        # sbix 'strikes' dict keyed by ppem
        strikes.extend(sorted(sbix.strikes.keys()))
    # Deduplicate and sort
    return sorted(set(strikes))

def glyph_bbox_units(tt, glyph_name):
    glyf = tt["glyf"]
    if glyph_name not in tt.getGlyphOrder():
        return None
    g = glyf[glyph_name]
    if g.isComposite():
        # For composites, we can expand (simple approach: use glyph’s bbox)
        g.recalcBounds(glyf)
    if g.numberOfContours == 0:
        return None
    return g.xMin, g.yMin, g.xMax, g.yMax

def measure_cap_height_units(tt):
    # Prefer OS/2.sCapHeight if present and non-zero
    os2 = tt["OS/2"] if "OS/2" in tt else None
    if os2 and getattr(os2, "sCapHeight", 0):
        return os2.sCapHeight
    # Fallback: measure 'H'
    cmap = tt.getBestCmap() or {}
    H_codepoint = ord("H")
    glyph_name = cmap.get(H_codepoint, None)
    if not glyph_name:
        # try 'H' by name
        glyph_name = "H" if "H" in tt.getGlyphOrder() else None
    if not glyph_name:
        return None
    bbox = glyph_bbox_units(tt, glyph_name)
    if not bbox:
        return None
    _, yMin, _, yMax = bbox
    return yMax - yMin

def suggest_crisp_sizes(UPEM, cap_u, line_u, max_px=48):
    """
    Try S from 6..max_px and score by how close cap height and line height
    land on integers after scaling. Lower score is better.
    """
    suggestions = []
    for S in range(6, max_px + 1):
        cap_px = (S * cap_u / UPEM) if cap_u else None
        line_px = S * line_u / UPEM
        err = 0.0
        if cap_px is not None:
            err += min(abs(cap_px - round(cap_px)), 0.5)
        err += min(abs(line_px - round(line_px)), 0.5)
        suggestions.append((S, err, cap_px, line_px))
    suggestions.sort(key=lambda t: (t[1], t[0]))
    return suggestions[:10]

def inspect_ttf(path):
    tt = TTFont(path)

    strikes = get_bitmap_strikes(tt)
    print("Bitmap strikes (ppem):", strikes if strikes else "None")

    head = tt["head"]
    upem = head.unitsPerEm
    print("Units per em:", upem)

    os2 = tt["OS/2"] if "OS/2" in tt else None
    hhea = tt["hhea"] if "hhea" in tt else None

    if os2:
        typoAsc = os2.sTypoAscender
        typoDesc = os2.sTypoDescender
        typoGap  = os2.sTypoLineGap
        print("OS/2 Typo metrics:", typoAsc, typoDesc, typoGap)
        line_u = (typoAsc - typoDesc + typoGap)
    else:
        typoAsc = typoDesc = typoGap = None
        line_u = None

    cap_u = measure_cap_height_units(tt)
    if cap_u:
        print("Cap height (units):", cap_u)
    else:
        print("Cap height (units): not available")

    if os2 and getattr(os2, "sxHeight", 0):
        print("x-height (units):", os2.sxHeight)

    if line_u is None and hhea:
        # fallback to hhea if OS/2 not present
        line_u = (hhea.ascent - hhea.descent + hhea.lineGap)
        print("Using hhea line metrics.")

    if line_u:
        # Suggest crisp pixel sizes
        suggestions = suggest_crisp_sizes(upem, cap_u, line_u, max_px=48)
        print("\nSuggested crisp sizes (S px, error, cap_px≈, line_px≈):")
        for S, err, cap_px, line_px in suggestions:
            cap_str = f"{cap_px:.2f}" if cap_px is not None else "n/a"
            print(f"S={S:2d}  err={err:.4f}  cap≈{cap_str}  line≈{line_px:.2f}")
    else:
        print("No usable line metrics found.")

# Example:
# inspect_ttf("YourFont.ttf")

if __name__ == "__main__":
    import sys
    if len(sys.argv) != 2:
        print("Usage: python checkfontsize.py YourFont.ttf")
    else:
        inspect_ttf(sys.argv[1])