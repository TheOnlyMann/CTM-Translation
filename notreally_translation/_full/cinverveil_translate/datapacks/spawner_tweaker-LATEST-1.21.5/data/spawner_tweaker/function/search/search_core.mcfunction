#Core to begin search loop for finding spawners


#Reducing load of this sytem
scoreboard players operation temp temp = $search_range spawner_tweaker
execute if score temp temp matches ..0 run return 1

#Add flags
tag @s add st_searching
scoreboard players set spawner_found temp 0

#If we can search, let's get some numbers worked out
scoreboard players operation max_length temp = temp temp
scoreboard players operation max_length temp *= 2 numbers
scoreboard players add max_length temp 1
execute store result storage spawner_tweaker:temp variables.start float 1 run scoreboard players get temp temp
execute store result storage spawner_tweaker:temp variables.max_length float 1 run scoreboard players get max_length temp
scoreboard players set search_x temp 0
scoreboard players set search_y temp 0
scoreboard players set search_z temp 0
scoreboard players set raycast temp 50
execute at @s anchored eyes run function spawner_tweaker:search/raycast

#Remove flags
execute if score spawner_found temp matches 1.. run scoreboard players add @s st_search 10
tag @s remove st_searching