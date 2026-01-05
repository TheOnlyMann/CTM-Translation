execute if block ~ ~ ~ #trove:solid run scoreboard players set $success trove_raycast 0
execute if score $success trove_raycast matches 0 run scoreboard players set $step trove_raycast 0


execute if entity @n[tag=trove.los.target,distance=..0.25] run scoreboard players set $step trove_raycast 0


scoreboard players remove $step trove_raycast 1
execute if score $step trove_raycast matches 1.. positioned ^ ^ ^0.25 run function trove:util/los_ray/step