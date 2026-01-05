#20hz on 38e349da-d05c-47c9-85c5-dad3300233dc (the display on the spawner)

#Grab spawner data
data modify storage spawner_tweaker:temp spawner set from block ~ ~ ~

#Detect the player being near
tag @s remove st_player_near
$execute if entity @a[distance=..$(RequiredPlayerRange),tag=st_holding_ticking] run tag @s add st_player_near

#Rotatation+color
scoreboard players add @s temp 0
execute if score @s temp matches 1.. run scoreboard players remove @s temp 1
execute if score @s temp matches 0 at @s run rotate @s ~10 ~
execute if score @s temp matches 1 at @s run rotate @s ~30 ~
team join spawner_tweaker_red @s
execute if entity @s[tag=st_player_near] run team join spawner_tweaker_green @s

#Spawn area display
execute store result score temp temp run data get storage spawner_tweaker:temp spawner.SpawnRange 2
scoreboard players add temp temp 1
execute store result storage spawner_tweaker:temp spawner.SpawnVolume float 1.001 run scoreboard players get temp temp
execute store result storage spawner_tweaker:temp spawner.HalfSpawnVolume float 0.5001 run scoreboard players get temp temp
execute unless entity @s[tag=st_player_near] as @e[limit=1,sort=nearest,distance=..1,tag=st_box] run data modify entity @s block_state.Name set value "minecraft:gray_stained_glass"
execute if entity @s[tag=st_player_near] as @e[limit=1,sort=nearest,distance=..1,tag=st_box] run data modify entity @s block_state.Name set value "minecraft:red_stained_glass"
execute store result storage spawner_tweaker:temp spawner.height float 0.0001 run scoreboard players get @s spawner_tweaker_offset
execute as @e[limit=1,sort=nearest,distance=..1,tag=st_box] run function spawner_tweaker:spawner_tweaking/spawn_area with storage spawner_tweaker:temp spawner

#Radius display
execute store result score temp temp run data get storage spawner_tweaker:temp spawner.RequiredPlayerRange 1200
execute store result storage spawner_tweaker:temp temp.scale float 0.0103 run scoreboard players get temp temp
execute store result storage spawner_tweaker:temp temp.y float 0.00135 run scoreboard players get temp temp
execute store result storage spawner_tweaker:temp temp.x float 0.00018 run scoreboard players get temp temp
execute store result storage spawner_tweaker:temp temp.height float 0.0001 run scoreboard players get @s spawner_tweaker_offset
scoreboard players operation temp temp += @s spawner_tweaker_offset
execute as @e[distance=..0.1,tag=st_radius,tag=!st_radius_y] run function spawner_tweaker:spawner_tweaking/radius with storage spawner_tweaker:temp temp
execute as @e[distance=..0.1,tag=st_radius_y] run function spawner_tweaker:spawner_tweaking/radius with storage spawner_tweaker:temp temp

execute if score first_ticking temp matches 1.. as @e[distance=..0.1,tag=st_radius] run data merge entity @s {text:{"text":"⭕","color":"#ee7171","italic":false},text_opacity:80}
execute if score first_ticking temp matches 1.. if entity @s[tag=st_player_near] as @e[distance=..0.1,tag=st_radius] run data merge entity @s {text:{"text":"⭕","color":"#58eb71","italic":false},text_opacity:50}
execute unless score first_ticking temp matches 1.. as @e[distance=..0.1,tag=st_radius] run data merge entity @s {text:{"text":"⭕","color":"red","italic":false},text_opacity:100}
execute unless score first_ticking temp matches 1.. if entity @s[tag=st_player_near] as @e[distance=..0.1,tag=st_radius] run data merge entity @s {text:{"text":"⭕","color":"dark_green","italic":false},text_opacity:60}

#Adjust glass marker
#execute if entity @s[tag=st_player_near] run data merge entity @s {item:{id:"minecraft:green_stained_glass",count:1b}}
#execute if entity @s[tag=!st_player_near] run data merge entity @s {item:{id:"minecraft:red_stained_glass",count:1b}}

#End here if title has already been shown
execute if score first_ticking temp matches 1.. run return 1

#Begin setting up title display
data modify storage spawner_tweaker:temp variables.spawn_count_title set value "white"
data modify storage spawner_tweaker:temp variables.spawn_count_color set value "white"
data modify storage spawner_tweaker:temp variables.max_nearby_title set value "white"
data modify storage spawner_tweaker:temp variables.max_nearby_color set value "white"
data modify storage spawner_tweaker:temp variables.range_title set value "white"
data modify storage spawner_tweaker:temp variables.range_color set value "white"
data modify storage spawner_tweaker:temp variables.player_range_title set value "white"
data modify storage spawner_tweaker:temp variables.player_range_color set value "white"
data modify storage spawner_tweaker:temp variables.delay_title set value "white"
data modify storage spawner_tweaker:temp variables.delay_color set value "white"
data modify storage spawner_tweaker:temp variables.block_light_title set value "white"
data modify storage spawner_tweaker:temp variables.block_light_color set value "white"
data modify storage spawner_tweaker:temp variables.sky_light_title set value "white"
data modify storage spawner_tweaker:temp variables.sky_light_color set value "white"
data modify storage spawner_tweaker:temp variables.spawn_count set from storage spawner_tweaker:temp spawner.SpawnCount
data modify storage spawner_tweaker:temp variables.max_nearby set from storage spawner_tweaker:temp spawner.MaxNearbyEntities
data modify storage spawner_tweaker:temp variables.range set from storage spawner_tweaker:temp spawner.SpawnRange
data modify storage spawner_tweaker:temp variables.player_range set from storage spawner_tweaker:temp spawner.RequiredPlayerRange
execute store result storage spawner_tweaker:temp variables.min_delay int 0.05 run data get storage spawner_tweaker:temp spawner.MinSpawnDelay
execute store result storage spawner_tweaker:temp variables.max_delay int 0.05 run data get storage spawner_tweaker:temp spawner.MaxSpawnDelay
data modify storage spawner_tweaker:temp variables.block_light_min set value "0"
data modify storage spawner_tweaker:temp variables.block_light_max set value "15"
data modify storage spawner_tweaker:temp variables.sky_light_min set value "0"
data modify storage spawner_tweaker:temp variables.sky_light_max set value "15"
data modify storage spawner_tweaker:temp variables.block_light_min set from storage spawner_tweaker:temp spawner.SpawnPotentials[0].data.custom_spawn_rules.block_light_limit[0]
data modify storage spawner_tweaker:temp variables.block_light_max set from storage spawner_tweaker:temp spawner.SpawnPotentials[0].data.custom_spawn_rules.block_light_limit[1]
data modify storage spawner_tweaker:temp variables.sky_light_min set from storage spawner_tweaker:temp spawner.SpawnPotentials[0].data.custom_spawn_rules.sky_light_limit[0]
data modify storage spawner_tweaker:temp variables.sky_light_max set from storage spawner_tweaker:temp spawner.SpawnPotentials[0].data.custom_spawn_rules.sky_light_limit[1]

#Adjust color of titles as needed
execute if score setting temp matches 1 run data modify storage spawner_tweaker:temp variables.spawn_count_title set value "light_purple"
execute if score setting temp matches 1 run data modify storage spawner_tweaker:temp variables.spawn_count_color set value "green"
execute if score setting temp matches 2 run data modify storage spawner_tweaker:temp variables.max_nearby_title set value "light_purple"
execute if score setting temp matches 2 run data modify storage spawner_tweaker:temp variables.max_nearby_color set value "green"
execute if score setting temp matches 3 run data modify storage spawner_tweaker:temp variables.range_title set value "light_purple"
execute if score setting temp matches 3 run data modify storage spawner_tweaker:temp variables.range_color set value "green"
execute if score setting temp matches 4 run data modify storage spawner_tweaker:temp variables.player_range_title set value "light_purple"
execute if score setting temp matches 4 run data modify storage spawner_tweaker:temp variables.player_range_color set value "green"
execute if score setting temp matches 5 run data modify storage spawner_tweaker:temp variables.delay_title set value "light_purple"
execute if score setting temp matches 5 run data modify storage spawner_tweaker:temp variables.delay_color set value "green"
execute if score setting temp matches 6 run data modify storage spawner_tweaker:temp variables.block_light_title set value "light_purple"
execute if score setting temp matches 6 run data modify storage spawner_tweaker:temp variables.block_light_color set value "green"
execute if score setting temp matches 7 run data modify storage spawner_tweaker:temp variables.sky_light_title set value "light_purple"
execute if score setting temp matches 7 run data modify storage spawner_tweaker:temp variables.sky_light_color set value "green"

#Run titles
execute as @a[limit=1,sort=nearest,tag=st_holding_ticking] run function spawner_tweaker:spawner_tweaking/hotbar_display with storage spawner_tweaker:temp variables

#Flag
scoreboard players set first_ticking temp 1
