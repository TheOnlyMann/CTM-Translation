#Loop for giving all spawners

#Move player where they ought to be
$execute positioned ~ ~$(y) ~ positioned ~ ~1 ~ run tp @s ~ ~ ~

#Set up storage
data modify storage spawner_tweaker:temp give set value {id:-1}
execute store result storage spawner_tweaker:temp give.id int 1 run scoreboard players get give_all_id temp

#Create an item with the id above
function spawner_tweaker:give_spawners/read_id with storage spawner_tweaker:temp give

#Create a barrel if there is none
$execute positioned ~ ~$(y) ~ unless block ~ ~ ~ barrel run setblock ~ ~ ~ barrel[facing=up]{CustomName:'"Spawner Tweaker Spawners"'} replace

#Insert the item and kill it
data modify storage spawner_tweaker:temp give_all.item set value {Slot:0b}
data modify storage spawner_tweaker:temp give_all.item set from entity @e[distance=..1,type=item,limit=1,sort=nearest,tag=st_item] Item
execute store result storage spawner_tweaker:temp give_all.item.Slot byte 1 run scoreboard players get slot_in_barrel temp
execute if data storage spawner_tweaker:temp give.spawner run function spawner_tweaker:give_spawners/insert_items with storage spawner_tweaker:temp give_all
kill @e[distance=..1,type=item,limit=1,sort=nearest,tag=st_item]

#Incriment and loop
scoreboard players add give_all_id temp 1
execute if data storage spawner_tweaker:temp give.spawner run scoreboard players add spawners_generated temp 1
execute if data storage spawner_tweaker:temp give.spawner run scoreboard players add slot_in_barrel temp 1
execute if score slot_in_barrel temp matches 27.. run scoreboard players add give_all_y temp 1
execute if score slot_in_barrel temp matches 27.. run scoreboard players set slot_in_barrel temp 0

execute store result storage spawner_tweaker:temp give_all.id int 1 run scoreboard players get give_all_id temp
execute store result storage spawner_tweaker:temp give_all.y int 1 run scoreboard players get give_all_y temp
execute if score spawners_generated temp < total_spawners temp unless score give_all_id temp matches 500.. run function spawner_tweaker:give_spawners/give_all_loop with storage spawner_tweaker:temp give_all