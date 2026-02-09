#20hz on an arbitrary player holding a spawner

#Mark the player for most operations
tag @s add st_holding_ticking

#Setting the player's id if they have none
execute unless score @s spawner_tweaker_id matches 1.. unless score @s spawner_tweaker_id matches ..1 store result score @s spawner_tweaker_id run data get entity @s UUID[0]
execute store result storage spawner_tweaker:temp variables.tweaker_id long 1 run scoreboard players operation tweaker_id spawner_tweaker = @s spawner_tweaker_id

#Run if the player is currently tweaking spawners
execute if entity @s[tag=st_tweaking] run function spawner_tweaker:spawner_tweaking/player/tweaking with storage spawner_tweaker:temp variables

#Raycasting, my beloved (finds spawner)
scoreboard players set n temp 200
execute at @s anchored eyes run function spawner_tweaker:spawner_tweaking/player/raycast
execute if score n temp matches 0 run scoreboard players set @s st_swap 0

#Unmark procedure
execute if score timer st_priming matches 1.. run tag @s add st_unload
execute if score bse_timer st_priming matches 1.. run tag @s add st_unload
execute unless entity @s[gamemode=!adventure,gamemode=!survival,nbt={SelectedItem:{id:"minecraft:spawner"}}] run tag @s add st_unload
execute if entity @s[tag=st_unload] run function spawner_tweaker:spawner_tweaking/player/unselect_spawner with storage spawner_tweaker:temp variables

#Flag for operations
tag @s remove st_holding_ticking
