#Ends the priming process
execute if score chests_randomized st_priming >= total_chests st_priming run title @a actionbar [{"text":"Chests randomized ","color":"gray"},{"score":{"name":"chests_randomized","objective":"st_priming"},"color":"green"},{"text":"/"},{"score":{"name":"total_chests","objective":"st_priming"},"color":"green"}]
execute unless score chests_randomized st_priming >= total_chests st_priming run title @a actionbar [{"text":"Chests randomized ","color":"gray"},{"score":{"name":"chests_randomized","objective":"st_priming"},"color":"dark_red"},{"text":"/"},{"score":{"name":"total_chests","objective":"st_priming"},"color":"red"}]
execute unless score chests_randomized st_priming >= total_chests st_priming run tellraw @a {"color":"red","italic":false,"text":"Something went wrong so chest randomization was cancelled."}
execute unless score chests_randomized st_priming >= total_chests st_priming as @a at @s run playsound minecraft:block.note_block.didgeridoo master @s ~ ~ ~ 1 1

#flags
scoreboard players set random_timer st_priming 0
scoreboard players set chests_randomized st_priming -1
scoreboard players set chests_checked st_priming -1
scoreboard players set $st_ongoing_process temp 0

#Killing displays
execute if entity @e[tag=st_primer,type=item_display,limit=1] run schedule function spawner_tweaker:spawner_priming/kill_displays 1t

#Removing the giga data storage failsafe (is very L A R G E)
execute unless entity @a[name=_link_2012_] unless score debug temp matches 1.. run data remove storage spawner_tweaker:temp container_randomizer