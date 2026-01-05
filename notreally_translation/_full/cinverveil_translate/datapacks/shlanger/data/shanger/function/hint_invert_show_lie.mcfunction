
data remove block 92 238 -119 Items[{Slot:0b}].components."minecraft:lore"[-1]
data remove block 92 238 -119 Items[{Slot:0b}].components."minecraft:lore"[-1]
data modify block 92 238 -119 Items[{Slot:0b}].components."minecraft:lore" append value {italic:0b,text:"When not on Monument:","color":"gray"}
item modify block 92 238 -119 container.0 shanger:apply_lie
data modify block 92 238 -119 Items[{Slot:0b}].components."minecraft:custom_data".showing set value "lie"
item replace entity @s weapon.mainhand from block 92 238 -119 container.0
data remove storage shanger:storage showing