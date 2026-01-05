#Stores the randomly chosen spawner so that we can use and abuse it
$execute store result score random temp run data get storage spawner_tweaker:temp random_source[$(rng)].id
$data remove storage spawner_tweaker:temp random_source[$(rng)]