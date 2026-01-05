#Compares a spawner to existing ids to find out if it exists or not.
scoreboard players set not_new temp 0
data remove storage spawner_tweaker:temp compare_ids[0].SpawnPotentials[0].data.custom_spawn_rules
data remove storage spawner_tweaker:temp compare_ids[0].SpawnPotentials[1].data.custom_spawn_rules
data remove storage spawner_tweaker:temp compare_ids[0].SpawnPotentials[2].data.custom_spawn_rules
data remove storage spawner_tweaker:temp compare_ids[0].SpawnPotentials[3].data.custom_spawn_rules
data remove storage spawner_tweaker:temp compare_ids[0].SpawnPotentials[4].data.custom_spawn_rules
data remove storage spawner_tweaker:temp compare_ids[0].SpawnPotentials[5].data.custom_spawn_rules
data remove storage spawner_tweaker:temp compare_ids[0].SpawnPotentials[6].data.custom_spawn_rules
data remove storage spawner_tweaker:temp compare_ids[0].SpawnPotentials[7].data.custom_spawn_rules
data remove storage spawner_tweaker:temp compare_ids[0].SpawnPotentials[8].data.custom_spawn_rules
execute store success score not_new temp run data modify storage spawner_tweaker:temp compare_ids[0].SpawnPotentials set from storage spawner_tweaker:temp physical_spawner.SpawnPotentials

scoreboard players add id temp 1
execute if score not_new temp matches 0 store result score id temp run data get storage spawner_tweaker:temp compare_ids[0].id
data remove storage spawner_tweaker:temp compare_ids[0]
scoreboard players remove n temp 1
execute if score not_new temp matches 1.. if score n temp matches 1.. run function spawner_tweaker:register/compare_ids