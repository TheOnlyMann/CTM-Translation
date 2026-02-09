#Ends the priming process
execute if score spawners_transformed st_priming >= total_spawners st_priming run title @a actionbar [{"text":"Spawners transformed ","color":"gray"},{"score":{"name":"spawners_transformed","objective":"st_priming"},"color":"green"},{"text":"/"},{"score":{"name":"total_spawners","objective":"st_priming"},"color":"green"}]
execute unless score spawners_transformed st_priming >= total_spawners st_priming run title @a actionbar [{"text":"Spawners transformed ","color":"gray"},{"score":{"name":"spawners_transformed","objective":"st_priming"},"color":"dark_red"},{"text":"/"},{"score":{"name":"total_spawners","objective":"st_priming"},"color":"red"}]
execute unless score spawners_transformed st_priming >= total_spawners st_priming run tellraw @a {"color":"red","italic":false,"text":"Something went wrong so spawner transformation was cancelled."}
execute unless score spawners_transformed st_priming >= total_spawners st_priming as @a at @s run playsound minecraft:block.note_block.didgeridoo master @s ~ ~ ~ 1 1

#Remove old id
execute if score spawners_transformed st_priming >= total_spawners st_priming run scoreboard players operation @p[tag=st_transformer] delete_spawner_id = id st_priming

#flags
scoreboard players set transform_timer st_priming 0
scoreboard players set spawners_transformed st_priming -1
scoreboard players set $st_ongoing_process temp 0

#Killing displays
execute if entity @e[tag=st_primer,type=item_display,limit=1] run schedule function spawner_tweaker:spawner_priming/kill_displays 1t