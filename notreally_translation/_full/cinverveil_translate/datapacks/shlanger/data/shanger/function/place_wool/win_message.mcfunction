

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

execute if score .win_message shanger.data matches 65 run title @a subtitle [{"text":"ㅁ","color":"#FFC44F","bold":false}]
execute if score .win_message shanger.data matches 67 run title @a subtitle [{"text":"마","color":"#FFC44F","bold":false}]
execute if score .win_message shanger.data matches 69 run title @a subtitle [{"text":"매","color":"#FFC44F","bold":false}]
execute if score .win_message shanger.data matches 71 run title @a subtitle [{"text":"맵","color":"#FFC44F","bold":false}]
execute if score .win_message shanger.data matches 73 run title @a subtitle [{"text":"맵 ","color":"#FFC44F","bold":false}]
execute if score .win_message shanger.data matches 75 run title @a subtitle [{"text":"맵 ㅇ","color":"#FFC44F","bold":false}]
execute if score .win_message shanger.data matches 77 run title @a subtitle [{"text":"맵 오","color":"#FFC44F","bold":false}]
execute if score .win_message shanger.data matches 79 run title @a subtitle [{"text":"맵 와","color":"#FFC44F","bold":false}]
execute if score .win_message shanger.data matches 81 run title @a subtitle [{"text":"맵 완","color":"#FFC44F","bold":false}]
execute if score .win_message shanger.data matches 83 run title @a subtitle [{"text":"맵 완ㄹ","color":"#FFC44F","bold":false}]
execute if score .win_message shanger.data matches 85 run title @a subtitle [{"text":"맵 완로","color":"#FFC44F","bold":false}]
execute if score .win_message shanger.data matches 87 run title @a subtitle [{"text":"맵 완료","color":"#FFC44F","bold":false}]

execute if score .win_message shanger.data matches 100 run title @a subtitle [{"text":"맵 완료","color":"#FFFFFF","bold":false,"underlined":true}]
execute if score .win_message shanger.data matches 102 run title @a subtitle [{"text":"맵 완료","color":"#FFDDAB","bold":false,"underlined":true}]
execute if score .win_message shanger.data matches 105 run title @a subtitle [{"text":"맵 완료","color":"#FFC44F","bold":false,"underlined":true}]

execute if score .win_message shanger.data matches 180 run tellraw @a [{"color":"gold","text":"----------------------"},{"bold":true,"color":"#FFE252","text":"\n\n주 개발진: KVT & Mowse"},{"bold":false,"color":"#FFD59E","text":"\n\n기여자: \n\n","underlined":true},{"bold":false,"color":"#FFFCA3","text":"link2012  Cake  CooleyBrekka\nrenderXR  Enigma  Suso"},{"color":"gold","italic":false,"text":"\n\n----------------------"}]

execute if score .win_message shanger.data matches 280 run tellraw @a [{"color":"gold","text":"----------------------"},{"bold":false,"color":"#FFECCF","text":"\n\n플레이해 주셔서 감사합니다! 이 맵이 여러분에게 감동을 주었기를 바랍니다!\n여기 있는 동안 이 링크들을 확인해 보세요!","underlined":false},{"bold":true,"color":"#FFA8A8","italic":false,"text":"\n\nCTM 월간호 ","underlined":false},{"clickEvent":{"action":"open_url","value":"https://youtube.com/playlist?list=PL4C54N-QlQUHu8yKZNqfYbUiW_qOIpIu_&si=vW6iACDQ1Oe_m7Y6"},"color":"#FFFFFF","hoverEvent":{"action":"show_text","value":[{"text":"CTM 월간호 플레이리스트를 열려면 클릭하세요"}]},"italic":false,"text":"[링크]"},{"bold":true,"color":"#ABCDFF","italic":false,"text":"\n\n더 많은 CTM 맵들 "},{"bold":false,"clickEvent":{"action":"open_url","value":"https://ctmrepository.com/"},"color":"white","hoverEvent":{"action":"show_text","value":[{"text":"더 많은 CTM 맵들을 찾으려면 클릭하세요"}]},"italic":false,"text":"[링크]"},{"bold":true,"color":"#B7A8FF","italic":false,"text":"\n\nCTM Community Discord "},{"bold":false,"clickEvent":{"action":"open_url","value":"https://ctm.community/"},"color":"white","hoverEvent":{"action":"show_text","value":[{"text":"\CTM Community Discord에 들어가려면 클릭하세요!"}]},"text":"[링크]"},{"color":"gold","italic":false,"text":"\n\n----------------------"}]


execute if score .win_message shanger.data matches 280 if score .chal_ratio shanger.data matches 97.. run tellraw @a {"text":"\n챌린지 모드를 완료한 것을 축하합니다! 트로피 헬멧을 즐기세요!","color":"red","bold":true}



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

