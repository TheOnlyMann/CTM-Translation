#Toggles if the raycast should penetrate blocks

scoreboard players set @s toggle_piercing_spawner_tweaker 0

#Enable
execute if entity @s[tag=!st_no_pierce] run tag @s add st_toggle_flip

execute if entity @s[tag=!st_toggle_flip] run tag @s remove st_no_pierce
execute if entity @s[tag=!st_toggle_flip] run tellraw @p {"color":"green","text":"Spawner tweaker raycast will pierce blocks"}

#Disabled
execute if entity @s[tag=st_toggle_flip] run tag @s add st_no_pierce
execute if entity @s[tag=st_toggle_flip] run tellraw @p {"color":"red","text":"Spawner tweaker raycast will not pierce blocks"}

tag @s remove st_toggle_flip

tellraw @p [{"color":"dark_gray","text":"/trigger toggle_piercing_spawner_tweaker"},{"color":"gray","text":" to update this"}]