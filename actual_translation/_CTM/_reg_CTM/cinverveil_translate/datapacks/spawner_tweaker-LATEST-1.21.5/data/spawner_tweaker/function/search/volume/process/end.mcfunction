#Ends the process

#Tellraw and misc
execute unless score volume_timer st_priming >= temp temp run tellraw @a [{"text":"Found ","color":"gray"},{"score":{"name":"spawners_found","objective":"st_volume"},"color":"green"},{"text":" new spawners and "},{"score":{"name":"ids_found","objective":"st_volume"},"color":"green"},{"text":" new ids"}]
execute unless score volume_timer st_priming >= temp temp as @a at @s run playsound block.note_block.pling master @s ~ ~ ~ 1 2
title @a actionbar [{"text":"Blocks checked ","color":"gray"},{"score":{"name":"total_blocks_checked","objective":"st_volume"},"color":"green"},{"text":"/"},{"score":{"name":"total","objective":"st_volume"},"color":"green"}]
execute if score volume_timer st_priming >= temp temp run title @a actionbar [{"text":"Blocks checked ","color":"gray"},{"score":{"name":"total_blocks_checked","objective":"st_volume"},"color":"red"},{"text":"/"},{"score":{"name":"total","objective":"st_volume"},"color":"green"}]
execute if score volume_timer st_priming >= temp temp run tellraw @a {"color":"red","italic":false,"text":"Something went wrong so spawner registering was cancelled."}
execute if score volume_timer st_priming >= temp temp as @a at @s run playsound minecraft:block.note_block.didgeridoo master @s ~ ~ ~ 1 1

#Flags
scoreboard players set volume_timer st_priming 0
scoreboard players set $st_ongoing_process temp 0
scoreboard players reset current_x st_volume
scoreboard players reset current_y st_volume
scoreboard players reset current_z st_volume
#kill 18c359ed-00ca-4242-9e49-91cd8846f33a
#scoreboard players set $pos1_set st_volume 0
#scoreboard players set $pos2_set st_volume 0