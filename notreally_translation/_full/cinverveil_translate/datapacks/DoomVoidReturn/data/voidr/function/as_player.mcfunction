execute store result score @s voidr_curr_y run data get entity @s Pos[1]
execute \
    if score @s voidr_curr_y matches -63.. \
    unless block ~ ~-1 ~ #voidr:not_safe_footing \
    if block ~ ~ ~ #voidr:air_types \
    if block ~ ~1 ~ #voidr:air_types \
    run function voidr:store_safe_spot


# This is the default trigger point to return the player to a safe spot. 
# 
# The below can be removed and you can add your own conditions. 
# Just run 'function voidr:as_doomed_player` as the player you want to return.
#
execute if score @s voidr_curr_y matches ..-70 run function voidr:as_doomed_player