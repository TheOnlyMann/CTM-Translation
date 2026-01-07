#determines the min and max xyz of the volume

#Failsafes
scoreboard players add min_x st_volume 0
scoreboard players add min_y st_volume 0
scoreboard players add min_z st_volume 0
scoreboard players add max_x st_volume 0
scoreboard players add max_y st_volume 0
scoreboard players add max_z st_volume 0

#Actually dermine the min and max
execute if score x st_volume > x2 st_volume run scoreboard players operation max_x st_volume = x st_volume
execute if score y st_volume > y2 st_volume run scoreboard players operation max_y st_volume = y st_volume
execute if score z st_volume > z2 st_volume run scoreboard players operation max_z st_volume = z st_volume
execute unless score x st_volume > x2 st_volume run scoreboard players operation max_x st_volume = x2 st_volume
execute unless score y st_volume > y2 st_volume run scoreboard players operation max_y st_volume = y2 st_volume
execute unless score z st_volume > z2 st_volume run scoreboard players operation max_z st_volume = z2 st_volume

execute if score x st_volume < x2 st_volume run scoreboard players operation min_x st_volume = x st_volume
execute if score y st_volume < y2 st_volume run scoreboard players operation min_y st_volume = y st_volume
execute if score z st_volume < z2 st_volume run scoreboard players operation min_z st_volume = z st_volume
execute unless score x st_volume < x2 st_volume run scoreboard players operation min_x st_volume = x2 st_volume
execute unless score y st_volume < y2 st_volume run scoreboard players operation min_y st_volume = y2 st_volume
execute unless score z st_volume < z2 st_volume run scoreboard players operation min_z st_volume = z2 st_volume


#Determine blocks
scoreboard players operation x_length st_volume = max_x st_volume
scoreboard players operation y_length st_volume = max_y st_volume
scoreboard players operation z_length st_volume = max_z st_volume

scoreboard players operation x_length st_volume -= min_x st_volume
scoreboard players operation y_length st_volume -= min_y st_volume
scoreboard players operation z_length st_volume -= min_z st_volume
scoreboard players add x_length st_volume 1
scoreboard players add y_length st_volume 1
scoreboard players add z_length st_volume 1

scoreboard players operation total st_volume = x_length st_volume
scoreboard players operation total st_volume *= y_length st_volume
scoreboard players operation total st_volume *= z_length st_volume

scoreboard players operation time st_volume = total st_volume
scoreboard players operation time st_volume /= 1000 numbers
scoreboard players operation time_s st_volume = time st_volume
scoreboard players operation time_s st_volume /= 20 numbers
data remove storage spawner_tweaker:temp variables.volume_time
execute store result storage spawner_tweaker:temp variables.volume_time double 0.05 run scoreboard players get time st_volume
