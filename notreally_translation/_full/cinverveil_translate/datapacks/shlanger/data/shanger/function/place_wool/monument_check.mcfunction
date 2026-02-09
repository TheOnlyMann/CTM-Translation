
scoreboard players add .total_submissions shanger.data 1
scoreboard players set .correct_wools shanger.data 0
scoreboard players set .submission_cd shanger.data 10

execute if score .total_submissions shanger.data matches 3 run summon item 105 68.25 -132 {Glowing:1b,Age:-32768,Item:{id:"minecraft:nether_star",count:1,components:{"minecraft:consumable":{consume_seconds:3,animation:"eat",sound:"block.spawner.hit",has_consume_particles:true},"minecraft:item_name":{"bold":true,"color":"#FF8A8A","italic":false,"text":"포기의 별","underlined":true},"minecraft:lore":[" ",{"color":"#FF7575","italic":false,"text":"기념비 퍼즐을 포기하려면 먹으세요"},{"color":"#FF7575","italic":false,"text":"(Irreversible)"}]}}}

function shanger:place_wool/update_display


execute if block 90 68 -123 yellow_wool run scoreboard players add .correct_wools shanger.data 1
execute if block 90 68 -125 orange_wool run scoreboard players add .correct_wools shanger.data 1
execute if block 91 68 -127 light_gray_wool run scoreboard players add .correct_wools shanger.data 1
execute if block 92 68 -129 gray_wool run scoreboard players add .correct_wools shanger.data 1
execute if block 94 68 -131 green_wool run scoreboard players add .correct_wools shanger.data 1
execute if block 96 68 -132 red_wool run scoreboard players add .correct_wools shanger.data 1
execute if block 98 68 -133 black_wool run scoreboard players add .correct_wools shanger.data 1
execute if block 100 68 -133 white_wool run scoreboard players add .correct_wools shanger.data 1


execute unless score .correct_wools shanger.data matches 8.. run function shanger:place_wool/wrong_submission

execute if score .correct_wools shanger.data matches 8.. if score .win_message shanger.data matches 0 run data modify entity @n[type=minecraft:text_display,tag=ts_display] text.color set value green
execute if score .correct_wools shanger.data matches 8.. if score .win_message shanger.data matches 0 if score .total_submissions shanger.data matches 1 run data modify entity @n[type=minecraft:text_display,tag=ts_display] text.color set value aqua
execute if score .correct_wools shanger.data matches 8.. if score .win_message shanger.data matches 0 run function shanger:place_wool/end_map
execute if score .correct_wools shanger.data matches 8.. if score .win_message shanger.data matches 0 run scoreboard players set .win_message shanger.data 1

