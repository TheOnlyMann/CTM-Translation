#Ends the valid container check process
#Starts the randomizing process
execute if score chests_checked st_priming >= total_chests st_priming run title @a actionbar [{"text":"Chests checked ","color":"gray"},{"score":{"name":"chests_checked","objective":"st_priming"},"color":"green"},{"text":"/"},{"score":{"name":"total_chests","objective":"st_priming"},"color":"green"}]
execute unless score chests_checked st_priming >= total_chests st_priming run title @a actionbar [{"text":"Chests checked ","color":"gray"},{"score":{"name":"chests_checked","objective":"st_priming"},"color":"dark_red"},{"text":"/"},{"score":{"name":"total_chests","objective":"st_priming"},"color":"red"}]
execute unless score chests_checked st_priming >= total_chests st_priming run tellraw @a {"color":"red","italic":false,"text":"Something went wrong so chest randomization was cancelled."}
execute unless score chests_checked st_priming >= total_chests st_priming as @a at @s run playsound minecraft:block.note_block.didgeridoo master @s ~ ~ ~ 1 1

#Get container counts
scoreboard players add total_chests st_priming 0
execute store result score total_chests st_priming if data storage spawner_tweaker:temp container_randomizer[]

#Assign containers a random source
data remove storage spawner_tweaker:temp container_source
data modify storage spawner_tweaker:temp container_source set from storage spawner_tweaker:temp container_randomizer
data modify storage spawner_tweaker:temp container_randomizer[0].n set value 0
data modify storage spawner_tweaker:temp container_randomizer[0].next set value 1
scoreboard players set n temp 0
function spawner_tweaker:chests/randomizer/assign_source_loop with storage spawner_tweaker:temp container_randomizer[0]

#Killing displays
execute unless score chests_checked st_priming >= total_chests st_priming if entity @e[tag=st_primer,type=item_display,limit=1] run schedule function spawner_tweaker:spawner_priming/kill_displays 1t

#flags
execute unless score chests_checked st_priming >= total_chests st_priming run scoreboard players set $st_ongoing_process temp 0
execute unless score chests_checked st_priming >= total_chests st_priming run scoreboard players set random_timer st_priming 0

execute if score chests_checked st_priming >= total_chests st_priming run scoreboard players set random_timer st_priming 1
execute if score chests_checked st_priming >= total_chests st_priming run scoreboard players set $st_ongoing_process temp 9
scoreboard players set chests_randomized st_priming 0
scoreboard players set chests_checked st_priming -1
