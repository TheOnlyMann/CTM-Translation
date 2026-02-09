$forceload add $(SpawnX) $(SpawnZ) $(SpawnX) $(SpawnZ)
$execute if block $(SpawnX) $(SpawnY) $(SpawnZ) #minecraft:beds run execute in $(SpawnDimension) run tp @s $(SpawnX) $(SpawnY) $(SpawnZ)
$execute unless block $(SpawnX) $(SpawnY) $(SpawnZ) #minecraft:beds run tp @s ~0.5 ~ ~0.5
$forceload remove $(SpawnX) $(SpawnZ) $(SpawnX) $(SpawnZ)
