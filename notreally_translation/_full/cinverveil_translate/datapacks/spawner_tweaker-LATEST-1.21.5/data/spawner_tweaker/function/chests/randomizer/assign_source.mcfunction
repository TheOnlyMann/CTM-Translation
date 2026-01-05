#Assigns each container a source container
$execute store result score random temp run random value 1..$(max_rng) spawner_tweaker:randomizer
scoreboard players remove random temp 1
execute store result storage spawner_tweaker:temp variables.source int 1 run scoreboard players get random temp

function spawner_tweaker:chests/randomizer/assign_source_macro with storage spawner_tweaker:temp variables