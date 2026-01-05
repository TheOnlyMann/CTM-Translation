

scoreboard players enable @a shanger.trigger
execute as @a[scores={shanger.trigger=1..}] at @s run function shanger:trigger
#execute positioned 9.39 89.00 -20.37 if entity @p[distance=..20] run function shanger:place_wool/monument_check

execute if score .correct_wools shanger.data matches 8.. if score .win_message shanger.data matches 0 run scoreboard players set .win_message shanger.data 1
### WOOL EFFECT

execute as @e[type=item_display,tag=shanger.obj] at @s run particle minecraft:ominous_spawning ~ ~ ~ 0.25 0.25 0.25 1 3

########## WIN MESSAGE

execute if score .win_message shanger.data matches 1..281 run scoreboard players add .win_message shanger.data 1
execute if score .win_message shanger.data matches 1..281 run function shanger:place_wool/win_message

execute as @a[tag=!shanger.init] at @s run function shanger:player_init

execute as @a[gamemode=survival] at @s if items entity @s weapon.mainhand minecraft:water_bucket run item replace entity @s weapon.mainhand with minecraft:powder_snow_bucket
execute as @a[gamemode=survival] at @s if items entity @s weapon.offhand minecraft:water_bucket run item replace entity @s weapon.offhand with minecraft:powder_snow_bucket

####Orange Wool Puzzle (Very Hard)

execute if block 358 46 -98 minecraft:blue_glazed_terracotta if block 358 46 -94 minecraft:red_glazed_terracotta unless score .tutorial_puzzle shanger.data matches 1 run function shanger:place_wool/tutorial/unlock

######## Spawner Breaking Milestone

execute as @a[scores={mine_spawner=1..}] at @s run function shanger:spawner_milestone/mine_spawner



#############SCRAP 

