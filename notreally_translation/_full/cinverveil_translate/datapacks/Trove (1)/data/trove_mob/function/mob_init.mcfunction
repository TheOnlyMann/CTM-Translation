# In ticks:
#   Telegraph = How long the wind up for the attack should be
#   Cooldown = After making an attack, set the cooldown to this
#   Retry = If the attack attempt fails (e.g. line of sight broken), how long to wait before retrying
#   Startup = Amount of cooldown a mob should have to start with once spawned


tag @s add trove.mob.init

scoreboard players set @s trove_mob_init_telegraph 0
scoreboard players set @s trove_mob_init_cooldown 0
scoreboard players set @s trove_mob_init_retry 0
scoreboard players set @s trove_mob_init_startup 0
scoreboard players set @s trove_mob_init_damage 0 


execute if entity @s[tag=trove.mob.cleave] run function trove_mob:init/cleave_init
execute if entity @s[tag=trove.mob.imprison] run function trove_mob:init/imprison_init



scoreboard players add @s trove_mob_tick 0
scoreboard players operation @s trove_mob_tick -= @s trove_mob_init_startup

scoreboard players add @s trove_mob_init_damage 0
execute if score @s trove_mob_init_damage matches 0 run execute store result score @s trove_mob_init_damage run attribute @s minecraft:attack_damage get 1.5
