#Checks to see if the position is loaded for each container

#Checking the loading
$execute in $(dimension) positioned $(x) $(y) $(z) unless loaded ~ ~ ~ run data modify storage spawner_tweaker:temp container_checker[$(n)].force_load set value 1b
$execute in $(dimension) positioned $(x) $(y) $(z) if loaded ~ ~ ~ run data modify storage spawner_tweaker:temp container_checker[$(n)].force_load set value 0b

#Incrementing and wiring needed data
$execute store result storage spawner_tweaker:temp container_checker[$(next)].n int 1 run scoreboard players add n temp 1
$execute store result storage spawner_tweaker:temp container_checker[$(next)].next int 1 run scoreboard players add n temp 1
scoreboard players remove n temp 1

#Looping
$execute if score n temp <= total_chests st_priming run function spawner_tweaker:chests/randomizer/load_checker with storage spawner_tweaker:temp container_checker[$(next)]