#Selects a random id with the seed, weighted
$execute store result score random temp run random value 1..$(max_rng) spawner_tweaker:randomizer
scoreboard players remove random temp 1
execute store result storage spawner_tweaker:temp variables.rng int 1 run scoreboard players get random temp
function spawner_tweaker:randomizer/store_random_spawner with storage spawner_tweaker:temp variables