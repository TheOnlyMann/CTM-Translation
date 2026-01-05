

title @a times 0t 200t 20t
advancement revoke @s only shanger:surrender

scoreboard players set .win_message shanger.data 281

execute as @a at @s run playsound minecraft:entity.wither.death master @s ~ ~ ~ 0.5 0.5

title @a title [{"text":"Cinderveil","color":"#FFD68F","bold":true,"underlined":true}]

title @a subtitle [{"text":"Puzzle Incomplete","color":"red","bold":false}]

function shanger:place_wool/end_map

data merge entity @n[type=text_display,tag=ts_display] {text:{"bold":true,"color":"red","text":"X"}}

