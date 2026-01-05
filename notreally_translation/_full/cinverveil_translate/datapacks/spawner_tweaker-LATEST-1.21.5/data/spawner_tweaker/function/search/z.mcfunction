#Iterates search along the z axis

scoreboard players add search_z temp 1
scoreboard players set search_x temp 0
execute if score search_z temp <= max_length temp positioned ~ ~ ~1 run function spawner_tweaker:search/x with storage spawner_tweaker:temp variables
$execute unless score search_z temp <= max_length temp if score search_y temp <= max_length temp positioned ~ ~ ~-$(max_length) run function spawner_tweaker:search/y with storage spawner_tweaker:temp variables