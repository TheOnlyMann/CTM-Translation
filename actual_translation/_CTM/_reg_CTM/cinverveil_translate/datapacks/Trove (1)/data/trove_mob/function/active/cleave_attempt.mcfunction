scoreboard players set $step trove_raycast 8
execute on target run tag @s add trove.los.target
execute anchored eyes facing entity @n[tag=trove.los.target] eyes run function trove:util/los_ray/start
execute on target run tag @s remove trove.los.target


execute if score $success trove_raycast matches 0 run scoreboard players operation @s trove_mob_tick -= @s trove_mob_init_retry
execute if score $success trove_raycast matches 1 run scoreboard players add $buffer trove_mob_tick 1