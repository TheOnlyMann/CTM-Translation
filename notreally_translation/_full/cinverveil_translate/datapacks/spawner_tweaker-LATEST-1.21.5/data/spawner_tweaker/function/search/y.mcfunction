#Iterates search along the y axis

scoreboard players add search_y temp 1
scoreboard players set search_x temp 0
scoreboard players set search_z temp 0
execute positioned ~ ~1 ~ run function spawner_tweaker:search/x with storage spawner_tweaker:temp variables