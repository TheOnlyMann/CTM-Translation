execute if entity @s[type=#dif:frames] store result score @s dif_invis run data get entity @s Invisible
execute if entity @s[type=minecraft:item_frame] if score @s dif_invis matches 1 run function dif:replace/repl_start
execute if entity @s[type=minecraft:item] if entity @s[nbt={Item:{id:"minecraft:glow_item_frame"}}] run function dif:kill_item

tag @s add dif_check