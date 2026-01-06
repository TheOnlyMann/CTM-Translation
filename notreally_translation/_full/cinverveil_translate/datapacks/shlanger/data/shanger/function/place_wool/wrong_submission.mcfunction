

execute as @a at @s run playsound minecraft:item.totem.use master @s ~ ~ ~ 0.5
title @a title {"text":"오답","bold":true,"color":"red"}

tellraw @a ["",{color:"gold",text:"알맞게 설치한 양털의 수는 "},{score:{name:".correct_wools",objective:"shanger.data"}},{color:"gold",text:"개입니다"}]