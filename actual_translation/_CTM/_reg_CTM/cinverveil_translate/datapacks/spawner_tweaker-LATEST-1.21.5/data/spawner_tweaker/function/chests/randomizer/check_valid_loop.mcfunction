#Loops through to check if the containers are actually valid (have something in them to be randomized)
#This function mostly checks to see if things are loaded or not

#Check to see if this position needs to be force loaded
scoreboard players set force_load temp 0
$execute store result score force_load temp run data get storage spawner_tweaker:temp container_checker[$(n)].force_load
$execute if score force_load temp matches 1.. in $(dimension) positioned $(x) $(y) $(z) run forceload add ~ ~

#Check to see if this position is loaded (if so, commence operations)
scoreboard players set loaded temp 0
$execute in $(dimension) positioned $(x) $(y) $(z) if loaded ~ ~ ~ run scoreboard players set loaded temp 1
$execute if score loaded temp matches 1.. in $(dimension) positioned $(x) $(y) $(z) run function spawner_tweaker:chests/randomizer/check_valid with storage spawner_tweaker:temp container_checker[$(n)]
$execute if score loaded temp matches 1.. if score force_load temp matches 1.. in $(dimension) positioned $(x) $(y) $(z) run forceload remove ~ ~

#Prep and run the next iteration
$execute store result storage spawner_tweaker:temp container_checker[$(next)].n int 1 run scoreboard players add n temp 1
$execute store result storage spawner_tweaker:temp container_checker[$(next)].next int 1 run scoreboard players add n temp 1
scoreboard players remove n temp 1

#Looping
$execute if score n temp < $modification_limit spawner_tweaker run function spawner_tweaker:chests/randomizer/check_valid_loop with storage spawner_tweaker:temp container_checker[$(next)]
