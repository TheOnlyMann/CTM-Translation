#Get range of chest
$execute store result score x1 temp run data get storage spawner_tweaker:temp Chests[$(n)].x
$execute store result score y1 temp run data get storage spawner_tweaker:temp Chests[$(n)].y
$execute store result score z1 temp run data get storage spawner_tweaker:temp Chests[$(n)].z
scoreboard players operation x2 temp = x1 temp
scoreboard players operation y2 temp = y1 temp
scoreboard players operation z2 temp = z1 temp
scoreboard players operation x1 temp -= chest_range temp
scoreboard players operation y1 temp -= chest_range temp
scoreboard players operation z1 temp -= chest_range temp
scoreboard players operation x2 temp += chest_range temp
scoreboard players operation y2 temp += chest_range temp
scoreboard players operation z2 temp += chest_range temp

#Compare to player's position and write if success
scoreboard players set pass temp 0
execute if score x temp >= x1 temp if score x temp <= x2 temp run scoreboard players add pass temp 1
execute if score y temp >= y1 temp if score y temp <= y2 temp run scoreboard players add pass temp 1
execute if score z temp >= z1 temp if score z temp <= z2 temp run scoreboard players add pass temp 1
$execute if score pass temp matches 3.. run function spawner_tweaker:chests/delete/display with storage spawner_tweaker:temp Chests[$(n)]

#pruning data
$execute if score pass temp matches 3.. run data modify storage spawner_tweaker:temp Chests[$(n)].remove set value 1b

#Loop
scoreboard players add n temp 1
execute store result storage spawner_tweaker:temp variables.n int 1 run scoreboard players get n temp
execute if score n temp <= total_chests temp run function spawner_tweaker:chests/delete/range_checker with storage spawner_tweaker:temp variables
