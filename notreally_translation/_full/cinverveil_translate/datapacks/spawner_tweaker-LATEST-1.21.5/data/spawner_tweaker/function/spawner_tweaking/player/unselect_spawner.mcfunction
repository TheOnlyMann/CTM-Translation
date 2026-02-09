#Happens whenever the player shouldn't be in tweaking mode anymore
#Unloads entities and removes tags
$execute if entity @e[limit=1,sort=nearest,tag=st_display,scores={spawner_tweaker_id=$(tweaker_id)}] run playsound minecraft:entity.player.attack.weak player @s ~ ~ ~ 1 0.6
$kill @e[type=!player,scores={spawner_tweaker_id=$(tweaker_id)}]
scoreboard players add @e[tag=st_display] spawner_tweaker_id 0
kill @e[tag=st_display,type=!player,scores={spawner_tweaker_id=0}]
scoreboard players set @s[tag=st_reset_settings] spawner_tweaker_setting 4
$bossbar remove spawner_tweaker_$(tweaker_id)
tag @s remove st_tweaking
tag @s remove st_unload
tag @s remove st_holding_spawner
tag @s remove st_initilize_holding
scoreboard players set @s spawner_tweaker_delay 0
