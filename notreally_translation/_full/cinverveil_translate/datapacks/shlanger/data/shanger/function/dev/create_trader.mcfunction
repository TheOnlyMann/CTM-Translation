
summon villager ~ ~ ~ {Invulnerable:1b,attributes:[{id:"minecraft:movement_speed",base:0}],VillagerData:{level:99,profession:"minecraft:armorer",type:"minecraft:plains"},Offers:{Recipes:[{maxUses:9999999,xp:0,buy:{id:"minecraft:debug_stick",count:1},buyB:{id:"minecraft:debug_stick",count:1},sell:{id:"minecraft:debug_stick",count:1}},{maxUses:9999999,xp:0,buy:{id:"minecraft:debug_stick",count:1},buyB:{id:"minecraft:debug_stick",count:1},sell:{id:"minecraft:debug_stick",count:1}},{maxUses:9999999,xp:0,buy:{id:"minecraft:debug_stick",count:1},buyB:{id:"minecraft:debug_stick",count:1},sell:{id:"minecraft:debug_stick",count:1}},{maxUses:9999999,xp:0,buy:{id:"minecraft:debug_stick",count:1},buyB:{id:"minecraft:debug_stick",count:1},sell:{id:"minecraft:debug_stick",count:1}},{maxUses:9999999,xp:0,buy:{id:"minecraft:debug_stick",count:1},buyB:{id:"minecraft:debug_stick",count:1},sell:{id:"minecraft:debug_stick",count:1}},{maxUses:9999999,xp:0,buy:{id:"minecraft:debug_stick",count:1},buyB:{id:"minecraft:debug_stick",count:1},sell:{id:"minecraft:debug_stick",count:1}},{maxUses:9999999,xp:0,buy:{id:"minecraft:debug_stick",count:1},buyB:{id:"minecraft:debug_stick",count:1},sell:{id:"minecraft:debug_stick",count:1}},{maxUses:9999999,xp:0,buy:{id:"minecraft:debug_stick",count:1},buyB:{id:"minecraft:debug_stick",count:1},sell:{id:"minecraft:debug_stick",count:1}},{maxUses:9999999,xp:0,buy:{id:"minecraft:debug_stick",count:1},buyB:{id:"minecraft:debug_stick",count:1},sell:{id:"minecraft:debug_stick",count:1}}]}}
data modify entity @n[type=villager] Offers.Recipes[0].buy set from block ~ ~ ~ Items[{Slot:0b}]
data modify entity @n[type=villager] Offers.Recipes[1].buy set from block ~ ~ ~ Items[{Slot:1b}]
data modify entity @n[type=villager] Offers.Recipes[2].buy set from block ~ ~ ~ Items[{Slot:2b}]
data modify entity @n[type=villager] Offers.Recipes[3].buy set from block ~ ~ ~ Items[{Slot:3b}]
data modify entity @n[type=villager] Offers.Recipes[4].buy set from block ~ ~ ~ Items[{Slot:4b}]
data modify entity @n[type=villager] Offers.Recipes[5].buy set from block ~ ~ ~ Items[{Slot:5b}]
data modify entity @n[type=villager] Offers.Recipes[6].buy set from block ~ ~ ~ Items[{Slot:6b}]
data modify entity @n[type=villager] Offers.Recipes[7].buy set from block ~ ~ ~ Items[{Slot:7b}]
data modify entity @n[type=villager] Offers.Recipes[8].buy set from block ~ ~ ~ Items[{Slot:8b}]


data modify entity @n[type=villager] Offers.Recipes[0].buyB set from block ~ ~ ~ Items[{Slot:9b}]
data modify entity @n[type=villager] Offers.Recipes[1].buyB set from block ~ ~ ~ Items[{Slot:10b}]
data modify entity @n[type=villager] Offers.Recipes[2].buyB set from block ~ ~ ~ Items[{Slot:11b}]
data modify entity @n[type=villager] Offers.Recipes[3].buyB set from block ~ ~ ~ Items[{Slot:12b}]
data modify entity @n[type=villager] Offers.Recipes[4].buyB set from block ~ ~ ~ Items[{Slot:13b}]
data modify entity @n[type=villager] Offers.Recipes[5].buyB set from block ~ ~ ~ Items[{Slot:14b}]
data modify entity @n[type=villager] Offers.Recipes[6].buyB set from block ~ ~ ~ Items[{Slot:15b}]
data modify entity @n[type=villager] Offers.Recipes[7].buyB set from block ~ ~ ~ Items[{Slot:16b}]
data modify entity @n[type=villager] Offers.Recipes[8].buyB set from block ~ ~ ~ Items[{Slot:17b}]


data modify entity @n[type=villager] Offers.Recipes[0].sell set from block ~ ~ ~ Items[{Slot:18b}]
data modify entity @n[type=villager] Offers.Recipes[1].sell set from block ~ ~ ~ Items[{Slot:19b}]
data modify entity @n[type=villager] Offers.Recipes[2].sell set from block ~ ~ ~ Items[{Slot:20b}]
data modify entity @n[type=villager] Offers.Recipes[3].sell set from block ~ ~ ~ Items[{Slot:21b}]
data modify entity @n[type=villager] Offers.Recipes[4].sell set from block ~ ~ ~ Items[{Slot:22b}]
data modify entity @n[type=villager] Offers.Recipes[5].sell set from block ~ ~ ~ Items[{Slot:23b}]
data modify entity @n[type=villager] Offers.Recipes[6].sell set from block ~ ~ ~ Items[{Slot:24b}]
data modify entity @n[type=villager] Offers.Recipes[7].sell set from block ~ ~ ~ Items[{Slot:25b}]
data modify entity @n[type=villager] Offers.Recipes[8].sell set from block ~ ~ ~ Items[{Slot:26b}]


execute if data entity @n[type=villager] Offers.Recipes[8].sell{id:"minecraft:debug_stick"} run data remove entity @n[type=villager] Offers.Recipes[8]
execute if data entity @n[type=villager] Offers.Recipes[7].sell{id:"minecraft:debug_stick"} run data remove entity @n[type=villager] Offers.Recipes[7]
execute if data entity @n[type=villager] Offers.Recipes[6].sell{id:"minecraft:debug_stick"} run data remove entity @n[type=villager] Offers.Recipes[6]
execute if data entity @n[type=villager] Offers.Recipes[5].sell{id:"minecraft:debug_stick"} run data remove entity @n[type=villager] Offers.Recipes[5]
execute if data entity @n[type=villager] Offers.Recipes[4].sell{id:"minecraft:debug_stick"} run data remove entity @n[type=villager] Offers.Recipes[4]
execute if data entity @n[type=villager] Offers.Recipes[3].sell{id:"minecraft:debug_stick"} run data remove entity @n[type=villager] Offers.Recipes[3]
execute if data entity @n[type=villager] Offers.Recipes[2].sell{id:"minecraft:debug_stick"} run data remove entity @n[type=villager] Offers.Recipes[2]
execute if data entity @n[type=villager] Offers.Recipes[1].sell{id:"minecraft:debug_stick"} run data remove entity @n[type=villager] Offers.Recipes[1]
execute if data entity @n[type=villager] Offers.Recipes[0].sell{id:"minecraft:debug_stick"} run data remove entity @n[type=villager] Offers.Recipes[0]

execute if data entity @n[type=villager] Offers.Recipes[8].buyB{id:"minecraft:debug_stick"} run data remove entity @n[type=villager] Offers.Recipes[8].buyB
execute if data entity @n[type=villager] Offers.Recipes[7].buyB{id:"minecraft:debug_stick"} run data remove entity @n[type=villager] Offers.Recipes[7].buyB
execute if data entity @n[type=villager] Offers.Recipes[6].buyB{id:"minecraft:debug_stick"} run data remove entity @n[type=villager] Offers.Recipes[6].buyB
execute if data entity @n[type=villager] Offers.Recipes[5].buyB{id:"minecraft:debug_stick"} run data remove entity @n[type=villager] Offers.Recipes[5].buyB
execute if data entity @n[type=villager] Offers.Recipes[4].buyB{id:"minecraft:debug_stick"} run data remove entity @n[type=villager] Offers.Recipes[4].buyB
execute if data entity @n[type=villager] Offers.Recipes[3].buyB{id:"minecraft:debug_stick"} run data remove entity @n[type=villager] Offers.Recipes[3].buyB
execute if data entity @n[type=villager] Offers.Recipes[2].buyB{id:"minecraft:debug_stick"} run data remove entity @n[type=villager] Offers.Recipes[2].buyB
execute if data entity @n[type=villager] Offers.Recipes[1].buyB{id:"minecraft:debug_stick"} run data remove entity @n[type=villager] Offers.Recipes[1].buyB
execute if data entity @n[type=villager] Offers.Recipes[0].buyB{id:"minecraft:debug_stick"} run data remove entity @n[type=villager] Offers.Recipes[0].buyB

execute if data entity @n[type=villager] Offers.Recipes[8].buy{id:"minecraft:debug_stick"} run data remove entity @n[type=villager] Offers.Recipes[8].buy
execute if data entity @n[type=villager] Offers.Recipes[7].buy{id:"minecraft:debug_stick"} run data remove entity @n[type=villager] Offers.Recipes[7].buy
execute if data entity @n[type=villager] Offers.Recipes[6].buy{id:"minecraft:debug_stick"} run data remove entity @n[type=villager] Offers.Recipes[6].buy
execute if data entity @n[type=villager] Offers.Recipes[5].buy{id:"minecraft:debug_stick"} run data remove entity @n[type=villager] Offers.Recipes[5].buy
execute if data entity @n[type=villager] Offers.Recipes[4].buy{id:"minecraft:debug_stick"} run data remove entity @n[type=villager] Offers.Recipes[4].buy
execute if data entity @n[type=villager] Offers.Recipes[3].buy{id:"minecraft:debug_stick"} run data remove entity @n[type=villager] Offers.Recipes[3].buy
execute if data entity @n[type=villager] Offers.Recipes[2].buy{id:"minecraft:debug_stick"} run data remove entity @n[type=villager] Offers.Recipes[2].buy
execute if data entity @n[type=villager] Offers.Recipes[1].buy{id:"minecraft:debug_stick"} run data remove entity @n[type=villager] Offers.Recipes[1].buy
execute if data entity @n[type=villager] Offers.Recipes[0].buy{id:"minecraft:debug_stick"} run data remove entity @n[type=villager] Offers.Recipes[0].buy

fill ~ ~ ~ ~ ~1 ~ air