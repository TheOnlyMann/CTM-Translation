#Loops to write the potentials into a nice neat little list

#Data modification
data modify storage spawner_tweaker:temp potentials.temp set value {mob:"",weight:0,jockey:""}
data modify storage spawner_tweaker:temp potentials.temp.mob set string storage spawner_tweaker:temp potentials.potentials[0].data.entity.id 10
data modify storage spawner_tweaker:temp potentials.temp.weight set from storage spawner_tweaker:temp potentials.potentials[0].weight
execute if data storage spawner_tweaker:temp potentials.potentials[0].data.entity.Passengers[] run data modify storage spawner_tweaker:temp potentials.temp.jockey set value " Jockey"

#Add weight
scoreboard players set temp temp 0
execute store result score temp temp run data get storage spawner_tweaker:temp potentials.potentials[0].weight
scoreboard players operation weight temp += temp temp

#Write to list
data modify storage spawner_tweaker:temp potentials.mobs append from storage spawner_tweaker:temp potentials.temp

#Looping
data remove storage spawner_tweaker:temp potentials.potentials[0]
execute if data storage spawner_tweaker:temp potentials.potentials[0] run function spawner_tweaker:spawner_tweaking/player/bossbars/potentials/basic_loop