

tellraw @s [{"color":"gold","text":"----------------------"}]

tellraw @s [{"bold":true,"color":"#FFEB9C","text":"Map Progress:\n"}]



execute if score .wool1 shanger.data matches 1 run tellraw @s [{"text":"✔ ","color":"green"},{"text":"White Wool (Survival Mode)","color":"#E3E3E3"}]
execute if score .wool2 shanger.data matches 1 run tellraw @s [{"text":"✔ ","color":"green"},{"text":"Orange Wool (+0.5 Hit Reach)","color":"#FFA845"}]
execute if score .wool3 shanger.data matches 1 run tellraw @s [{"text":"✔ ","color":"green"},{"text":"Magenta Wool (+2 Mining Efficiency)","color":"#E97DFF"}]
execute if score .wool4 shanger.data matches 1 run tellraw @s [{"text":"✔ ","color":"green"},{"text":"Light Blue Wool (+2 Armor)","color":"#78E8FF"}]
execute if score .wool5 shanger.data matches 1 run tellraw @s [{"text":"✔ ","color":"green"},{"text":"Yellow Wool (+2 Knockback Resistance)","color":"#FBFF82"}]
execute if score .wool6 shanger.data matches 1 run tellraw @s [{"text":"✔ ","color":"green"},{"text":"Lime Wool (+1 Attack Damage)","color":"#61FF66"}]
execute if score .wool7 shanger.data matches 1 run tellraw @s [{"text":"✔ ","color":"green"},{"text":"Pink Wool (+0.5 Block Reach)","color":"#FDBFFF"}]
execute if score .wool8 shanger.data matches 1 run tellraw @s [{"text":"✔ ","color":"green"},{"text":"Gray Wool (+50% Fall Resistance)","color":"#C7C7C7"}]
execute if score .wool9 shanger.data matches 1 run tellraw @s [{"text":"✔ ","color":"green"},{"text":"Light Gray Wool (Poison Immunity)","color":"#D6D6D6"}]
execute if score .wool10 shanger.data matches 1 run tellraw @s [{"text":"✔ ","color":"green"},{"text":"Cyan Wool (Permanent Levels)","color":"#56DEE3"}]
execute if score .wool11 shanger.data matches 1 run tellraw @s [{"text":"✔ ","color":"green"},{"text":"Purple Wool (+15% Speed)","color":"#BE99FF"}]
execute if score .wool12 shanger.data matches 1 run tellraw @s [{"text":"✔ ","color":"green"},{"text":"Brown Wool (Keep Inventory)","color":"#BD957E"}]
execute if score .wool13 shanger.data matches 1 run tellraw @s [{"text":"✔ ","color":"green"},{"text":"Blue Wool (+50% Max Health)","color":"#699BFF"}]
execute if score .wool14 shanger.data matches 1 run tellraw @s [{"text":"✔ ","color":"green"},{"text":"Green Wool (Infinite Attack Speed)","color":"#73C77F"}]
execute if score .wool15 shanger.data matches 1 run tellraw @s [{"text":"✔ ","color":"green"},{"text":"Red Wool (Giga Kills)","color":"#FF7575"}]
execute if score .wool16 shanger.data matches 1 run tellraw @s [{"text":"✔ ","color":"green"},{"text":"Black Wool (Creative Mode)","color":"#ADADAD"}]

execute unless score .wool1 shanger.data matches 1 run tellraw @s [{"text":"White Wool","color":"gray","italic":true}]
execute unless score .wool2 shanger.data matches 1 run tellraw @s [{"text":"Orange Wool","color":"gray","italic":true}]
execute unless score .wool3 shanger.data matches 1 run tellraw @s [{"text":"Magenta Wool","color":"gray","italic":true}]
execute unless score .wool4 shanger.data matches 1 run tellraw @s [{"text":"Light Blue Wool","color":"gray","italic":true}]
execute unless score .wool5 shanger.data matches 1 run tellraw @s [{"text":"Yellow Wool","color":"gray","italic":true}]
execute unless score .wool6 shanger.data matches 1 run tellraw @s [{"text":"Lime Wool","color":"gray","italic":true}]
execute unless score .wool7 shanger.data matches 1 run tellraw @s [{"text":"Pink Wool","color":"gray","italic":true}]
execute unless score .wool8 shanger.data matches 1 run tellraw @s [{"text":"Gray Wool","color":"gray","italic":true}]
execute unless score .wool9 shanger.data matches 1 run tellraw @s [{"text":"Light Gray Wool","color":"gray","italic":true}]
execute unless score .wool10 shanger.data matches 1 run tellraw @s [{"text":"Cyan Wool","color":"gray","italic":true}]
execute unless score .wool11 shanger.data matches 1 run tellraw @s [{"text":"Purple Wool","color":"gray","italic":true}]
execute unless score .wool12 shanger.data matches 1 run tellraw @s [{"text":"Brown Wool","color":"gray","italic":true}]
execute unless score .wool13 shanger.data matches 1 run tellraw @s [{"text":"Blue Wool","color":"gray","italic":true}]
execute unless score .wool14 shanger.data matches 1 run tellraw @s [{"text":"Green Wool","color":"gray","italic":true}]
execute unless score .wool15 shanger.data matches 1 run tellraw @s [{"text":"Red Wool","color":"gray","italic":true}]
execute unless score .wool16 shanger.data matches 1 run tellraw @s [{"text":"Black Wool","color":"gray","italic":true}]



tellraw @s [{"color":"gold","text":"----------------------"}]

playsound minecraft:ui.button.click master @s ~ ~ ~ 0.3 1