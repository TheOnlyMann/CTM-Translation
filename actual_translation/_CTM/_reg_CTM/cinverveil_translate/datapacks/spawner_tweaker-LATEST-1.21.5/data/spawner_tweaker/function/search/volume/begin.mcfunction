#Happens when this option is selected from the settings menu


#Determine metrics
function spawner_tweaker:search/volume/determine_volume

#Fail conditions
scoreboard players set fail temp 0
execute if score $st_ongoing_process temp matches 1.. run scoreboard players set fail temp 1
execute if score $pos1_set st_volume matches 0 run scoreboard players set fail temp 2
execute if score $pos2_set st_volume matches 0 run scoreboard players set fail temp 2
execute if score time_s st_volume matches 300.. run scoreboard players set fail temp 3

execute if score fail temp matches 1 run tellraw @s {"color":"red","italic":false,"text":"Please wait for the current process to finish."}
execute if score fail temp matches 2 run tellraw @s {"color":"red","italic":false,"text":"Both corners must be set first."}
execute if score fail temp matches 3 run tellraw @s {"color":"red","italic":false,"text":"This volume is too big! (>5 minutes to process)"}

execute if score fail temp matches 1.. run playsound minecraft:block.note_block.didgeridoo master @s ~ ~ ~ 1 1
execute if score fail temp matches 1.. run return 1

#Actually beginning
scoreboard players set volume_timer st_priming 1
scoreboard players set $st_ongoing_process temp 4
scoreboard players set total_blocks_checked st_volume 0
scoreboard players set spawners_found st_volume 0
scoreboard players set ids_found st_volume 0

scoreboard players operation current_x st_volume = min_x st_volume
scoreboard players operation current_y st_volume = min_y st_volume
scoreboard players operation current_z st_volume = min_z st_volume