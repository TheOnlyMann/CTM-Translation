# Run this function as the player you want to return to a safe spot.

execute store result storage voidr:destination x int 1 run scoreboard players get @s voidr_safe_x
execute store result storage voidr:destination y int 1 run scoreboard players get @s voidr_safe_y
execute store result storage voidr:destination z int 1 run scoreboard players get @s voidr_safe_z
damage @s 5 minecraft:out_of_world
function voidr:return/return_to_safety with storage voidr:destination
