
scoreboard players set .tutorial_puzzle shanger.data 1

fill 363 48 -97 363 45 -95 air
tellraw @a {"text":"Orange Wool unlocked!","color":"gold"}
particle minecraft:happy_villager 363.00 46.52 -95.25 1 1 1 0 30 normal
execute as @a at @s run playsound minecraft:entity.player.levelup master @s ~ ~ ~ 0.4 1