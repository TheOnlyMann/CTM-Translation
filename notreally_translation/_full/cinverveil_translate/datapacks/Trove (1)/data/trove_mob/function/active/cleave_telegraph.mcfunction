rotate @s facing entity @p[tag=trove.target.player] feet

execute if score @s trove_mob_tick matches 1 run function trove_mob:fx/s/cleave_telegraph

execute at @s rotated ~30 ~10 positioned ~ ~1 ~ positioned ^ ^ ^1 run function trove_mob:fx/p/cleave_telegraph
execute at @s rotated ~30 ~10 positioned ~ ~1 ~ positioned ^ ^ ^2 run function trove_mob:fx/p/cleave_telegraph
execute at @s rotated ~30 ~10 positioned ~ ~1 ~ positioned ^ ^ ^3 run function trove_mob:fx/p/cleave_telegraph
execute at @s rotated ~30 ~10 positioned ~ ~1 ~ positioned ^ ^ ^4 run function trove_mob:fx/p/cleave_telegraph

execute at @s rotated ~10 ~10 positioned ~ ~1 ~ positioned ^ ^ ^1 run function trove_mob:fx/p/cleave_telegraph
execute at @s rotated ~10 ~10 positioned ~ ~1 ~ positioned ^ ^ ^2 run function trove_mob:fx/p/cleave_telegraph
execute at @s rotated ~10 ~10 positioned ~ ~1 ~ positioned ^ ^ ^3 run function trove_mob:fx/p/cleave_telegraph
execute at @s rotated ~10 ~10 positioned ~ ~1 ~ positioned ^ ^ ^4 run function trove_mob:fx/p/cleave_telegraph

execute at @s rotated ~-10 ~10 positioned ~ ~1 ~ positioned ^ ^ ^1 run function trove_mob:fx/p/cleave_telegraph
execute at @s rotated ~-10 ~10 positioned ~ ~1 ~ positioned ^ ^ ^2 run function trove_mob:fx/p/cleave_telegraph
execute at @s rotated ~-10 ~10 positioned ~ ~1 ~ positioned ^ ^ ^3 run function trove_mob:fx/p/cleave_telegraph
execute at @s rotated ~-10 ~10 positioned ~ ~1 ~ positioned ^ ^ ^4 run function trove_mob:fx/p/cleave_telegraph

execute at @s rotated ~-30 ~10 positioned ~ ~1 ~ positioned ^ ^ ^1 run function trove_mob:fx/p/cleave_telegraph
execute at @s rotated ~-30 ~10 positioned ~ ~1 ~ positioned ^ ^ ^2 run function trove_mob:fx/p/cleave_telegraph
execute at @s rotated ~-30 ~10 positioned ~ ~1 ~ positioned ^ ^ ^3 run function trove_mob:fx/p/cleave_telegraph
execute at @s rotated ~-30 ~10 positioned ~ ~1 ~ positioned ^ ^ ^4 run function trove_mob:fx/p/cleave_telegraph