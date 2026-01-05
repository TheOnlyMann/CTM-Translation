#creates the spawn area dynamically

#Interpolation is visually bugged for some silly reason, idk...
$data merge entity @s {teleport_duration:12,transformation:[$(SpawnVolume)f,0f,0f,-$(HalfSpawnVolume)f,0f,3.01f,0f,-1.501f,0f,0f,$(SpawnVolume)f,-$(HalfSpawnVolume)f,0f,0f,0f,1f]}
$execute if entity @s[tag=st_multiple_select] align xyz positioned ~0.5 ~0.5 ~0.5 run tp @s ~$(height) ~$(height) ~$(height)