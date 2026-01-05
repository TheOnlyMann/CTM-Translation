#Removes a specific spawner id, run with appropriate storage
scoreboard players set remove temp 0
$execute store success score remove temp run data remove storage spawner_tweaker:temp Ids[{id:$(id)}]
$data remove storage spawner_tweaker:temp Spawners[{id:$(id)}]
scoreboard players set @s delete_spawner_id -1
$execute if score remove temp matches 1.. run tellraw @s[tag=!st_transformer] [{"color":"red","text":"Removed "},{"color":"gray","text":"[ID:"},{"color":"gold","text":"$(id)"},{"color":"gray","text":"]"}," as well as all registered spawner locations under that id"]
$execute if score remove temp matches 1.. run tellraw @s[tag=st_transformer] [{"color":"green","text":"Transformation was completed and "},{"color":"gray","text":"[ID:"},{"color":"gold","text":"$(id)"},{"color":"gray","text":"]"}," was removed"]
execute unless score remove temp matches 1.. run tellraw @s [{"color":"dark_red","text":"That spawner id does not exist so it could not be removed."}]
execute unless score remove temp matches 1.. run playsound block.note_block.didgeridoo master @s ~ ~ ~ 1 1


#flags
execute as @s[tag=st_transformer] store result storage spawner_tweaker:temp variables.tweaker_id long 1 run scoreboard players get @s spawner_tweaker_id
execute as @s[tag=st_transformer] run function spawner_tweaker:spawner_tweaking/player/unselect_spawner with storage spawner_tweaker:temp variables
tag @a remove st_transformer
