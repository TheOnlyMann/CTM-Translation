#Iterates search along the x axis

execute if block ~ ~ ~ #spawner_tweaker:container run function spawner_tweaker:chests/register/found_container
execute if block ~ ~ ~ spawner run function spawner_tweaker:register/register_base
particle electric_spark ~ ~ ~ 0 0 0 0 1 force

scoreboard players add blocks_checked st_volume 1
scoreboard players add current_x st_volume 1
execute if score current_x st_volume <= max_x st_volume if score blocks_checked st_volume matches ..1000 positioned ~1 ~ ~ run function spawner_tweaker:search/volume/process/x with storage spawner_tweaker:temp variables
$execute unless score current_x st_volume <= max_x st_volume if score current_z st_volume matches ..$(max_z) if score blocks_checked st_volume matches ..1000 positioned $(min_x) ~ ~ align xyz positioned ~0.5 ~0.5 ~0.5 run function spawner_tweaker:search/volume/process/z with storage spawner_tweaker:temp variables