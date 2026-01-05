#Happens on players holding spawners that should be tweaking spawners

#Adjust needed scores and flags
execute if score @s spawner_tweaker_delay matches 1.. run scoreboard players remove @s spawner_tweaker_delay 1

#Move interactions to eyeline
$execute at @s anchored eyes positioned ^ ^ ^ run tp @e[limit=1,sort=nearest,tag=spawner_interaction,tag=bottom,scores={spawner_tweaker_id=$(tweaker_id)}] ~ ~-1.5 ~
$execute at @s anchored eyes positioned ^ ^ ^ run tp @e[limit=1,sort=nearest,tag=spawner_interaction,tag=top,scores={spawner_tweaker_id=$(tweaker_id)}] ~ ~-0.5 ~

#Branch to the display on the spawner
scoreboard players operation setting temp = @s spawner_tweaker_setting
scoreboard players set first_ticking temp 0
$execute as @e[sort=nearest,tag=st_glass,scores={spawner_tweaker_id=$(tweaker_id)}] at @s run function spawner_tweaker:spawner_tweaking/display_tick with block ~ ~ ~

#Unload system if the player swaps slots and isn't looking at a spawner while holding a spawner
scoreboard players set n temp 200
execute store result score @s spawner_tweaker_slot run data get entity @s SelectedItemSlot
execute unless score @s spawner_tweaker_slot = @s spawner_tweaker_slot_prev run tag @s[tag=st_initilize_holding] add st_unload
execute unless score @s spawner_tweaker_slot = @s spawner_tweaker_slot_prev if entity @s[gamemode=!adventure,gamemode=!survival,nbt={SelectedItem:{id:"minecraft:spawner"}},predicate=!spawner_tweaker:shifting,tag=st_initilize_holding] at @s anchored eyes run function spawner_tweaker:spawner_tweaking/player/unselect_raycast
scoreboard players operation @s spawner_tweaker_slot_prev = @s spawner_tweaker_slot
tag @s add st_initilize_holding

#Prompt BSE if you have dropped le spawner
$execute if score @s st_drop_spawner matches 1.. at @e[limit=1,sort=nearest,tag=st_glass,scores={spawner_tweaker_id=$(tweaker_id)}] align xyz positioned ~0.5 ~0.5 ~0.5 run function spawner_tweaker:spawner_tweaking/player/drop_spawner
