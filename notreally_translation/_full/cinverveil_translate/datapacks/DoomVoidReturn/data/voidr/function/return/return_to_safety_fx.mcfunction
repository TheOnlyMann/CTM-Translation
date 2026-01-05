playsound minecraft:block.ender_chest.open player @s ~ ~ ~ 0.8 0.5
particle minecraft:trial_spawner_detection_ominous ~ ~ ~ 1 1 1 0 100 force
effect give @s minecraft:slow_falling 1 0 true
effect give @s minecraft:mining_fatigue 15 0 true
effect give @s minecraft:slowness 15 1 true
damage @s 4 minecraft:out_of_world