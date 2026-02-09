execute if score @s trove_recall matches 1 unless data entity @s SpawnX run tp @s ~0.5 ~ ~0.5 
execute if score @s trove_recall matches 1 if data entity @s SpawnX run function trove:recall/tp_spawn with entity @s

execute if score @s trove_recall matches 2 run function trove:recall/tp_monu

execute at @s run tp ~ ~1 ~
effect give @s minecraft:slow_falling 1 0 true

execute at @s run particle minecraft:glow_squid_ink ~ ~ ~ 1 1 1 .1 40


scoreboard players set @s trove_recall 0