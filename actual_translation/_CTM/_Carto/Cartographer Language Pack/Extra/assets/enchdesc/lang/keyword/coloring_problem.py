import json
from collections import defaultdict
import os


def build_graph(data):
    graph = defaultdict(set)

    for enchantment, keywords in data.items():

        # Book keywords exist on a separate layer
        keywords = [
            keyword
            for keyword in set(keywords)
            if not keyword.startswith("book_")
        ]

        # Ensure keywords with no conflicts still exist
        for keyword in keywords:
            graph[keyword]

        # Every pair sharing this enchantment conflicts
        for i in range(len(keywords)):
            for j in range(i + 1, len(keywords)):
                a = keywords[i]
                b = keywords[j]

                graph[a].add(b)
                graph[b].add(a)

    return graph


def dsatur(graph, pre_color = []):
    colors = {}
    if pre_color:
        color_num = 0
        for group in pre_color:
            for vertex in group:
                colors[vertex]=color_num
            color_num+=1
    print(colors)
    while len(colors) < len(graph):

        uncolored = [
            vertex
            for vertex in graph
            if vertex not in colors
        ]

        def priority(vertex):
            used_neighbor_colors = {
                colors[n]
                for n in graph[vertex]
                if n in colors
            }

            return (
                len(used_neighbor_colors),
                len(graph[vertex])
            )

        vertex = max(uncolored, key=priority)

        forbidden = {
            colors[n]
            for n in graph[vertex]
            if n in colors
        }

        color = 0

        while color in forbidden:
            color += 1

        colors[vertex] = color

    return colors


def make_groups(colors):
    groups = defaultdict(list)

    for keyword, color in colors.items():
        groups[color].append(keyword)

    for keywords in groups.values():
        keywords.sort()

    return dict(groups)


current_directory = os.path.dirname(__file__)
with open(current_directory+"/enchdesc_keyword_nocomment.json","r", encoding="utf-8") as f:
    data = json.load(f)

same_coloring = [
    [],
    [],
    [],
    ["melee","strength","ranged","power"]
]

graph = build_graph(data)
colors = dsatur(graph,same_coloring)
groups = make_groups(colors)
result = []

print(f"Groups used: {len(groups)}")

for group_id, keywords in sorted(groups.items()):
    print(f"\nGroup {group_id + 1}")
    sub_result = {}

    for keyword in keywords:
        print(f"  {keyword}")
        sub_result[keyword]=""
    result.append(sub_result)
        

with open(current_directory+"/keyword_composite_1.json", "w", encoding="utf-8") as f:
    f.write(json.dumps(result,indent=4))