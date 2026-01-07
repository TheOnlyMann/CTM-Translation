

tellraw @s [{"color":"gold","text":"----------------------\n"}]

tellraw @s [{"bold":true,"color":"#FFEB9C","text":"체크포인트"}]
tellraw @s [{"text":"(체크포인트를 클릭하여 순간이동합니다)\n"}]

execute if score .checkpoint1 shanger.data matches 1 run tellraw @s {"clickEvent":{"action":"run_command","value":"/trigger shanger.trigger set 101"},"color":"gray","hoverEvent":{"action":"show_text","value":[{"text":"체크포인트 1로 순간이동"}]},"text":"체크포인트 1: 시작 지점"}
execute if score .checkpoint2 shanger.data matches 1 run tellraw @s {"clickEvent":{"action":"run_command","value":"/trigger shanger.trigger set 102"},"color":"gray","hoverEvent":{"action":"show_text","value":[{"text":"체크포인트 2로 순간이동"}]},"text":"체크포인트 2: 가난뱅이 동굴"}
execute if score .checkpoint3 shanger.data matches 1 run tellraw @s {"clickEvent":{"action":"run_command","value":"/trigger shanger.trigger set 103"},"color":"gray","hoverEvent":{"action":"show_text","value":[{"text":"체크포인트 3로 순간이동"}]},"text":"체크포인트 3: 어두운 교차로"}
execute if score .checkpoint4 shanger.data matches 1 run tellraw @s {"clickEvent":{"action":"run_command","value":"/trigger shanger.trigger set 104"},"color":"gray","hoverEvent":{"action":"show_text","value":[{"text":"체크포인트 4로 순간이동"}]},"text":"체크포인트 4: 뒤틀린 폐허"}
execute if score .checkpoint5 shanger.data matches 1 run tellraw @s {"clickEvent":{"action":"run_command","value":"/trigger shanger.trigger set 105"},"color":"gray","hoverEvent":{"action":"show_text","value":[{"text":"체크포인트 5로 순간이동"}]},"text":"체크포인트 5: 기가박스"}
execute if score .checkpoint6 shanger.data matches 1 run tellraw @s {"clickEvent":{"action":"run_command","value":"/trigger shanger.trigger set 106"},"color":"gray","hoverEvent":{"action":"show_text","value":[{"text":"체크포인트 6로 순간이동"}]},"text":"체크포인트 6: 쉿뱅거 시타델"}
tellraw @s [{"color":"gold","text":"----------------------\n"}]

playsound minecraft:ui.button.click master @s ~ ~ ~ 0.3 1