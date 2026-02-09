#Loops to write the potentials into a nice neat little list

#Begin the concoction
$data modify storage spawner_tweaker:temp potentials.name set value '$(concat)," $(weight)%",{"fallback":"$(mob)","translate":"entity.minecraft.$(mob)"},"$(jockey)"'


#Remove data and slap some new junk inside
data remove storage spawner_tweaker:temp potentials.potentials[0]
data modify storage spawner_tweaker:temp potentials.potentials[0].concat set from storage spawner_tweaker:temp potentials.name

#Looping
execute if data storage spawner_tweaker:temp potentials.potentials[0] run function spawner_tweaker:spawner_tweaking/player/bossbars/potentials/concat with storage spawner_tweaker:temp potentials.potentials[0]