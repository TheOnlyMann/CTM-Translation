tag @s add trove.player_attack
$execute positioned ^ ^1 ^2 as @e[type=#trove:hostile,distance=..3] run damage @s $(dmg) minecraft:player_attack by @p[tag=trove.player_attack]
tag @s remove trove.player_attack

execute at @s rotated ~20 ~ positioned ~ ~1 ~ positioned ^ ^ ^3 run function trove_mob:fx/p/cleave_attack
execute at @s rotated ~-20 ~ positioned ~ ~1 ~ positioned ^ ^ ^3 run function trove_mob:fx/p/cleave_attack
playsound minecraft:entity.player.attack.sweep hostile @a ~ ~ ~ 1 .5