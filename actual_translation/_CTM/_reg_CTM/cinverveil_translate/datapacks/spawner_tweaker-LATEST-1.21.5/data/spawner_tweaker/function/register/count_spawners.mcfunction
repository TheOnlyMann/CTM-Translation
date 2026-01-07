#Counts spawners of a specific id
$execute store result storage spawner_tweaker:temp Comparison.spawners int 1 if data storage spawner_tweaker:temp Spawners[{id:$(id)}]
execute store result storage spawner_tweaker:temp Comparison.x double 1 run data get storage spawner_tweaker:temp Comparison.Pos[0]
execute store result storage spawner_tweaker:temp Comparison.y double 1 run data get storage spawner_tweaker:temp Comparison.Pos[1]
execute store result storage spawner_tweaker:temp Comparison.z double 1 run data get storage spawner_tweaker:temp Comparison.Pos[2]