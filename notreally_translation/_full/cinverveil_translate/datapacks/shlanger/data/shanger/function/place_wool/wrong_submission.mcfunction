

execute as @a at @s run playsound minecraft:item.totem.use master @s ~ ~ ~ 0.5
title @a title {"text":"Incorrect","bold":true,"color":"red"}

tellraw @a ["",{color:"gold",text:"You have placed "},{score:{name:".correct_wools",objective:"shanger.data"}},{color:"gold",text:" wools correctly"}]