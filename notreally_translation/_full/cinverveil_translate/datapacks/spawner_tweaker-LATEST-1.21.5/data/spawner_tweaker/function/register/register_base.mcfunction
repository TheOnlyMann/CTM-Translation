#Run this at a position to register the spawner into the id and priming systems

#Write spawn potentials to the spawner if none exist
execute unless data block ~ ~ ~ SpawnPotentials[0] run function spawner_tweaker:register/write_potentials

#Fix light data, if none exist
execute unless data block ~ ~ ~ SpawnData.custom_spawn_rules run data modify block ~ ~ ~ SpawnData.custom_spawn_rules set value {block_light_limit:[I;0,7]}
execute unless data block ~ ~ ~ SpawnPotentials[0].data.custom_spawn_rules run data modify block ~ ~ ~ SpawnPotentials[0].data.custom_spawn_rules set value {block_light_limit:[I;0,7]}
execute unless data block ~ ~ ~ SpawnPotentials[1].data.custom_spawn_rules run data modify block ~ ~ ~ SpawnPotentials[1].data.custom_spawn_rules set value {block_light_limit:[I;0,7]}
execute unless data block ~ ~ ~ SpawnPotentials[2].data.custom_spawn_rules run data modify block ~ ~ ~ SpawnPotentials[2].data.custom_spawn_rules set value {block_light_limit:[I;0,7]}
execute unless data block ~ ~ ~ SpawnPotentials[3].data.custom_spawn_rules run data modify block ~ ~ ~ SpawnPotentials[3].data.custom_spawn_rules set value {block_light_limit:[I;0,7]}

#Fix scuffed light data if need be
scoreboard players set scuffed_light temp 0
execute if data block ~ ~ ~ SpawnData.custom_spawn_rules{sky_light_limit:0} run scoreboard players set scuffed_light temp 1
execute if score scuffed_light temp matches 1 if data block ~ ~ ~ SpawnData.custom_spawn_rules{sky_light_limit:0} run data remove block ~ ~ ~ SpawnData.custom_spawn_rules.sky_light_limit
execute if score scuffed_light temp matches 1 if data block ~ ~ ~ SpawnPotentials[0].data.custom_spawn_rules{sky_light_limit:0} run data remove block ~ ~ ~ SpawnPotentials[0].data.custom_spawn_rules.sky_light_limit
execute if score scuffed_light temp matches 1 if data block ~ ~ ~ SpawnPotentials[1].data.custom_spawn_rules{sky_light_limit:0} run data remove block ~ ~ ~ SpawnPotentials[1].data.custom_spawn_rules.sky_light_limit
execute if score scuffed_light temp matches 1 if data block ~ ~ ~ SpawnPotentials[2].data.custom_spawn_rules{sky_light_limit:0} run data remove block ~ ~ ~ SpawnPotentials[2].data.custom_spawn_rules.sky_light_limit
execute if score scuffed_light temp matches 1 if data block ~ ~ ~ SpawnPotentials[3].data.custom_spawn_rules{sky_light_limit:0} run data remove block ~ ~ ~ SpawnPotentials[3].data.custom_spawn_rules.sky_light_limit

#Getting the relevant positioning information
summon marker ~ ~ ~ {UUID:[I;-1549706688,1223903313,-1879781877,1584575981]}
data modify storage spawner_tweaker:temp Spawner set value {Pos:[0.0d,0.0d,0.0d],dimension:"minecraft:overworld"}
data modify storage spawner_tweaker:temp Spawner.Pos set from entity a3a15a40-48f3-4851-8ff4-ce0b5e72b5ed Pos
data modify storage spawner_tweaker:temp Spawner.dimension set from entity @s Dimension
kill a3a15a40-48f3-4851-8ff4-ce0b5e72b5ed

#Checking if a spawner already exists here
data modify storage spawner_tweaker:temp Comparison set value {}
function spawner_tweaker:register/check_spawner with storage spawner_tweaker:temp Spawner

#If a spawner does exist, grab the physical spawner's id to compare
scoreboard players set old_id temp -1
execute if score exists temp matches 1.. store result score old_id temp run data get storage spawner_tweaker:temp Comparison.id
scoreboard players set id temp -1
execute if score exists temp matches 0 if score $st_ongoing_process temp matches 4 run scoreboard players add spawners_found st_volume 1

scoreboard players set register_new temp 1
data modify storage spawner_tweaker:temp physical_spawner set value {SpawnPotentials:[]}
data modify storage spawner_tweaker:temp physical_spawner.SpawnPotentials set from block ~ ~ ~ SpawnPotentials
data remove storage spawner_tweaker:temp physical_spawner.SpawnPotentials[0].data.custom_spawn_rules
data remove storage spawner_tweaker:temp physical_spawner.SpawnPotentials[1].data.custom_spawn_rules
data remove storage spawner_tweaker:temp physical_spawner.SpawnPotentials[2].data.custom_spawn_rules
data remove storage spawner_tweaker:temp physical_spawner.SpawnPotentials[3].data.custom_spawn_rules
data remove storage spawner_tweaker:temp physical_spawner.SpawnPotentials[4].data.custom_spawn_rules
data remove storage spawner_tweaker:temp physical_spawner.SpawnPotentials[5].data.custom_spawn_rules
data remove storage spawner_tweaker:temp physical_spawner.SpawnPotentials[6].data.custom_spawn_rules
data remove storage spawner_tweaker:temp physical_spawner.SpawnPotentials[7].data.custom_spawn_rules
data remove storage spawner_tweaker:temp physical_spawner.SpawnPotentials[8].data.custom_spawn_rules
data modify storage spawner_tweaker:temp compare_ids set value []
data modify storage spawner_tweaker:temp compare_ids set from storage spawner_tweaker:temp Ids
scoreboard players set n temp 0
scoreboard players set not_new temp 1
execute store result score n temp if data storage spawner_tweaker:temp Ids[{}]
execute if score n temp matches 1.. run function spawner_tweaker:register/compare_ids
execute if score not_new temp matches 0 run scoreboard players set register_new temp 0

#Force a new register if player clicked the chat prompt
execute if entity @s[tag=st_new_spawner] unless score not_new temp matches 0 run scoreboard players set exists temp 0
execute if entity @s[tag=st_new_spawner] unless score not_new temp matches 0 run scoreboard players set register_new temp 1

#Automatically register this as a new id if it isn't where a previous spawner was
execute if score exists temp matches 0 if score register_new temp matches 1 if score $st_ongoing_process temp matches 4 run scoreboard players add ids_found st_volume 1
execute if score exists temp matches 0 if score register_new temp matches 1 run function spawner_tweaker:register/register_new_id with block ~ ~ ~
execute store result storage spawner_tweaker:temp Spawner.id int 1 run scoreboard players get id temp
execute if score exists temp matches 0 run function spawner_tweaker:spawner_priming/prune with storage spawner_tweaker:temp Spawner
execute if score exists temp matches 0 run data modify storage spawner_tweaker:temp Spawners prepend from storage spawner_tweaker:temp Spawner
execute if score exists temp matches 0 if score not_new temp matches 0 run particle minecraft:trial_spawner_detection ~ ~ ~ 0.7 0.7 0.7 0 20 force @s
execute if score exists temp matches 0 if score not_new temp matches 0 run particle minecraft:trial_spawner_detection ~ ~ ~ 0.7 0.7 0.7 0 20 normal @s
execute if score exists temp matches 0 if score not_new temp matches 0 run playsound minecraft:block.trial_spawner.detect_player master @s ~ ~ ~ 1 0.8
execute if score exists temp matches 0 run scoreboard players set spawner_found temp 1

#If a spawner here exists, and this is a new id, ask if it ought to be registered
execute if score exists temp matches 1 if score not_new temp matches 1 if entity @s[tag=!st_searching] run function spawner_tweaker:register/count_spawners with storage spawner_tweaker:temp Comparison
execute if score exists temp matches 1 if score not_new temp matches 1 if entity @s[tag=!st_searching] run function spawner_tweaker:register/prompt_bse with storage spawner_tweaker:temp Comparison

#If a spawner is here, but it just needs an updated id, do that.
execute if score exists temp matches 1 if score not_new temp matches 0 run function spawner_tweaker:spawner_priming/prune with storage spawner_tweaker:temp Spawner
execute if score exists temp matches 1 if score not_new temp matches 0 run data modify storage spawner_tweaker:temp Spawners prepend from storage spawner_tweaker:temp Spawner

#Make the display
function spawner_tweaker:register/get_id with storage spawner_tweaker:temp Spawner
execute if entity @s[tag=st_holding_ticking] if score exists temp matches 1 if score not_new temp matches 0 align xyz positioned ~0.5 ~0.8 ~0.5 run kill @e[distance=..1,limit=1,sort=nearest,tag=st_id_display]
execute positioned ~ ~0.6 ~ if block ~ ~ ~ #spawner_tweaker:raycastable unless entity @e[distance=..0.1,tag=st_id_display] run summon text_display ~ ~ ~ {billboard:"center",start_interpolation:0,interpolation_duration:10,see_through:1b,alignment:"center",Tags:["st_id_display"],brightness:{sky:15,block:15},transformation:[0.1f,0f,0f,0f,0f,0.1f,0f,0f,0f,0f,0.1f,0f,0f,0f,0f,1f],text:[{"color":"aqua","text":"ID "},{"score":{"name":"id","objective":"temp"}}],background:1677721600}
execute positioned ~ ~0.6 ~ unless block ~ ~ ~ #spawner_tweaker:raycastable positioned ~ ~-0.75 ~ unless entity @e[distance=..0.1,tag=st_id_display] run summon text_display ~ ~ ~ {billboard:"center",start_interpolation:0,interpolation_duration:10,see_through:1b,alignment:"center",Tags:["st_id_display","in_spawner"],brightness:{sky:15,block:15},transformation:[0.1f,0f,0f,0f,0f,0.1f,0f,0f,0f,0f,0.1f,0f,0f,0f,0f,1f],text:[{"color":"aqua","text":"ID "},{"score":{"name":"id","objective":"temp"}}],background:1677721600}
execute positioned ~ ~0.6 ~ if block ~ ~ ~ #spawner_tweaker:raycastable run scoreboard players operation @e[distance=..0.1,tag=st_id_display] spawner_tweaker_id = id temp
execute positioned ~ ~0.6 ~ unless block ~ ~ ~ #spawner_tweaker:raycastable positioned ~ ~-0.75 ~ run scoreboard players operation @e[distance=..0.1,tag=st_id_display] spawner_tweaker_id = id temp

schedule function spawner_tweaker:register/kill_id_displays 2t