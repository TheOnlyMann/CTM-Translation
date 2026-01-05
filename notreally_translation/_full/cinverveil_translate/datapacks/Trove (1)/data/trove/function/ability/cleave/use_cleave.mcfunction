advancement revoke @s only trove:ability/use_cleave




execute store result storage trove:ability dmg float 1.5 run attribute @s minecraft:attack_damage get 1
execute unless score @s trove_ab_cleave_cd matches 1.. run function trove:ability/cleave/cleave_damage with storage trove:ability




#cooldown
execute unless score @s trove_ab_cleave_cd matches 1.. run scoreboard players add @s trove_ab_cleave_cd 20