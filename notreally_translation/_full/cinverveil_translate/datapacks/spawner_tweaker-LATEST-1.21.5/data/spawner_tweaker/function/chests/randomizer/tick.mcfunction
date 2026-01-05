#Do one step of the chest randomizing process

##MAIN PROCESS
#Loop through the chests to check if loaded. If not, load. If loaded, check/randomize and mark completed
execute if score $modification_limit spawner_tweaker matches ..1 run scoreboard players set $modification_limit spawner_tweaker 1
scoreboard players set n temp 0

data modify storage spawner_tweaker:temp container_checker[0].n set value 0
data modify storage spawner_tweaker:temp container_checker[0].next set value 1
execute if score $st_ongoing_process temp matches 8 run function spawner_tweaker:chests/randomizer/check_valid_loop with storage spawner_tweaker:temp container_checker[0]
data remove storage spawner_tweaker:temp container_checker[{remove:1b}]

data modify storage spawner_tweaker:temp container_randomizer[0].n set value 0
data modify storage spawner_tweaker:temp container_randomizer[0].next set value 1
execute if score $st_ongoing_process temp matches 9 run function spawner_tweaker:chests/randomizer/randomize_chest_loop with storage spawner_tweaker:temp container_randomizer[0]
data remove storage spawner_tweaker:temp container_randomizer[{remove:1b}]

#Displays
scoreboard players add @e[tag=st_primer,type=item_display] prime_spawners 1
kill @e[tag=st_primer,tag=!st_highlight,type=item_display,scores={prime_spawners=60..}]

#Inciment timer and display
scoreboard players add chest_random_timer st_priming 1
execute if score $st_ongoing_process temp matches 8 run title @a actionbar [{"text":"Containers checked ","color":"gray"},{"score":{"name":"chests_checked","objective":"st_priming"},"color":"red"},{"text":"/"},{"score":{"name":"total_chests","objective":"st_priming"},"color":"green"}]
execute if score $st_ongoing_process temp matches 9 run title @a actionbar [{"text":"Chests randomized ","color":"gray"},{"score":{"name":"chests_randomized","objective":"st_priming"},"color":"red"},{"text":"/"},{"score":{"name":"total_chests","objective":"st_priming"},"color":"green"}]

#Ending the randomizer process
execute if score chests_checked st_priming >= total_chests st_priming run function spawner_tweaker:chests/randomizer/flip_to_randomizer
execute if score chests_randomized st_priming >= total_chests st_priming run function spawner_tweaker:chests/randomizer/end
scoreboard players operation max temp = total_chests st_priming
scoreboard players operation max temp *= 2 numbers
scoreboard players add max temp 20
execute if score chest_random_timer st_priming >= max temp if score $st_ongoing_process temp matches 8 run function spawner_tweaker:chests/randomizer/flip_to_randomizer
execute if score chest_random_timer st_priming >= max temp if score $st_ongoing_process temp matches 9 run function spawner_tweaker:chests/randomizer/end
