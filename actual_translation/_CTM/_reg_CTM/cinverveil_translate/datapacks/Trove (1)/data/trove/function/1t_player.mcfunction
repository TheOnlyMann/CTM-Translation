execute if score @s trove_recall matches 1.. run function trove:recall/recall_tick
execute if score $recall trove_main matches 1.. run execute positioned 8 88 -32 if entity @s[distance=..20] run scoreboard players set $found_monument trove_recall 1



#function trove:ability/ability_main