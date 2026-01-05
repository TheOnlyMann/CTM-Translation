attribute @s minecraft:movement_speed modifier remove trove_mob_active
attribute @s minecraft:attack_damage modifier remove trove_mob_active
tag @s remove trove.mob.channel


scoreboard players set @s trove_mob_tick 0
scoreboard players operation @s trove_mob_tick -= @s trove_mob_init_cooldown