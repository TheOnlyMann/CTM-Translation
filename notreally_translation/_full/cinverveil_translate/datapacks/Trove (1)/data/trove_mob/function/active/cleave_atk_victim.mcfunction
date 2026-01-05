

scoreboard players set $step trove_raycast 5
execute anchored eyes facing entity @n[tag=trove.los.target] eyes run function trove:util/los_ray/start
execute if score $success trove_raycast matches 1 run function trove_mob:active/cleave_atk_victim_hit with storage trove:mob
