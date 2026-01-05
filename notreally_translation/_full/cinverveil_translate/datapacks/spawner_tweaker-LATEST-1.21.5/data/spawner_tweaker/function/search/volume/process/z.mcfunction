#Iterates search along the z axis

scoreboard players add current_z st_volume 1
scoreboard players operation current_x st_volume = min_x st_volume
execute if score current_z st_volume <= max_z st_volume positioned ~ ~ ~1 run function spawner_tweaker:search/volume/process/x with storage spawner_tweaker:temp variables
$execute unless score current_z st_volume <= max_z st_volume if score current_y st_volume <= max_y st_volume positioned ~ ~ $(min_z) align xyz positioned ~0.5 ~0.5 ~0.5 run function spawner_tweaker:search/volume/process/y with storage spawner_tweaker:temp variables