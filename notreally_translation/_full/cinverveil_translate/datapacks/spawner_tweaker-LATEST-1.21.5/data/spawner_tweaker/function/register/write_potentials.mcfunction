#Writes a spawn potential to a spawner if none exist
data modify storage spawner_tweaker:temp SpawnData set value [{data:{entity:{id:"minecraft:item"}},weight:1}]
data modify storage spawner_tweaker:temp SpawnData[0].data set from block ~ ~ ~ SpawnData
data modify block ~ ~ ~ SpawnPotentials set from storage spawner_tweaker:temp SpawnData
