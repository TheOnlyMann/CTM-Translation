#Selects a random id with the seed, unweighted
$execute store result score random temp run random value 1..$(total_ids) spawner_tweaker:randomizer
scoreboard players remove random temp 1