#Loop for fire particles when a new spawner is registered

execute positioned ^ ^ ^0.4 run particle soul_fire_flame ~ ~ ~ ^ ^ ^1000000 0.00000015 0 force
scoreboard players add x temp 15
scoreboard players set rot_y temp 0
execute if score x temp matches 360.. run scoreboard players set rot_y temp 1
execute if score x temp matches 360.. run scoreboard players add y temp 15
execute if score x temp matches 360.. run scoreboard players set x temp 0
execute if score y temp matches ..90 if score rot_y temp matches 0 rotated ~15 ~ run function spawner_tweaker:chests/register/register_particle_loop
execute if score y temp matches ..90 if score rot_y temp matches 1 rotated ~15 ~15 run function spawner_tweaker:chests/register/register_particle_loop