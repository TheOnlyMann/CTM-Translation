#Happens when you trigger the objective to delete nearby containers

#flags
scoreboard players operation chest_range temp = @s delete_nearby_chests
scoreboard players set @s delete_nearby_chests 0

#Error if this is already ongoing
execute if score $st_ongoing_process temp matches 1.. run tellraw @s {"color":"red","italic":false,"text":"Please wait until the current process is finished"}
execute if score $st_ongoing_process temp matches 1.. run playsound minecraft:block.note_block.didgeridoo master @s ~ ~ ~ 1 1
execute if score $st_ongoing_process temp matches 1.. run return 1

#Determine number of chests
scoreboard players set total_chests temp 0
scoreboard players set removed_chests temp 0
execute store result score total_chests temp if data storage spawner_tweaker:temp Chests[{}]

#Enter loop for range checking
scoreboard players set n temp 0
execute store result score x temp run data get entity @s Pos[0]
execute store result score y temp run data get entity @s Pos[1]
execute store result score z temp run data get entity @s Pos[2]
execute store result storage spawner_tweaker:temp variables.n int 1 run scoreboard players get n temp
function spawner_tweaker:chests/delete/range_checker with storage spawner_tweaker:temp variables

#Delete
data remove storage spawner_tweaker:temp Chests[{remove:1b}]

#Displays
scoreboard players add @e[tag=st_primer,type=item_display] prime_spawners 1
execute if entity @e[tag=st_primer,type=item_display,limit=1] run schedule function spawner_tweaker:spawner_priming/kill_displays 1t

#Final tellraw
tellraw @s [{"color":"gray","text":"Removed "},{"color":"red","score":{"name":"removed_chests","objective":"temp"}}," chests"]