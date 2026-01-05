



execute if score .total_spawners shanger.data matches 15 run execute as @a at @s run playsound minecraft:entity.player.levelup master @s ~ ~ ~ 0.5 0.5
execute if score .total_spawners shanger.data matches 30 run execute as @a at @s run playsound minecraft:entity.player.levelup master @s ~ ~ ~ 0.5 0.5
execute if score .total_spawners shanger.data matches 50 run execute as @a at @s run playsound minecraft:entity.player.levelup master @s ~ ~ ~ 0.5 0.5
execute if score .total_spawners shanger.data matches 75 run execute as @a at @s run playsound minecraft:entity.player.levelup master @s ~ ~ ~ 0.5 0.5
execute if score .total_spawners shanger.data matches 100 run execute as @a at @s run playsound minecraft:entity.player.levelup master @s ~ ~ ~ 0.5 0.5
execute if score .total_spawners shanger.data matches 125 run execute as @a at @s run playsound minecraft:entity.player.levelup master @s ~ ~ ~ 0.5 0.5
execute if score .total_spawners shanger.data matches 150 run execute as @a at @s run playsound minecraft:entity.player.levelup master @s ~ ~ ~ 0.5 0.5
execute if score .total_spawners shanger.data matches 175 run execute as @a at @s run playsound minecraft:entity.player.levelup master @s ~ ~ ~ 0.5 0.5
execute if score .total_spawners shanger.data matches 200 run execute as @a at @s run playsound minecraft:entity.player.levelup master @s ~ ~ ~ 0.5 0.5
execute if score .total_spawners shanger.data matches 225 run execute as @a at @s run playsound minecraft:entity.player.levelup master @s ~ ~ ~ 0.5 0.5
execute if score .total_spawners shanger.data matches 250 run execute as @a at @s run playsound minecraft:entity.player.levelup master @s ~ ~ ~ 0.5 0.5
execute if score .total_spawners shanger.data matches 275 run execute as @a at @s run playsound minecraft:entity.player.levelup master @s ~ ~ ~ 0.5 0.5
execute if score .total_spawners shanger.data matches 300 run execute as @a at @s run playsound minecraft:entity.player.levelup master @s ~ ~ ~ 0.5 0.5
execute if score .total_spawners shanger.data matches 350 run execute as @a at @s run playsound minecraft:entity.player.levelup master @s ~ ~ ~ 0.5 0.5
execute if score .total_spawners shanger.data matches 400 run execute as @a at @s run playsound minecraft:entity.player.levelup master @s ~ ~ ~ 0.5 0.5
execute if score .total_spawners shanger.data matches 450 run execute as @a at @s run playsound minecraft:entity.player.levelup master @s ~ ~ ~ 0.5 0.5
execute if score .total_spawners shanger.data matches 500 run execute as @a at @s run playsound minecraft:entity.player.levelup master @s ~ ~ ~ 0.5 0.5
execute if score .total_spawners shanger.data matches 550 run execute as @a at @s run playsound minecraft:entity.player.levelup master @s ~ ~ ~ 0.5 0.5
execute if score .total_spawners shanger.data matches 600 run execute as @a at @s run playsound minecraft:entity.player.levelup master @s ~ ~ ~ 0.5 0.5
execute if score .total_spawners shanger.data matches 650 run execute as @a at @s run playsound minecraft:entity.player.levelup master @s ~ ~ ~ 0.5 0.5


execute if score .total_spawners shanger.data matches 15 run give @a iron_nugget 3
execute if score .total_spawners shanger.data matches 30 run give @a copper_ingot 8
execute if score .total_spawners shanger.data matches 50 run give @a shulker_box
execute if score .total_spawners shanger.data matches 75 run give @a cooked_chicken 16
execute if score .total_spawners shanger.data matches 100 as @a at @s run loot spawn ~ ~ ~ loot shanger:chest/general/t2_good
execute if score .total_spawners shanger.data matches 125 run give @a rabbit_hide 2
execute if score .total_spawners shanger.data matches 150 run give @a iron_nugget 8
execute if score .total_spawners shanger.data matches 175 run give @a cooked_beef 16
execute if score .total_spawners shanger.data matches 200 as @a at @s run loot spawn ~ ~ ~ loot shanger:chest/general/t3_good
execute if score .total_spawners shanger.data matches 225 run give @a diamond
execute if score .total_spawners shanger.data matches 250 run give @a iron_ingot 5
execute if score .total_spawners shanger.data matches 275 run give @a totem_of_undying
execute if score .total_spawners shanger.data matches 300 as @a at @s run loot spawn ~ ~ ~ loot shanger:chest/general/t4_good
execute if score .total_spawners shanger.data matches 350 run give @a diamond 2
execute if score .total_spawners shanger.data matches 400 run give @a diamond 2
execute if score .total_spawners shanger.data matches 450 run give @a diamond 2
execute if score .total_spawners shanger.data matches 500 run give @a diamond 2
execute if score .total_spawners shanger.data matches 550 run give @a diamond 2
execute if score .total_spawners shanger.data matches 600 run give @a diamond 2
execute if score .total_spawners shanger.data matches 650 run give @a diamond 2

execute if score .total_spawners shanger.data matches 15 run tellraw @a [{"sprite":"item/iron_pickaxe"}," ",{"sprite":"block/spawner"}," Milestone Reached (",{"bold":true,"color":"yellow","text":"15"},{"bold":false,"color":"white","text":"): 3x Iron Nugget "},{"sprite":"item/iron_nugget"}]
execute if score .total_spawners shanger.data matches 30 run tellraw @a [{"sprite":"item/iron_pickaxe"}," ",{"sprite":"block/spawner"}," Milestone Reached (",{"bold":true,"color":"yellow","text":"30"},{"bold":false,"color":"white","text":"): 8x Copper Ingot "},{"sprite":"item/copper_ingot"}]
execute if score .total_spawners shanger.data matches 50 run tellraw @a [{"sprite":"item/iron_pickaxe"}," ",{"sprite":"block/spawner"}," Milestone Reached (",{"bold":true,"color":"yellow","text":"50"},{"bold":false,"color":"white","text":"): 1x Shulker Box "},{"sprite":"block/shulker_box"}]
execute if score .total_spawners shanger.data matches 75 run tellraw @a [{"sprite":"item/iron_pickaxe"}," ",{"sprite":"block/spawner"}," Milestone Reached (",{"bold":true,"color":"yellow","text":"75"},{"bold":false,"color":"white","text":"): 16x Cooked Chicken "},{"sprite":"item/cooked_chicken"}]
execute if score .total_spawners shanger.data matches 100 run tellraw @a [{"sprite":"item/iron_pickaxe"}," ",{"sprite":"block/spawner"}," Milestone Reached (",{"bold":true,"color":"yellow","text":"100"},{"bold":false,"color":"white","text":"): Tier 2 Great Loot "},{"sprite":"item/yellow_bundle"}]
execute if score .total_spawners shanger.data matches 125 run tellraw @a [{"sprite":"item/iron_pickaxe"}," ",{"sprite":"block/spawner"}," Milestone Reached (",{"bold":true,"color":"yellow","text":"125"},{"bold":false,"color":"white","text":"): 2x Diamond Nugget "},{"sprite":"item/rabbit_hide"}]
execute if score .total_spawners shanger.data matches 150 run tellraw @a [{"sprite":"item/iron_pickaxe"}," ",{"sprite":"block/spawner"}," Milestone Reached (",{"bold":true,"color":"yellow","text":"150"},{"bold":false,"color":"white","text":"): 8x Iron Nugget "},{"sprite":"item/iron_nugget"}]
execute if score .total_spawners shanger.data matches 175 run tellraw @a [{"sprite":"item/iron_pickaxe"}," ",{"sprite":"block/spawner"}," Milestone Reached (",{"bold":true,"color":"yellow","text":"175"},{"bold":false,"color":"white","text":"): 16x Steak "},{"sprite":"item/cooked_beef"}]
execute if score .total_spawners shanger.data matches 200 run tellraw @a [{"sprite":"item/iron_pickaxe"}," ",{"sprite":"block/spawner"}," Milestone Reached (",{"bold":true,"color":"yellow","text":"200"},{"bold":false,"color":"white","text":"): Tier 3 Great Loot "},{"sprite":"item/light_blue_bundle"}]
execute if score .total_spawners shanger.data matches 225 run tellraw @a [{"sprite":"item/iron_pickaxe"}," ",{"sprite":"block/spawner"}," Milestone Reached (",{"bold":true,"color":"yellow","text":"225"},{"bold":false,"color":"white","text":"): 1x Diamond "},{"sprite":"item/diamond"}]
execute if score .total_spawners shanger.data matches 250 run tellraw @a [{"sprite":"item/iron_pickaxe"}," ",{"sprite":"block/spawner"}," Milestone Reached (",{"bold":true,"color":"yellow","text":"250"},{"bold":false,"color":"white","text":"): 5x Iron Ingot "},{"sprite":"item/iron_ingot"}]
execute if score .total_spawners shanger.data matches 275 run tellraw @a [{"sprite":"item/iron_pickaxe"}," ",{"sprite":"block/spawner"}," Milestone Reached (",{"bold":true,"color":"yellow","text":"275"},{"bold":false,"color":"white","text":"): 1x Totem of Undying "},{"sprite":"item/totem_of_undying"}]
execute if score .total_spawners shanger.data matches 300 run tellraw @a [{"sprite":"item/iron_pickaxe"}," ",{"sprite":"block/spawner"}," Milestone Reached (",{"bold":true,"color":"yellow","text":"300"},{"bold":false,"color":"white","text":"): Tier 4 Great Loot "},{"sprite":"item/magenta_bundle"}]
execute if score .total_spawners shanger.data matches 350 run tellraw @a [{"sprite":"item/iron_pickaxe"}," ",{"sprite":"block/spawner"}," Milestone Reached (",{"bold":true,"color":"yellow","text":"350"},{"bold":false,"color":"white","text":"): 2x Diamond "},{"sprite":"item/diamond"}]
execute if score .total_spawners shanger.data matches 400 run tellraw @a [{"sprite":"item/iron_pickaxe"}," ",{"sprite":"block/spawner"}," Milestone Reached (",{"bold":true,"color":"yellow","text":"400"},{"bold":false,"color":"white","text":"): 2x Diamond "},{"sprite":"item/diamond"}]
execute if score .total_spawners shanger.data matches 450 run tellraw @a [{"sprite":"item/iron_pickaxe"}," ",{"sprite":"block/spawner"}," Milestone Reached (",{"bold":true,"color":"yellow","text":"450"},{"bold":false,"color":"white","text":"): 2x Diamond "},{"sprite":"item/diamond"}]
execute if score .total_spawners shanger.data matches 500 run tellraw @a [{"sprite":"item/iron_pickaxe"}," ",{"sprite":"block/spawner"}," Milestone Reached (",{"bold":true,"color":"yellow","text":"500"},{"bold":false,"color":"white","text":"): 2x Diamond "},{"sprite":"item/diamond"}]
execute if score .total_spawners shanger.data matches 550 run tellraw @a [{"sprite":"item/iron_pickaxe"}," ",{"sprite":"block/spawner"}," Milestone Reached (",{"bold":true,"color":"yellow","text":"550"},{"bold":false,"color":"white","text":"): 2x Diamond "},{"sprite":"item/diamond"}]
execute if score .total_spawners shanger.data matches 600 run tellraw @a [{"sprite":"item/iron_pickaxe"}," ",{"sprite":"block/spawner"}," Milestone Reached (",{"bold":true,"color":"yellow","text":"600"},{"bold":false,"color":"white","text":"): 2x Diamond "},{"sprite":"item/diamond"}]
execute if score .total_spawners shanger.data matches 650 run tellraw @a [{"sprite":"item/iron_pickaxe"}," ",{"sprite":"block/spawner"}," Milestone Reached (",{"bold":true,"color":"yellow","text":"650"},{"bold":false,"color":"white","text":"): 2x Diamond "},{"sprite":"item/diamond"}]






