#Finds the next available id to register

scoreboard players set pass temp 0
$execute unless data storage spawner_tweaker:temp Ids[{id:$(id)}] run scoreboard players set pass temp 1

execute if score pass temp matches 0 store result storage spawner_tweaker:temp variables.id int 1 run scoreboard players add id temp 1
execute if score pass temp matches 0 run function spawner_tweaker:register/find_next_id with storage spawner_tweaker:temp variables