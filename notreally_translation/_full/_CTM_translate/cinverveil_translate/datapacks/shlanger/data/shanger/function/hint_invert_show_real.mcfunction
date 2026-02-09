
data remove block 92 238 -119 Items[{Slot:0b}].components."minecraft:lore"[-1]
data remove block 92 238 -119 Items[{Slot:0b}].components."minecraft:lore"[-1]
data modify block 92 238 -119 Items[{Slot:0b}].components."minecraft:lore" append value {italic:0b,text:"기념비에 올라갈 경우:","color":"gray"}
item modify block 92 238 -119 container.0 shanger:apply_hint
data modify block 92 238 -119 Items[{Slot:0b}].components."minecraft:custom_data".showing set value "real"
item replace entity @s weapon.mainhand from block 92 238 -119 container.0
data remove storage shanger:storage showing