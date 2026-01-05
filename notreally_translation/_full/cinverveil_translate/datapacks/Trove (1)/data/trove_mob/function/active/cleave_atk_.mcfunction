execute store result storage trove:mob dmg float 1 run scoreboard players get @s trove_mob_init_damage

tag @s add trove.mob.attacker
tag @s add trove.los.target

execute as @a[distance=..4.5] positioned ^ ^1 ^3 as @s[distance=..3] run function trove_mob:active/cleave_atk_victim

tag @s remove trove.mob.attacker
tag @s remove trove.los.target









execute at @s rotated ~30 ~10 positioned ~ ~1 ~ positioned ^ ^ ^3 run function trove_mob:fx/p/cleave_attack
execute at @s rotated ~0 ~10 positioned ~ ~1 ~ positioned ^ ^ ^3 run function trove_mob:fx/p/cleave_attack
execute at @s rotated ~-30 ~10 positioned ~ ~1 ~ positioned ^ ^ ^3 run function trove_mob:fx/p/cleave_attack

function trove_mob:fx/s/cleave_attack
function trove_mob:active/channel/end_channel
