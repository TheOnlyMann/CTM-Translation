#Checks to see if the position is loaded for each spawner

#Checking the loading
$execute in $(dimension) positioned $(x) $(y) $(z) unless loaded ~ ~ ~ run data modify storage spawner_tweaker:temp BSE[$(n)].force_load set value 1b
$execute in $(dimension) positioned $(x) $(y) $(z) if loaded ~ ~ ~ run data modify storage spawner_tweaker:temp BSE[$(n)].force_load set value 0b

#Incrementing and wiring needed data
$execute store result storage spawner_tweaker:temp BSE[$(next)].n int 1 run scoreboard players add n temp 1
$execute store result storage spawner_tweaker:temp BSE[$(next)].next int 1 run scoreboard players add n temp 1
$data modify storage spawner_tweaker:temp BSE[$(next)].x set from storage spawner_tweaker:temp BSE[$(next)].Pos[0]
$data modify storage spawner_tweaker:temp BSE[$(next)].y set from storage spawner_tweaker:temp BSE[$(next)].Pos[1]
$data modify storage spawner_tweaker:temp BSE[$(next)].z set from storage spawner_tweaker:temp BSE[$(next)].Pos[2]
scoreboard players remove n temp 1

#Looping
$execute if score n temp <= total_spawners st_priming run function spawner_tweaker:bulk_edit/load_checker with storage spawner_tweaker:temp BSE[$(next)]