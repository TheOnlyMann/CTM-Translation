advancement revoke @s only shanger:cp_punch


playsound minecraft:block.end_portal_frame.fill master @s ~ ~ ~ 1 2







#### Text in Chat (View Checkpoints / View Map Progress / View Stats)
tellraw @s [{"color":"gold","text":"----------------------\n"}]

tellraw @p {"bold":true,"clickEvent":{"action":"run_command","value":"/trigger shanger.trigger set 1"},"color":"#FFEB9C","hoverEvent":{"action":"show_text","value":[{"text":"Click to view checkpoints"}]},"text":"[View Checkpoints]"}

tellraw @p {"bold":true,"clickEvent":{"action":"run_command","value":"/trigger shanger.trigger set 2"},"color":"#FFB3E6","hoverEvent":{"action":"show_text","value":[{"text":"Click to view map progress"}]},"text":"\n[View Map Progress]"}

tellraw @p {"bold":true,"clickEvent":{"action":"run_command","value":"/trigger shanger.trigger set 3"},"color":"#99EBFF","hoverEvent":{"action":"show_text","value":[{"text":"Click to view cool stats"}]},"text":"\n[View Stats]"}




tellraw @s [{"color":"gold","text":"\n----------------------"}]

### SET SPAWNPOINT

execute if data entity @n[type=interaction] {Tags:["checkpoint1"]} run spawnpoint @s -1 43 25
execute if data entity @n[type=interaction] {Tags:["checkpoint2"]} run spawnpoint @s -91 71 61
execute if data entity @n[type=interaction] {Tags:["checkpoint3"]} run spawnpoint @s -285 94 78
execute if data entity @n[type=interaction] {Tags:["checkpoint4"]} run spawnpoint @s -557 107 22
execute if data entity @n[type=interaction] {Tags:["checkpoint5"]} run spawnpoint @s -755 109 4
execute if data entity @n[type=interaction] {Tags:["checkpoint6"]} run spawnpoint @s -1057 175 12


#### UNLOCK IF NOT GOTTEN ALREADY (sound , tellraw , set score)

execute if data entity @n[type=interaction] {Tags:["checkpoint1"]} unless score .checkpoint1 shanger.data matches 1 as @a at @s run playsound minecraft:entity.player.levelup master @s ~ ~ ~ 0.5 
execute if data entity @n[type=interaction] {Tags:["checkpoint2"]} unless score .checkpoint2 shanger.data matches 1 as @a at @s run playsound minecraft:entity.player.levelup master @s ~ ~ ~ 0.5 
execute if data entity @n[type=interaction] {Tags:["checkpoint3"]} unless score .checkpoint3 shanger.data matches 1 as @a at @s run playsound minecraft:entity.player.levelup master @s ~ ~ ~ 0.5 
execute if data entity @n[type=interaction] {Tags:["checkpoint4"]} unless score .checkpoint4 shanger.data matches 1 as @a at @s run playsound minecraft:entity.player.levelup master @s ~ ~ ~ 0.5 
execute if data entity @n[type=interaction] {Tags:["checkpoint5"]} unless score .checkpoint5 shanger.data matches 1 as @a at @s run playsound minecraft:entity.player.levelup master @s ~ ~ ~ 0.5 
execute if data entity @n[type=interaction] {Tags:["checkpoint6"]} unless score .checkpoint6 shanger.data matches 1 as @a at @s run playsound minecraft:entity.player.levelup master @s ~ ~ ~ 0.5 

execute if data entity @n[type=interaction] {Tags:["checkpoint1"]} unless score .checkpoint1 shanger.data matches 1 run tellraw @a [{"text":"\nCheckpoint 1 has been unlocked!","color":"yellow"}]
execute if data entity @n[type=interaction] {Tags:["checkpoint2"]} unless score .checkpoint2 shanger.data matches 1 run tellraw @a [{"text":"\nCheckpoint 2 has been unlocked!","color":"yellow"}]
execute if data entity @n[type=interaction] {Tags:["checkpoint3"]} unless score .checkpoint3 shanger.data matches 1 run tellraw @a [{"text":"\nCheckpoint 3 has been unlocked!","color":"yellow"}]
execute if data entity @n[type=interaction] {Tags:["checkpoint4"]} unless score .checkpoint4 shanger.data matches 1 run tellraw @a [{"text":"\nCheckpoint 4 has been unlocked!","color":"yellow"}]
execute if data entity @n[type=interaction] {Tags:["checkpoint5"]} unless score .checkpoint5 shanger.data matches 1 run tellraw @a [{"text":"\nCheckpoint 5 has been unlocked!","color":"yellow"}]
execute if data entity @n[type=interaction] {Tags:["checkpoint6"]} unless score .checkpoint6 shanger.data matches 1 run tellraw @a [{"text":"\nCheckpoint 6 has been unlocked!","color":"yellow"}]

execute if data entity @n[type=interaction] {Tags:["checkpoint1"]} unless score .checkpoint1 shanger.data matches 1 run scoreboard players set .checkpoint1 shanger.data 1
execute if data entity @n[type=interaction] {Tags:["checkpoint2"]} unless score .checkpoint2 shanger.data matches 1 run scoreboard players set .checkpoint2 shanger.data 1
execute if data entity @n[type=interaction] {Tags:["checkpoint3"]} unless score .checkpoint3 shanger.data matches 1 run scoreboard players set .checkpoint3 shanger.data 1
execute if data entity @n[type=interaction] {Tags:["checkpoint4"]} unless score .checkpoint4 shanger.data matches 1 run scoreboard players set .checkpoint4 shanger.data 1
execute if data entity @n[type=interaction] {Tags:["checkpoint5"]} unless score .checkpoint5 shanger.data matches 1 run scoreboard players set .checkpoint5 shanger.data 1
execute if data entity @n[type=interaction] {Tags:["checkpoint6"]} unless score .checkpoint6 shanger.data matches 1 run scoreboard players set .checkpoint6 shanger.data 1
