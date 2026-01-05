#Happens when the player triggers a bulk highlight

#Setting time and flags
scoreboard players operation $st_highlight_time temp = @s highlight_spawners
scoreboard players set @s highlight_spawners 0

#Figuring out which spawners are loaded
scoreboard players set n temp 0
execute store result score $total_spawners temp if data storage spawner_tweaker:temp Spawners[]
data modify storage spawner_tweaker:temp highlight set from storage spawner_tweaker:temp Spawners
data modify storage spawner_tweaker:temp highlight[0].n set value 0
data modify storage spawner_tweaker:temp highlight[0].next set value 1
data modify storage spawner_tweaker:temp highlight[0].x set from storage spawner_tweaker:temp highlight[0].Pos[0]
data modify storage spawner_tweaker:temp highlight[0].y set from storage spawner_tweaker:temp highlight[0].Pos[1]
data modify storage spawner_tweaker:temp highlight[0].z set from storage spawner_tweaker:temp highlight[0].Pos[2]
function spawner_tweaker:highlight/load_checker with storage spawner_tweaker:temp highlight[0]
data remove storage spawner_tweaker:temp highlight[{loaded:0b}]

#Go, my pretties! Make markers!
execute if data storage spawner_tweaker:temp highlight[0] run function spawner_tweaker:highlight/create_marker_loop with storage spawner_tweaker:temp highlight[0]

#Begin killer ticking
team join spawner_tweaker_gray @e[tag=st_highlight]
function spawner_tweaker:spawner_priming/kill_displays