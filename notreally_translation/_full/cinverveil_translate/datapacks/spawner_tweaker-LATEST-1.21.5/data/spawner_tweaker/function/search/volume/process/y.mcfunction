#Iterates search along the y axis

scoreboard players add current_y st_volume 1
scoreboard players operation current_x st_volume = min_x st_volume
scoreboard players operation current_z st_volume = min_z st_volume
execute positioned ~ ~1 ~ run function spawner_tweaker:search/volume/process/x with storage spawner_tweaker:temp variables