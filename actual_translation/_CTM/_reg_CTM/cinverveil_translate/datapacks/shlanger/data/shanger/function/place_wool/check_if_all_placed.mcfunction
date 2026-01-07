

scoreboard players set .any_wool shanger.data 0

execute if block 90 68 -123 #minecraft:wool run scoreboard players add .any_wool shanger.data 1
execute if block 90 68 -125 #minecraft:wool run scoreboard players add .any_wool shanger.data 1
execute if block 91 68 -127 #minecraft:wool run scoreboard players add .any_wool shanger.data 1
execute if block 92 68 -129 #minecraft:wool run scoreboard players add .any_wool shanger.data 1
execute if block 94 68 -131 #minecraft:wool run scoreboard players add .any_wool shanger.data 1
execute if block 96 68 -132 #minecraft:wool run scoreboard players add .any_wool shanger.data 1
execute if block 98 68 -133 #minecraft:wool run scoreboard players add .any_wool shanger.data 1
execute if block 100 68 -133 #minecraft:wool run scoreboard players add .any_wool shanger.data 1

execute unless score .any_wool shanger.data matches 8.. run function shanger:place_wool/missing_wool
execute if score .any_wool shanger.data matches 8.. run function shanger:place_wool/monument_check