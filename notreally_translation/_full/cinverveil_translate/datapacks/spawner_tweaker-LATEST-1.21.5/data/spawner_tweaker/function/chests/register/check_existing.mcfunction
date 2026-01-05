#Checks if a specified container exists
scoreboard players set exist temp 0
$execute if data storage spawner_tweaker:temp Chests[{x:$(x),y:$(y),z:$(z),dimension:"$(dimension)"}] run scoreboard players set exist temp 1