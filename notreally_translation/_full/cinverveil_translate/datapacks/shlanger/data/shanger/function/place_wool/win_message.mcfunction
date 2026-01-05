

title @a times 0t 200t 20t



execute if score .win_message shanger.data matches 20 run title @a title [{"text":"C","color":"#FFD68F","bold":true}]
execute if score .win_message shanger.data matches 24 run title @a title [{"text":"Ci","color":"#FFD68F","bold":true}]
execute if score .win_message shanger.data matches 28 run title @a title [{"text":"Cin","color":"#FFD68F","bold":true}]
execute if score .win_message shanger.data matches 32 run title @a title [{"text":"Cind","color":"#FFD68F","bold":true}]
execute if score .win_message shanger.data matches 36 run title @a title [{"text":"Cinde","color":"#FFD68F","bold":true}]
execute if score .win_message shanger.data matches 40 run title @a title [{"text":"Cinder","color":"#FFD68F","bold":true}]
execute if score .win_message shanger.data matches 44 run title @a title [{"text":"Cinderv","color":"#FFD68F","bold":true}]
execute if score .win_message shanger.data matches 48 run title @a title [{"text":"Cinderve","color":"#FFD68F","bold":true}]
execute if score .win_message shanger.data matches 52 run title @a title [{"text":"Cindervei","color":"#FFD68F","bold":true}]
execute if score .win_message shanger.data matches 56 run title @a title [{"text":"Cinderveil","color":"#FFD68F","bold":true}]

execute if score .win_message shanger.data matches 100 run title @a title [{"text":"Cinderveil","color":"#FFFFFF","bold":true,"underlined":true}]
execute if score .win_message shanger.data matches 102 run title @a title [{"text":"Cinderveil","color":"#FFDDAB","bold":true,"underlined":true}]
execute if score .win_message shanger.data matches 105 run title @a title [{"text":"Cinderveil","color":"#FFD68F","bold":true,"underlined":true}]

execute if score .win_message shanger.data matches 65 run title @a subtitle [{"text":"M","color":"#FFC44F","bold":false}]
execute if score .win_message shanger.data matches 67 run title @a subtitle [{"text":"Ma","color":"#FFC44F","bold":false}]
execute if score .win_message shanger.data matches 69 run title @a subtitle [{"text":"Map","color":"#FFC44F","bold":false}]
execute if score .win_message shanger.data matches 71 run title @a subtitle [{"text":"Map ","color":"#FFC44F","bold":false}]
execute if score .win_message shanger.data matches 73 run title @a subtitle [{"text":"Map C","color":"#FFC44F","bold":false}]
execute if score .win_message shanger.data matches 75 run title @a subtitle [{"text":"Map Co","color":"#FFC44F","bold":false}]
execute if score .win_message shanger.data matches 77 run title @a subtitle [{"text":"Map Com","color":"#FFC44F","bold":false}]
execute if score .win_message shanger.data matches 79 run title @a subtitle [{"text":"Map Comp","color":"#FFC44F","bold":false}]
execute if score .win_message shanger.data matches 81 run title @a subtitle [{"text":"Map Compl","color":"#FFC44F","bold":false}]
execute if score .win_message shanger.data matches 83 run title @a subtitle [{"text":"Map Comple","color":"#FFC44F","bold":false}]
execute if score .win_message shanger.data matches 85 run title @a subtitle [{"text":"Map Complet","color":"#FFC44F","bold":false}]
execute if score .win_message shanger.data matches 87 run title @a subtitle [{"text":"Map Complete","color":"#FFC44F","bold":false}]

execute if score .win_message shanger.data matches 100 run title @a subtitle [{"text":"Map Complete","color":"#FFFFFF","bold":false,"underlined":true}]
execute if score .win_message shanger.data matches 102 run title @a subtitle [{"text":"Map Complete","color":"#FFDDAB","bold":false,"underlined":true}]
execute if score .win_message shanger.data matches 105 run title @a subtitle [{"text":"Map Complete","color":"#FFC44F","bold":false,"underlined":true}]

execute if score .win_message shanger.data matches 180 run tellraw @a [{"color":"gold","text":"----------------------"},{"bold":true,"color":"#FFE252","text":"\n\nLed by: KVT & Mowse"},{"bold":false,"color":"#FFD59E","text":"\n\nContributors: \n\n","underlined":true},{"bold":false,"color":"#FFFCA3","text":"link2012  Cake  CooleyBrekka\nrenderXR  Enigma  Suso"},{"color":"gold","italic":false,"text":"\n\n----------------------"}]

execute if score .win_message shanger.data matches 280 run tellraw @a [{"color":"gold","text":"----------------------"},{"bold":false,"color":"#FFECCF","text":"\n\nThanks for playing! I hope this map has touched you!\nCheck out these links while you're here!","underlined":false},{"bold":true,"color":"#FFA8A8","italic":false,"text":"\n\nCTM Monthly Recaps ","underlined":false},{"clickEvent":{"action":"open_url","value":"https://youtube.com/playlist?list=PL4C54N-QlQUHu8yKZNqfYbUiW_qOIpIu_&si=vW6iACDQ1Oe_m7Y6"},"color":"#FFFFFF","hoverEvent":{"action":"show_text","value":[{"text":"Click to open a playlist for the CTM Monthly Recaps"}]},"italic":false,"text":"[Link]"},{"bold":true,"color":"#ABCDFF","italic":false,"text":"\n\nMore CTM Maps "},{"bold":false,"clickEvent":{"action":"open_url","value":"https://ctmrepository.com/"},"color":"white","hoverEvent":{"action":"show_text","value":[{"text":"Click to find more CTM Maps"}]},"italic":false,"text":"[Link]"},{"bold":true,"color":"#B7A8FF","italic":false,"text":"\n\nCTM Community Discord "},{"bold":false,"clickEvent":{"action":"open_url","value":"https://ctm.community/"},"color":"white","hoverEvent":{"action":"show_text","value":[{"text":"Click to join the CTM Community Discord!"}]},"text":"[Link]"},{"color":"gold","italic":false,"text":"\n\n----------------------"}]


execute if score .win_message shanger.data matches 280 if score .chal_ratio shanger.data matches 97.. run tellraw @a {"text":"\nCongrats on beating Challenge Mode! Enjoy the trophy helmet!","color":"red","bold":true}



execute if score .win_message shanger.data matches 20 as @a at @s run playsound minecraft:block.end_portal_frame.fill master @s ~ ~ ~ 0.5 2
execute if score .win_message shanger.data matches 24 as @a at @s run playsound minecraft:block.end_portal_frame.fill master @s ~ ~ ~ 0.5 2
execute if score .win_message shanger.data matches 28 as @a at @s run playsound minecraft:block.end_portal_frame.fill master @s ~ ~ ~ 0.5 2
execute if score .win_message shanger.data matches 32 as @a at @s run playsound minecraft:block.end_portal_frame.fill master @s ~ ~ ~ 0.5 2
execute if score .win_message shanger.data matches 36 as @a at @s run playsound minecraft:block.end_portal_frame.fill master @s ~ ~ ~ 0.5 2
execute if score .win_message shanger.data matches 40 as @a at @s run playsound minecraft:block.end_portal_frame.fill master @s ~ ~ ~ 0.5 2
execute if score .win_message shanger.data matches 44 as @a at @s run playsound minecraft:block.end_portal_frame.fill master @s ~ ~ ~ 0.5 2
execute if score .win_message shanger.data matches 48 as @a at @s run playsound minecraft:block.end_portal_frame.fill master @s ~ ~ ~ 0.5 2
execute if score .win_message shanger.data matches 52 as @a at @s run playsound minecraft:block.end_portal_frame.fill master @s ~ ~ ~ 0.5 2
execute if score .win_message shanger.data matches 56 as @a at @s run playsound minecraft:block.end_portal_frame.fill master @s ~ ~ ~ 0.5 2


execute if score .win_message shanger.data matches 65 as @a at @s run playsound minecraft:block.end_portal_frame.fill master @s ~ ~ ~ 0.5 2
execute if score .win_message shanger.data matches 67 as @a at @s run playsound minecraft:block.end_portal_frame.fill master @s ~ ~ ~ 0.5 2
execute if score .win_message shanger.data matches 69 as @a at @s run playsound minecraft:block.end_portal_frame.fill master @s ~ ~ ~ 0.5 2
execute if score .win_message shanger.data matches 71 as @a at @s run playsound minecraft:block.end_portal_frame.fill master @s ~ ~ ~ 0.5 2
execute if score .win_message shanger.data matches 73 as @a at @s run playsound minecraft:block.end_portal_frame.fill master @s ~ ~ ~ 0.5 2
execute if score .win_message shanger.data matches 75 as @a at @s run playsound minecraft:block.end_portal_frame.fill master @s ~ ~ ~ 0.5 2
execute if score .win_message shanger.data matches 77 as @a at @s run playsound minecraft:block.end_portal_frame.fill master @s ~ ~ ~ 0.5 2
execute if score .win_message shanger.data matches 79 as @a at @s run playsound minecraft:block.end_portal_frame.fill master @s ~ ~ ~ 0.5 2
execute if score .win_message shanger.data matches 81 as @a at @s run playsound minecraft:block.end_portal_frame.fill master @s ~ ~ ~ 0.5 2
execute if score .win_message shanger.data matches 83 as @a at @s run playsound minecraft:block.end_portal_frame.fill master @s ~ ~ ~ 0.5 2
execute if score .win_message shanger.data matches 85 as @a at @s run playsound minecraft:block.end_portal_frame.fill master @s ~ ~ ~ 0.5 2
execute if score .win_message shanger.data matches 87 as @a at @s run playsound minecraft:block.end_portal_frame.fill master @s ~ ~ ~ 0.5 2

execute if score .win_message shanger.data matches 100 as @a at @s run playsound minecraft:block.end_portal.spawn master @s ~ ~ ~ 0.25 1.5
execute if score .win_message shanger.data matches 100 as @a at @s run playsound minecraft:item.trident.thunder master @s ~ ~ ~ 0.25 0.8

execute if score .win_message shanger.data matches 180 as @a at @s run playsound minecraft:entity.item.pickup
execute if score .win_message shanger.data matches 280 as @a at @s run playsound minecraft:entity.item.pickup

