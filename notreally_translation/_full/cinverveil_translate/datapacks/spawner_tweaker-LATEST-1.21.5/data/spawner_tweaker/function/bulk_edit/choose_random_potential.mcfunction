#Chooses a random spawn potential to write

$execute store result storage spawner_tweaker:temp variables.potential int 1 run random value 0..$(count) spawner_tweaker:randomizer

function spawner_tweaker:bulk_edit/write_random_potential with storage spawner_tweaker:temp variables
