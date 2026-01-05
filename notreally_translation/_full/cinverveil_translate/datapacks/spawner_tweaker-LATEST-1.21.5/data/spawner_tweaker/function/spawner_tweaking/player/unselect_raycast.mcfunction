#Raycasting to see if there is a spawner if the player is selecting a different item slot
execute if block ~ ~ ~ spawner align xyz if entity @e[dx=0,dy=0,dz=0,tag=st_display] run scoreboard players set n temp 0
execute if block ~ ~ ~ spawner align xyz if entity @e[dx=0,dy=0,dz=0,tag=st_display] run tag @s remove st_unload

#Count down and iterate
scoreboard players remove n temp 1
execute if score n temp matches 1.. positioned ^ ^ ^0.5 run function spawner_tweaker:spawner_tweaking/player/unselect_raycast