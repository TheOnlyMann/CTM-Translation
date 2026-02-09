#Begins the search process

scoreboard players set raycast temp -99
$execute align xyz positioned ~0.5 ~0.5 ~0.5 positioned ~-$(start) ~-$(start) ~-$(start) run function spawner_tweaker:search/x with storage spawner_tweaker:temp variables