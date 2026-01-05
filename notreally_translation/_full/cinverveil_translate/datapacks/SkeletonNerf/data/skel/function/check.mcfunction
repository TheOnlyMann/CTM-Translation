tag @s add skel_check

# if the projectile is listed in 'skel/tags/entity_tags/projectiles' and came from a mob listed in 'skel/tags/entity_type/mobs' file AND the mob doesn't have the 'no_nerf' tag, 
# then run the relevant modify function as/at the projectile

scoreboard players set $from_enemy skel_main 0
execute on origin if entity @s[type=#skel:mobs,tag=!no_nerf] run scoreboard players set $from_enemy skel_main 1


# Currently only arrows are affected. Remove the # from below lines for tridents/wind charges, or add your own projectiles/mobs to the entity tags and follow the below examples.


execute if score $from_enemy skel_main matches 1 if entity @s[type=arrow] run function skel:modify/arrow
#execute if score $from_enemy skel_main matches 1 if entity @s[type=trident] run function skel:modify/trident
#execute if score $from_enemy skel_main matches 1 if entity @s[type=breeze_wind_charge] run function skel:modify/wind_charge