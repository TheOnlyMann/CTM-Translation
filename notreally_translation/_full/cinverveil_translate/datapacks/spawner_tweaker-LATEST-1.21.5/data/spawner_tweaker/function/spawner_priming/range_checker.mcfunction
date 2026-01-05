#Get range of spawner
execute store result score x1 temp run data get storage spawner_tweaker:temp Checking[0].Pos[0]
execute store result score y1 temp run data get storage spawner_tweaker:temp Checking[0].Pos[1]
execute store result score z1 temp run data get storage spawner_tweaker:temp Checking[0].Pos[2]
scoreboard players operation x2 temp = x1 temp
scoreboard players operation y2 temp = y1 temp
scoreboard players operation z2 temp = z1 temp
scoreboard players operation x1 temp -= $prime_range spawner_tweaker
scoreboard players operation y1 temp -= $prime_range spawner_tweaker
scoreboard players operation z1 temp -= $prime_range spawner_tweaker
scoreboard players operation x2 temp += $prime_range spawner_tweaker
scoreboard players operation y2 temp += $prime_range spawner_tweaker
scoreboard players operation z2 temp += $prime_range spawner_tweaker

#Compare to player's position and write if success
scoreboard players set pass temp 0
execute if score x temp >= x1 temp if score x temp <= x2 temp run scoreboard players add pass temp 1
execute if score y temp >= y1 temp if score y temp <= y2 temp run scoreboard players add pass temp 1
execute if score z temp >= z1 temp if score z temp <= z2 temp run scoreboard players add pass temp 1
execute if score pass temp matches 3.. unless score $st_ongoing_process temp matches 2.. run data modify storage spawner_tweaker:temp Priming append from storage spawner_tweaker:temp Checking[0]
execute if score pass temp matches 3.. if score $st_ongoing_process temp matches 2.. run data modify storage spawner_tweaker:temp BSE append from storage spawner_tweaker:temp Checking[0]

#Remove and repeat
data remove storage spawner_tweaker:temp Checking[0]
execute if data storage spawner_tweaker:temp Checking[0] run function spawner_tweaker:spawner_priming/range_checker