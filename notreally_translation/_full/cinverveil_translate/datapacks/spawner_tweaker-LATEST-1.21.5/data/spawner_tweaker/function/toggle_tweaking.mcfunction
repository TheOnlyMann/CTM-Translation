#Toggles if tweaker is on or off for this individual

scoreboard players set @s toggle_spawner_tweaker -999

#Enable
execute if entity @s[tag=st_enabled] run tag @s add st_disable
execute if entity @s[tag=!st_enabled] run tag @s remove st_disabled
execute if entity @s[tag=!st_enabled] run tellraw @p {"color":"green","text":"Spawner tweaker enabled"}
execute if entity @s[tag=!st_enabled] run tag @s add st_enabled

#Disabled
execute if entity @s[tag=st_disable] run tag @s remove st_enabled
execute if entity @s[tag=st_disable] run tag @s add st_disabled
execute if entity @s[tag=st_disable] run tellraw @p {"color":"red","text":"Spawner tweaker disabled"}

tag @s remove st_disable

tellraw @p [{"color":"dark_gray","text":"/trigger toggle_spawner_tweaker"},{"color":"gray","text":" to update this"}]