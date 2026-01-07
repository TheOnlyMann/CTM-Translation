#Loops through to check if the ids are to be transformed

$scoreboard players set id temp $(id)
$execute if score id temp = id st_priming run data modify storage spawner_tweaker:temp Priming[$(n)].valid set value 1b
$execute unless score id temp = id st_priming run data modify storage spawner_tweaker:temp Priming[$(n)].valid set value 0b

$execute if data storage spawner_tweaker:temp Priming[$(next)] run function spawner_tweaker:transform/check_id_loop with storage spawner_tweaker:temp Priming[$(next)]