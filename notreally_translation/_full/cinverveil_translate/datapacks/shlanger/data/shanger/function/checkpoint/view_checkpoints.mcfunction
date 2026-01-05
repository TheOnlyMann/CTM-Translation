

tellraw @s [{"color":"gold","text":"----------------------\n"}]

tellraw @s [{"bold":true,"color":"#FFEB9C","text":"Checkpoints"}]
tellraw @s [{"text":"(Click on a checkpoint to teleport to it)\n"}]

execute if score .checkpoint1 shanger.data matches 1 run tellraw @s {"clickEvent":{"action":"run_command","value":"/trigger shanger.trigger set 101"},"color":"gray","hoverEvent":{"action":"show_text","value":[{"text":"Click to teleport to the Checkpoint 1"}]},"text":"Checkpoint 1: Spawn"}
execute if score .checkpoint2 shanger.data matches 1 run tellraw @s {"clickEvent":{"action":"run_command","value":"/trigger shanger.trigger set 102"},"color":"gray","hoverEvent":{"action":"show_text","value":[{"text":"Click to teleport to the Checkpoint 2"}]},"text":"Checkpoint 2: Poverty Cave"}
execute if score .checkpoint3 shanger.data matches 1 run tellraw @s {"clickEvent":{"action":"run_command","value":"/trigger shanger.trigger set 103"},"color":"gray","hoverEvent":{"action":"show_text","value":[{"text":"Click to teleport to the Checkpoint 3"}]},"text":"Checkpoint 3: Dark Crossroads"}
execute if score .checkpoint4 shanger.data matches 1 run tellraw @s {"clickEvent":{"action":"run_command","value":"/trigger shanger.trigger set 104"},"color":"gray","hoverEvent":{"action":"show_text","value":[{"text":"Click to teleport to the Checkpoint 4"}]},"text":"Checkpoint 4: Warped Ruins"}
execute if score .checkpoint5 shanger.data matches 1 run tellraw @s {"clickEvent":{"action":"run_command","value":"/trigger shanger.trigger set 105"},"color":"gray","hoverEvent":{"action":"show_text","value":[{"text":"Click to teleport to the Checkpoint 5"}]},"text":"Checkpoint 5: The Gigabox"}
execute if score .checkpoint6 shanger.data matches 1 run tellraw @s {"clickEvent":{"action":"run_command","value":"/trigger shanger.trigger set 106"},"color":"gray","hoverEvent":{"action":"show_text","value":[{"text":"Click to teleport to the Checkpoint 6"}]},"text":"Checkpoint 6: Shitbanger Shitadels"}

tellraw @s [{"color":"gold","text":"----------------------\n"}]

playsound minecraft:ui.button.click master @s ~ ~ ~ 0.3 1