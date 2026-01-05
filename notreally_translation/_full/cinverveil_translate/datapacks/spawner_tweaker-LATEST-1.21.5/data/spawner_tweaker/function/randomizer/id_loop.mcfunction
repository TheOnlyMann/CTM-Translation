#Loops through all the spawners and assigns a new id, randomly


#Equally random
execute if score $st_ongoing_process temp matches 6 run function spawner_tweaker:randomizer/select_id_random with storage spawner_tweaker:temp variables

#Random, weighted
execute if score $st_ongoing_process temp matches 7 store result storage spawner_tweaker:temp variables.max_rng int 1 if data storage spawner_tweaker:temp random_source[{}]
execute if score $st_ongoing_process temp matches 7 run function spawner_tweaker:randomizer/select_id_weighted with storage spawner_tweaker:temp variables

#Assign the new random id
$execute store result storage spawner_tweaker:temp Priming[$(n)].id int 1 run scoreboard players get random temp

#Loop
$execute if data storage spawner_tweaker:temp Priming[$(next)] run function spawner_tweaker:randomizer/id_loop with storage spawner_tweaker:temp Priming[$(next)]