#Helps to visualize the volume

#Flags
scoreboard players set $st_1s_timer temp 0

#Skip if nobody is here or this is invalid
execute if score $pos1_set st_volume matches 0 run return 1

#Visualization
data modify storage spawner_tweaker:temp variables.x set value 999999
data modify storage spawner_tweaker:temp variables.y set value 999999
data modify storage spawner_tweaker:temp variables.z set value 999999
data modify storage spawner_tweaker:temp variables.x2 set value 999999
data modify storage spawner_tweaker:temp variables.y2 set value 999999
data modify storage spawner_tweaker:temp variables.z2 set value 999999

execute unless score $pos1_set st_volume matches 0 store result storage spawner_tweaker:temp variables.x int 1 run scoreboard players get x st_volume
execute unless score $pos1_set st_volume matches 0 store result storage spawner_tweaker:temp variables.y int 1 run scoreboard players get y st_volume
execute unless score $pos1_set st_volume matches 0 store result storage spawner_tweaker:temp variables.z int 1 run scoreboard players get z st_volume
execute unless score $pos2_set st_volume matches 0 store result storage spawner_tweaker:temp variables.x2 int 1 run scoreboard players get x2 st_volume
execute unless score $pos2_set st_volume matches 0 store result storage spawner_tweaker:temp variables.y2 int 1 run scoreboard players get y2 st_volume
execute unless score $pos2_set st_volume matches 0 store result storage spawner_tweaker:temp variables.z2 int 1 run scoreboard players get z2 st_volume

function spawner_tweaker:search/volume/visualize_particles with storage spawner_tweaker:temp variables

#Visualizing the box
scoreboard players set st_fail temp 2
execute if entity @s[tag=st_show_box] run scoreboard players set st_fail temp 0
execute if score $pos2_set st_volume matches 0 run scoreboard players add st_fail temp 1
execute if score $pos1_set st_volume matches 0 run scoreboard players add st_fail temp 1
execute if score st_fail temp matches 1.. run return 1

kill 18c359ed-00ca-4242-9e49-91cd8846f33a

execute store result storage spawner_tweaker:temp variables.x float 1 run scoreboard players get min_x st_volume
execute store result storage spawner_tweaker:temp variables.y float 1 run scoreboard players get min_y st_volume
execute store result storage spawner_tweaker:temp variables.z float 1 run scoreboard players get min_z st_volume
execute store result storage spawner_tweaker:temp variables.dx float 1.0001 run scoreboard players get x_length st_volume
execute store result storage spawner_tweaker:temp variables.dy float 1.0001 run scoreboard players get y_length st_volume
execute store result storage spawner_tweaker:temp variables.dz float 1.0001 run scoreboard players get z_length st_volume

function spawner_tweaker:search/volume/visualize_box with storage spawner_tweaker:temp variables
