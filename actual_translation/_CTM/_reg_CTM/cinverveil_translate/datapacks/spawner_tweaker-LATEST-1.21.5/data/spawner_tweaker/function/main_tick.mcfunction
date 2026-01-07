#Central ticking for the spawner tweaker datapack

#Failsafe for dummies
execute if score $search_range spawner_tweaker matches 15.. run scoreboard players set $search_range spawner_tweaker 15

#Branching
execute as @a[gamemode=creative] at @s run function spawner_tweaker:player_tick
execute as @a[tag=st_holding_spawner] at @s run function spawner_tweaker:spawner_tweaking/player/holding_spawner

#Main tweaker processes
execute if score timer st_priming matches 1.. run function spawner_tweaker:spawner_priming/tick
execute if score bse_timer st_priming matches 1.. run function spawner_tweaker:bulk_edit/tick
execute if score volume_timer st_priming matches 1.. run function spawner_tweaker:search/volume/process/core
execute if score transform_timer st_priming matches 1.. run function spawner_tweaker:transform/tick
execute if score random_timer st_priming matches 1.. run function spawner_tweaker:randomizer/tick
execute if score chest_random_timer st_priming matches 1.. run function spawner_tweaker:chests/randomizer/tick

#Failsafes
scoreboard players set @a st_drop_spawner 0

#Visualizing volumes
scoreboard players add $st_1s_timer temp 1
execute if score $st_1s_timer temp matches 20.. run function spawner_tweaker:search/volume/visualize