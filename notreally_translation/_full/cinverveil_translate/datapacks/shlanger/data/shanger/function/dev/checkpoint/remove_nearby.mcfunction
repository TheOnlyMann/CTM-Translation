
execute as @n[type=interaction,tag=shanger.cp,distance=..16] at @s run kill @e[type=block_display,tag=shanger.cp.disp,limit=9,sort=nearest,distance=..2]
execute as @n[type=interaction,tag=shanger.cp,distance=..16] at @s run setblock ~ ~ ~ air
execute as @n[type=interaction,tag=shanger.cp,distance=..16] at @s run kill @s