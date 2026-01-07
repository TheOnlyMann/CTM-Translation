#Happens when a spawner needs to be registered under a new id

#Find the next id
execute store result storage spawner_tweaker:temp variables.id int 1 run scoreboard players set id temp 0
function spawner_tweaker:register/find_next_id with storage spawner_tweaker:temp variables

#Write data to new id
data modify storage spawner_tweaker:temp id set from block ~ ~ ~
execute store result storage spawner_tweaker:temp id.id int 1 run scoreboard players get id temp
data modify storage spawner_tweaker:temp id.Delay set value 0s
data remove storage spawner_tweaker:temp id.x
data remove storage spawner_tweaker:temp id.y
data remove storage spawner_tweaker:temp id.z
data remove storage spawner_tweaker:temp id.SpawnData

#Get the name (pain)
scoreboard players set name temp 0
execute if data storage spawner_tweaker:temp id.SpawnPotentials[0].data.entity.CustomName run scoreboard players set name temp 1
execute if data storage spawner_tweaker:temp id.components."minecraft:custom_name" unless data storage spawner_tweaker:temp id.components."minecraft:custom_data".spawner_tweaker_spawner run scoreboard players set name temp 2
execute if data storage spawner_tweaker:temp id.components."minecraft:item_name" run scoreboard players set name temp 3
execute store result storage spawner_tweaker:temp variables.id int 1 run data get storage spawner_tweaker:temp id.id
execute if score name temp matches 0 run data modify storage spawner_tweaker:temp id.name set string storage spawner_tweaker:temp id.SpawnPotentials[0].data.entity.id 10
execute if score name temp matches 1 run data modify storage spawner_tweaker:temp id.name set string storage spawner_tweaker:temp id.SpawnPotentials[0].data.entity.CustomName
execute if score name temp matches 2 run data modify storage spawner_tweaker:temp id.name set from storage spawner_tweaker:temp id.components."minecraft:custom_name"
execute if score name temp matches 3 run data modify storage spawner_tweaker:temp id.name set from storage spawner_tweaker:temp id.components."minecraft:item_name"

#Write new id to ids storage
data modify storage spawner_tweaker:temp Ids append from storage spawner_tweaker:temp id

#Giving spawner
data modify storage spawner_tweaker:temp give set value {}
data modify storage spawner_tweaker:temp give.id set from storage spawner_tweaker:temp id.id
execute at @s run function spawner_tweaker:give_spawners/read_id with storage spawner_tweaker:temp give

#Bells and wistles
playsound minecraft:block.trial_spawner.spawn_mob master @s ~ ~ ~ 1 0.8
playsound item.firecharge.use master @s ~ ~ ~ 0.8 0.5

scoreboard players set said_name temp 0
execute if score said_name temp matches 0 run function spawner_tweaker:register/give_name_1 with storage spawner_tweaker:temp id
execute if score said_name temp matches 0 run function spawner_tweaker:register/give_name_2 with storage spawner_tweaker:temp id

scoreboard players set y temp -90
scoreboard players set x temp 0
execute align xyz positioned ~0.5 ~0.5 ~0.5 rotated 0 -90 run function spawner_tweaker:register/register_particle_loop