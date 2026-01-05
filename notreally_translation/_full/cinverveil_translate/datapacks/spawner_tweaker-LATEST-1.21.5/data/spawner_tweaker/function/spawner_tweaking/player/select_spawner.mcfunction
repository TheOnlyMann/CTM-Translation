#Give the player a tag for optimization reasons
tag @s add st_tweaking

#Registering the spawner
function spawner_tweaker:register/register_base

#Creating bossbar. This is... a lot more work than it should be.
$bossbar remove spawner_tweaker_$(tweaker_id)
data modify storage spawner_tweaker:temp name set value {}
data modify storage spawner_tweaker:temp name.jockey set value ""
data modify storage spawner_tweaker:temp name.name set string block ~ ~ ~ SpawnPotentials[0].data.entity.id 10
data modify storage spawner_tweaker:temp name.name set string block ~ ~ ~ SpawnPotentials[0].data.entity.CustomName
data modify storage spawner_tweaker:temp name.name set from block ~ ~ ~ components."minecraft:custom_name"
data modify storage spawner_tweaker:temp name.name set from block ~ ~ ~ components."minecraft:item_name"
execute store result storage spawner_tweaker:temp name.id int 1 run scoreboard players get id temp
function spawner_tweaker:spawner_tweaking/player/count_spawners with storage spawner_tweaker:temp name
data modify storage spawner_tweaker:temp name.tweaker_id set from storage spawner_tweaker:temp variables.tweaker_id
scoreboard players set id_in_name temp 0
execute if data block ~ ~ ~ components."minecraft:custom_data".spawner_tweaker_spawner run scoreboard players set id_in_name temp 1
scoreboard players set displayed_name temp 0
execute if score id_in_name temp matches 0 if data block ~ ~ ~ SpawnPotentials[0].data.entity.Passengers[] run data modify storage spawner_tweaker:temp name.jockey set value " (Jockey)"
scoreboard players set potentials temp 0
execute store result score potentials temp if data block ~ ~ ~ SpawnPotentials[]

#Fix up when the id is in the name
execute if score id_in_name temp matches 1 run function spawner_tweaker:spawner_tweaking/player/fix_id_in_name with storage spawner_tweaker:temp name

#Actually showing the bossbar
execute if score potentials temp matches 2.. if score displayed_name temp matches 0 run function spawner_tweaker:spawner_tweaking/player/bossbars/potentials/core
execute if score id_in_name temp matches 1 if score displayed_name temp matches 0 run function spawner_tweaker:spawner_tweaking/player/bossbars/json_id with storage spawner_tweaker:temp name
execute if score id_in_name temp matches 1 if score displayed_name temp matches 0 run function spawner_tweaker:spawner_tweaking/player/bossbars/text_id with storage spawner_tweaker:temp name
execute if score id_in_name temp matches 0 if score displayed_name temp matches 0 run function spawner_tweaker:spawner_tweaking/player/bossbars/json with storage spawner_tweaker:temp name
execute if score id_in_name temp matches 0 if score displayed_name temp matches 0 if data block ~ ~ ~ SpawnPotentials[0].data.entity.Passengers[] run data modify storage spawner_tweaker:temp name.jockey set value " Jockey"
execute if score id_in_name temp matches 0 if score displayed_name temp matches 0 run function spawner_tweaker:spawner_tweaking/player/bossbars/text with storage spawner_tweaker:temp name

#Check to see if we are spawning new entities or just moving them
scoreboard players set moving temp 0
$execute if entity @e[limit=1,sort=nearest,tag=st_glass,scores={spawner_tweaker_id=$(tweaker_id)}] run scoreboard players set moving temp 1
$execute if score moving temp matches 1 run kill @e[type=!player,type=!interaction,tag=st_multiple_select,scores={spawner_tweaker_id=$(tweaker_id)}]
execute if score moving temp matches 0 run function spawner_tweaker:spawner_tweaking/spawn_displays

#Explanation code and resetting settings
execute if score moving temp matches 0 run scoreboard players set @p[tag=st_holding_ticking,tag=!st_explain] spawner_tweaker_setting 4
execute if score moving temp matches 0 run tellraw @s[tag=!st_explain] {"text":"Spawner marked. Left or Right click to tweak. Crouch+click to change element being tweaked.","color":"white","bold":false,"italic":false}
tag @s add st_explain

#sound
execute at @s run playsound minecraft:block.note_block.hat player @s ~ ~ ~ 1 1
scoreboard players set @s st_swap 0

#Teleports for if this is switching spawners
$execute if score moving temp matches 1.. run tp @e[type=!player,type=!interaction,scores={spawner_tweaker_id=$(tweaker_id)}] ~ ~ ~
$execute if score moving temp matches 1.. run scoreboard players set @e[type=!player,type=!interaction,scores={spawner_tweaker_id=$(tweaker_id)},tag=st_glass] temp 14
