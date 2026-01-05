#Updates the data in the spawner id to match the new update

#Save the name
data remove storage spawner_tweaker:temp variables.name
$data modify storage spawner_tweaker:temp variables.name set from storage spawner_tweaker:temp Ids[{id:$(id)}].name

#Rewrite
$data remove storage spawner_tweaker:temp Ids[{id:$(id)}]
execute if data storage spawner_tweaker:temp variables.name run data modify storage spawner_tweaker:temp update_to.name set from storage spawner_tweaker:temp variables.name
data modify storage spawner_tweaker:temp Ids append from storage spawner_tweaker:temp update_to

