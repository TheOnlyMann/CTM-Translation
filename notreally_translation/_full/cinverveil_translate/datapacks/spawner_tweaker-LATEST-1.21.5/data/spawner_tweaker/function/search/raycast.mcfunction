#Raycast to begin spawner searching

execute unless block ~ ~ ~ #spawner_tweaker:raycastable run function spawner_tweaker:search/begin with storage spawner_tweaker:temp variables
execute if score raycast temp matches 1 run function spawner_tweaker:search/begin with storage spawner_tweaker:temp variables

scoreboard players remove raycast temp 1
execute if score raycast temp matches 1.. if block ~ ~ ~ #spawner_tweaker:raycastable positioned ^ ^ ^1 run function spawner_tweaker:search/raycast
