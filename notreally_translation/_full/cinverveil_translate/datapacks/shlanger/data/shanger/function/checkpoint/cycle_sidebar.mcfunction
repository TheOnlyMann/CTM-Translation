

scoreboard players add .sidebar_cycle shanger.data 1
scoreboard players set .sidebar_timer shanger.data 7
execute if score .sidebar_cycle shanger.data matches 7.. run scoreboard players set .sidebar_cycle shanger.data 1

execute if score .sidebar_cycle shanger.data matches 1 run scoreboard objectives setdisplay sidebar stats.deaths
execute if score .sidebar_cycle shanger.data matches 2 run scoreboard objectives setdisplay sidebar stats.totems
execute if score .sidebar_cycle shanger.data matches 3 run scoreboard objectives setdisplay sidebar stats.spawners
execute if score .sidebar_cycle shanger.data matches 4 run scoreboard objectives setdisplay sidebar stats.mobkills
execute if score .sidebar_cycle shanger.data matches 5 run scoreboard objectives setdisplay sidebar stats.torch
execute if score .sidebar_cycle shanger.data matches 6 run scoreboard objectives setdisplay sidebar stats.time




