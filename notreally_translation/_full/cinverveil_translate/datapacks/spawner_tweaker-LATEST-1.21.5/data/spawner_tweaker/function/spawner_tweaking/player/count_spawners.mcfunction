#Counts spawners of a specific id
$execute store result storage spawner_tweaker:temp name.spawners int 1 if data storage spawner_tweaker:temp Spawners[{id:$(id)}]
