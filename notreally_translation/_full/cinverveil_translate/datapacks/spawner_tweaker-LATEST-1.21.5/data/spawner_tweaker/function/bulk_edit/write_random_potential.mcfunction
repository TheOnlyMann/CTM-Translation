#Writes a random spawn potential to the spawn data

data remove block ~ ~ ~ SpawnData
$data modify block ~ ~ ~ SpawnData set from storage spawner_tweaker:temp update_to.SpawnPotentials[$(potential)].data