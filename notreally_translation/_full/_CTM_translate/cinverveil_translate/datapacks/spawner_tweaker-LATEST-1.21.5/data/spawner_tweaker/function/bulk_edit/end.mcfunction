#Ends the updating process

#Giving out the new spawner
execute store result storage spawner_tweaker:temp variables.id int 1 run scoreboard players get id st_priming
function spawner_tweaker:bulk_edit/clear_and_give with storage spawner_tweaker:temp variables

#Displays
execute if score spawners_updated st_priming >= total_spawners st_priming run title @a actionbar [{"text":"Spawners updated ","color":"gray"},{"score":{"name":"spawners_updated","objective":"st_priming"},"color":"green"},{"text":"/"},{"score":{"name":"total_spawners","objective":"st_priming"},"color":"green"}]
execute unless score spawners_updated st_priming >= total_spawners st_priming run title @a actionbar [{"text":"Spawners updated ","color":"gray"},{"score":{"name":"spawners_updated","objective":"st_priming"},"color":"dark_red"},{"text":"/"},{"score":{"name":"total_spawners","objective":"st_priming"},"color":"red"}]
execute unless score spawners_updated st_priming >= total_spawners st_priming run tellraw @a {"color":"red","italic":false,"text":"Something went wrong so spawner updating was cancelled."}
execute unless score spawners_updated st_priming >= total_spawners st_priming as @a at @s run playsound minecraft:block.note_block.didgeridoo master @s ~ ~ ~ 1 1

#Flags
scoreboard players set bse_timer st_priming 0
scoreboard players set spawners_updated st_priming -1
scoreboard players set $st_ongoing_process temp 0

#Killing displays
execute if entity @e[tag=st_primer,type=item_display,limit=1] run schedule function spawner_tweaker:spawner_priming/kill_displays 1t