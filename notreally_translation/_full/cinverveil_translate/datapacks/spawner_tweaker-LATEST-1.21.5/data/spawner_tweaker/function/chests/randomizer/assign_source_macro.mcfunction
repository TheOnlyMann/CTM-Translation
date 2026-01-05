#Assigns each container a source container
$data modify storage spawner_tweaker:temp container_randomizer[$(n)].x_source set from storage spawner_tweaker:temp container_source[$(source)].x
$data modify storage spawner_tweaker:temp container_randomizer[$(n)].y_source set from storage spawner_tweaker:temp container_source[$(source)].y
$data modify storage spawner_tweaker:temp container_randomizer[$(n)].z_source set from storage spawner_tweaker:temp container_source[$(source)].z
$data modify storage spawner_tweaker:temp container_randomizer[$(n)].dimension_source set from storage spawner_tweaker:temp container_source[$(source)].dimension
$data modify storage spawner_tweaker:temp container_randomizer[$(n)].force_load_source set from storage spawner_tweaker:temp container_source[$(source)].force_load
$data modify storage spawner_tweaker:temp container_randomizer[$(n)].contents_source set from storage spawner_tweaker:temp container_source[$(source)].contents

$data remove storage spawner_tweaker:temp container_source[$(source)]