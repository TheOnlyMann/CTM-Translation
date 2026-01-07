#Ticks and kills displays
scoreboard players add @e[tag=st_primer,type=item_display] prime_spawners 1
kill @e[tag=st_primer,tag=!st_highlight,type=item_display,scores={prime_spawners=60..}]
execute as @e[tag=st_highlight] if score @s prime_spawners >= $st_highlight_time temp run kill @s
execute if entity @e[tag=st_primer,type=item_display,limit=1] run schedule function spawner_tweaker:spawner_priming/kill_displays 1t