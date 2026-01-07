execute if entity @s[tag=!dif_check] run function dif:init
execute if entity @s[type=#dif:frames] if score @s dif_invis matches 1 unless data entity @s Item run function dif:kill_frame
