execute if score $found_monument trove_recall matches 1.. run tp @s 8 88 -32

execute unless score $found_monument trove_recall matches 1.. unless data entity @s SpawnX run tp @s ~0.5 ~ ~0.5 
execute unless score $found_monument trove_recall matches 1.. if data entity @s SpawnX run function trove:recall/tp_spawn with entity @s

