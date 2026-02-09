#Concats the tags variable
data modify storage spawner_tweaker:temp variables.concat1 set from storage spawner_tweaker:temp give.Tags
data modify storage spawner_tweaker:temp variables.concat2 set value ""
data modify storage spawner_tweaker:temp variables.concat2 set from storage spawner_tweaker:temp give.tags[0]

execute if score continue temp matches 1 run function spawner_tweaker:give_spawners/actual_concat_1 with storage spawner_tweaker:temp variables
execute if score continue temp matches 2.. run function spawner_tweaker:give_spawners/actual_concat_2 with storage spawner_tweaker:temp variables



scoreboard players set continue temp 0
execute if data storage spawner_tweaker:temp give.tags[0] run scoreboard players set continue temp 1
execute if data storage spawner_tweaker:temp give.tags[1] run scoreboard players set continue temp 2
data remove storage spawner_tweaker:temp give.tags[0]
execute if score continue temp matches 1.. run function spawner_tweaker:give_spawners/concat with storage spawner_tweaker:temp variables