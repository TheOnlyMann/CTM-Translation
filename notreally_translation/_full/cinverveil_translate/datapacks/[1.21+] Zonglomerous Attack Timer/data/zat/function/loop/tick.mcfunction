
######## SET ATTACK SPEED TO 1 WHEN NO BASE ATTACK SPEED
execute as @a at @s run attribute @s minecraft:attack_damage modifier remove zat:fuck_off
execute as @a at @s run attribute @s minecraft:attack_speed modifier add fist_nerf -3 add_value
execute as @a at @s store success score @s has_bas run attribute @s minecraft:attack_speed modifier value get minecraft:base_attack_speed
execute as @a at @s if score @s has_bas matches 1.. run attribute @s minecraft:attack_speed modifier remove minecraft:fist_nerf

##########
tag @a remove zat_charged
execute as @a at @s run attribute @s minecraft:attack_speed modifier remove zat:as
execute as @a at @s run attribute @s minecraft:entity_interaction_range modifier add zat:no_reach -10000 add_multiplied_total

execute as @a at @s store result score @s zat_attack_speed run attribute @s minecraft:attack_speed get 100
scoreboard players add @a zat_last_attack 1

scoreboard players set @a zat_charged_time 10000
execute as @a at @s run scoreboard players operation @s zat_charged_time /= @s zat_attack_speed
execute as @a at @s run scoreboard players operation @s zat_charged_time /= $5 zat.data

execute as @a at @s if score @s zat_charged_time <= @s zat_last_attack run tag @s add zat_charged
execute as @a[tag=!zat_charged] at @s run attribute @s minecraft:attack_speed modifier add zat:as -1024 add_value
execute as @a at @s run attribute @s minecraft:attack_speed modifier add zat:as 1024 add_value
execute as @a[tag=zat_charged] at @s run attribute @s minecraft:entity_interaction_range modifier remove zat:no_reach


#100 / attack speed / 5 = number of ticks