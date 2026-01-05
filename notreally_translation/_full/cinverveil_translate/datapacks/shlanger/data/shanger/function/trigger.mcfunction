execute if score .wools_eaten shanger.data matches ..12 as @e[type=#bb:hostile,tag=!suso.nats.count] at @s run data merge entity @s {PersistenceRequired:1b}

### First Menu

execute if score @s shanger.trigger matches 1 run function shanger:checkpoint/view_checkpoints
execute if score @s shanger.trigger matches 2 run function shanger:checkpoint/view_map_progress
execute if score @s shanger.trigger matches 3 run function shanger:checkpoint/view_stats




#### Checkpoints

execute if score @s shanger.trigger matches 101..106 unless entity @e[type=interaction,distance=..16,tag=shanger.cp] run function shanger:checkpoint/error_too_far
execute if score @s shanger.trigger matches 101 unless score .checkpoint1 shanger.data matches 1 run function shanger:checkpoint/error_not_unlocked
execute if score @s shanger.trigger matches 102 unless score .checkpoint2 shanger.data matches 1 run function shanger:checkpoint/error_not_unlocked
execute if score @s shanger.trigger matches 103 unless score .checkpoint3 shanger.data matches 1 run function shanger:checkpoint/error_not_unlocked
execute if score @s shanger.trigger matches 104 unless score .checkpoint4 shanger.data matches 1 run function shanger:checkpoint/error_not_unlocked
execute if score @s shanger.trigger matches 105 unless score .checkpoint5 shanger.data matches 1 run function shanger:checkpoint/error_not_unlocked
execute if score @s shanger.trigger matches 106 unless score .checkpoint6 shanger.data matches 1 run function shanger:checkpoint/error_not_unlocked




execute if score @s shanger.trigger matches 101 run tp @s -1 43 25
execute if score @s shanger.trigger matches 102 run tp @s -91 71 61
execute if score @s shanger.trigger matches 103 run tp @s -285 94 78
execute if score @s shanger.trigger matches 104 run tp @s -557 107 22
execute if score @s shanger.trigger matches 105 run tp @s -755 109 4
execute if score @s shanger.trigger matches 106 run tp @s -1057 175 12

execute if score @s shanger.trigger matches 101 run spawnpoint @s -1 43 25
execute if score @s shanger.trigger matches 102 run spawnpoint @s -91 71 61
execute if score @s shanger.trigger matches 103 run spawnpoint @s -285 94 78
execute if score @s shanger.trigger matches 104 run spawnpoint @s -557 107 22
execute if score @s shanger.trigger matches 105 run spawnpoint @s -755 109 4
execute if score @s shanger.trigger matches 106 run spawnpoint @s -1057 175 12






scoreboard players set @s shanger.trigger 0