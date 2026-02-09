scoreboard players set $thrower dif_temp 0
execute on origin if entity @s[type=minecraft:player] run scoreboard players set $thrower dif_temp 1
execute if score $thrower dif_temp matches 0 run kill @s[type=minecraft:item]