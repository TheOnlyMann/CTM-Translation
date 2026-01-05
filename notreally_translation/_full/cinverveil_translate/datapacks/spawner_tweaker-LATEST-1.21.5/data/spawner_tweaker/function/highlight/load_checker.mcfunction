#Yea yea, it's repeat code. But it works

#Checking the loading
$execute in $(dimension) positioned $(x) $(y) $(z) unless loaded ~ ~ ~ run data modify storage spawner_tweaker:temp highlight[$(n)].loaded set value 0b
$execute in $(dimension) positioned $(x) $(y) $(z) if loaded ~ ~ ~ run data modify storage spawner_tweaker:temp highlight[$(n)].loaded set value 1b

#Incrementing and wiring needed data
$execute store result storage spawner_tweaker:temp highlight[$(next)].n int 1 run scoreboard players add n temp 1
$execute store result storage spawner_tweaker:temp highlight[$(next)].next int 1 run scoreboard players add n temp 1
$data modify storage spawner_tweaker:temp highlight[$(next)].x set from storage spawner_tweaker:temp highlight[$(next)].Pos[0]
$data modify storage spawner_tweaker:temp highlight[$(next)].y set from storage spawner_tweaker:temp highlight[$(next)].Pos[1]
$data modify storage spawner_tweaker:temp highlight[$(next)].z set from storage spawner_tweaker:temp highlight[$(next)].Pos[2]
scoreboard players remove n temp 1

#Looping
$execute if score n temp <= $total_spawners temp run function spawner_tweaker:highlight/load_checker with storage spawner_tweaker:temp highlight[$(next)]