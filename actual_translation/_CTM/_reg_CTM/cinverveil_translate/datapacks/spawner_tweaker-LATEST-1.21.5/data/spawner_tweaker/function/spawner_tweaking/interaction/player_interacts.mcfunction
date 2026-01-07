#Happens when the player interacts with the spawner interaction

#First, remove advancements
scoreboard players set lc temp 0
scoreboard players set rc temp 0
execute if entity @s[advancements={spawner_tweaker:lc_interaction=true}] run scoreboard players set lc temp 1
execute if entity @s[advancements={spawner_tweaker:rc_interaction=true}] run scoreboard players set rc temp 1
advancement revoke @s only spawner_tweaker:lc_interaction
advancement revoke @s only spawner_tweaker:rc_interaction

#Second, assign relevant flags
tag @s add st_holding_ticking
execute unless score @s spawner_tweaker_id matches 1.. unless score @s spawner_tweaker_id matches ..1 store result score @s spawner_tweaker_id run data get entity @s UUID[0]
execute store result storage spawner_tweaker:temp variables.tweaker_id long 1 run scoreboard players operation tweaker_id spawner_tweaker = @s spawner_tweaker_id
scoreboard players set sneak temp 0
execute if entity @s[predicate=spawner_tweaker:shifting] run scoreboard players set sneak temp 1

#Next, cycle through options if needed
execute if score sneak temp matches 1.. if score lc temp matches 1.. run scoreboard players remove @s spawner_tweaker_setting 1
execute if score sneak temp matches 1.. if score rc temp matches 1.. run scoreboard players add @s spawner_tweaker_setting 1
execute if score sneak temp matches 1.. if score lc temp matches 1.. if score @s spawner_tweaker_setting matches ..0 run scoreboard players set @s spawner_tweaker_setting 7
execute if score sneak temp matches 1.. if score rc temp matches 1.. if score @s spawner_tweaker_setting matches 8.. run scoreboard players set @s spawner_tweaker_setting 1
execute if score sneak temp matches 1.. if score lc temp matches 1.. run playsound minecraft:block.note_block.hat master @s ~ ~ ~ 1 0.7
execute if score sneak temp matches 1.. if score rc temp matches 1.. run playsound minecraft:block.note_block.hat master @s ~ ~ ~ 1 1
scoreboard players operation setting temp = @s spawner_tweaker_setting

#Finally, branch to actual clicking
scoreboard players set first_ticking temp 0
execute if score sneak temp matches 0 if score lc temp matches 1.. as @e[tag=st_glass] if score @s spawner_tweaker_id = tweaker_id spawner_tweaker at @s run function spawner_tweaker:spawner_tweaking/interaction/left_click
execute if score sneak temp matches 0 if score rc temp matches 1.. as @e[tag=st_glass] if score @s spawner_tweaker_id = tweaker_id spawner_tweaker at @s run function spawner_tweaker:spawner_tweaking/interaction/right_click
execute if score sneak temp matches 0 if score lc temp matches 1.. run playsound minecraft:block.note_block.pling master @s ~ ~ ~ 1 1
execute if score sneak temp matches 0 if score rc temp matches 1.. run playsound minecraft:block.note_block.pling master @s ~ ~ ~ 1 2

#Remove any flags
tag @s remove st_holding_ticking
