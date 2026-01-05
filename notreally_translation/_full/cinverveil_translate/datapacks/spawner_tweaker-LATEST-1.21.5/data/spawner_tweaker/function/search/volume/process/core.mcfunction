#Happens 20hz as the process is ongoing

#Failsafe
scoreboard players add volume_timer st_priming 1
scoreboard players operation temp temp = time st_volume
scoreboard players add temp temp 60
execute if score volume_timer st_priming >= temp temp run function spawner_tweaker:search/volume/process/end with storage spawner_tweaker:temp variables

#Enter search looping
scoreboard players set blocks_checked st_volume 0
execute store result storage spawner_tweaker:temp variables.x_length int 1 run scoreboard players get x_length st_volume
execute store result storage spawner_tweaker:temp variables.y_length int 1 run scoreboard players get y_length st_volume
execute store result storage spawner_tweaker:temp variables.z_length int 1 run scoreboard players get z_length st_volume
execute store result storage spawner_tweaker:temp variables.current_x int 1 run scoreboard players get current_x st_volume
execute store result storage spawner_tweaker:temp variables.current_y int 1 run scoreboard players get current_y st_volume
execute store result storage spawner_tweaker:temp variables.current_z int 1 run scoreboard players get current_z st_volume
execute store result storage spawner_tweaker:temp variables.max_x int 1 run scoreboard players get max_x st_volume
execute store result storage spawner_tweaker:temp variables.max_y int 1 run scoreboard players get max_y st_volume
execute store result storage spawner_tweaker:temp variables.max_z int 1 run scoreboard players get max_z st_volume
execute store result storage spawner_tweaker:temp variables.min_x int 1 run scoreboard players get min_x st_volume
execute store result storage spawner_tweaker:temp variables.min_y int 1 run scoreboard players get min_y st_volume
execute store result storage spawner_tweaker:temp variables.min_z int 1 run scoreboard players get min_z st_volume
function spawner_tweaker:search/volume/process/enter with storage spawner_tweaker:temp variables

#Output
scoreboard players operation total_blocks_checked st_volume += blocks_checked st_volume
title @a actionbar [{"text":"Blocks checked ","color":"gray"},{"score":{"name":"total_blocks_checked","objective":"st_volume"},"color":"red"},{"text":"/"},{"score":{"name":"total","objective":"st_volume"},"color":"green"}]
execute store result storage spawner_tweaker:temp variables.spawners int 1 run scoreboard players get spawners_found st_volume
execute if score total_blocks_checked st_volume >= total st_volume run function spawner_tweaker:search/volume/process/end with storage spawner_tweaker:temp variables