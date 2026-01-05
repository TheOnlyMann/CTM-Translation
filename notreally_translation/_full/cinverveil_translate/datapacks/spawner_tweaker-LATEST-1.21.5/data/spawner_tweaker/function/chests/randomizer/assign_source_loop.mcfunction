#Assigns each container a source container

#Getting the size of source array to randomize, then randomizing
execute store result score max_random temp if data storage spawner_tweaker:temp container_source[]
execute store result storage spawner_tweaker:temp variables.max_rng int 1 run scoreboard players get max_random temp
$data modify storage spawner_tweaker:temp variables.n set value $(n)
execute if score max_random temp matches 2.. run function spawner_tweaker:chests/randomizer/assign_source with storage spawner_tweaker:temp variables

execute unless score max_random temp matches 2.. run data modify storage spawner_tweaker:temp variables.source set value 0
execute unless score max_random temp matches 2.. run function spawner_tweaker:chests/randomizer/assign_source_macro with storage spawner_tweaker:temp variables

#Incrementing and writing needed data
$execute store result storage spawner_tweaker:temp container_randomizer[$(next)].n int 1 run scoreboard players add n temp 1
$execute store result storage spawner_tweaker:temp container_randomizer[$(next)].next int 1 run scoreboard players add n temp 1
scoreboard players remove n temp 1

#Looping
$execute if score n temp <= total_chests st_priming run function spawner_tweaker:chests/randomizer/assign_source_loop with storage spawner_tweaker:temp container_randomizer[$(next)]