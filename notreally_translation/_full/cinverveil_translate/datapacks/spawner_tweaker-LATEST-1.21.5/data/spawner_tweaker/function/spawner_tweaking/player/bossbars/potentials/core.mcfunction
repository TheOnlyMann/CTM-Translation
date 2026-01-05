#Oh? You have multiple spawn potentials
#Turns out our dearest Render wants comaptibility with this
#So I SUFFER


#Set up our sotrages
scoreboard players set weight temp 0
data modify storage spawner_tweaker:temp potentials set value {}
data modify storage spawner_tweaker:temp potentials.name set value '""'
data modify storage spawner_tweaker:temp potentials.mobs set value []
data modify storage spawner_tweaker:temp potentials.potentials set from block ~ ~ ~ SpawnPotentials

#Then grab all the potentials
function spawner_tweaker:spawner_tweaking/player/bossbars/potentials/basic_loop

#Fix up the weights
function spawner_tweaker:spawner_tweaking/player/bossbars/potentials/weight_loop

#Concat time babyyyy
data modify storage spawner_tweaker:temp potentials.potentials[0].concat set from storage spawner_tweaker:temp potentials.name
function spawner_tweaker:spawner_tweaking/player/bossbars/potentials/concat with storage spawner_tweaker:temp potentials.potentials[0]

data modify storage spawner_tweaker:temp name.name set from storage spawner_tweaker:temp potentials.name
function spawner_tweaker:spawner_tweaking/player/bossbars/potentials/bossbar with storage spawner_tweaker:temp name