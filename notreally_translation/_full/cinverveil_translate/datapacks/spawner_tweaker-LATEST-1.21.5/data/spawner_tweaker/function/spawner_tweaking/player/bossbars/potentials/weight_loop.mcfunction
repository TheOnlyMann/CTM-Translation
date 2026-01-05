#Loops to adjust the weights :)

#Adjust weight
scoreboard players set temp temp 0
execute store result score temp temp run data get storage spawner_tweaker:temp potentials.mobs[0].weight
scoreboard players operation temp2 temp = weight temp
scoreboard players operation temp temp *= 100 numbers
execute store result storage spawner_tweaker:temp potentials.mobs[0].weight int 1 run scoreboard players operation temp temp /= temp2 temp

#Write to list
data modify storage spawner_tweaker:temp potentials.potentials append from storage spawner_tweaker:temp potentials.mobs[0]

#Looping
data remove storage spawner_tweaker:temp potentials.mobs[0]
execute if data storage spawner_tweaker:temp potentials.mobs[0] run function spawner_tweaker:spawner_tweaking/player/bossbars/potentials/weight_loop