#Kills id displays if there isn't a nearby player
execute as @e[tag=st_id_display,tag=!interpolated] run data merge entity @s {interpolation_duration:10,start_interpolation:-1,transformation:[1.4f,0f,0f,0f,0f,1.4f,0f,0f,0f,0f,1.4f,0f,0f,0f,0f,1f]}
execute as @e[tag=st_id_display,tag=!interpolated] run tag @s add interpolated
execute as @e[tag=st_id_display] at @s unless entity @a[distance=..32,gamemode=!survival,gamemode=!adventure] run kill @s
execute if entity @e[tag=st_id_display,limit=1] run schedule function spawner_tweaker:register/kill_id_displays 19t