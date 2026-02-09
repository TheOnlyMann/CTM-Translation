#Clears the old spawners and gives the new ones
$tag @a[nbt={Inventory:[{components:{"minecraft:custom_data":{spawner_tweaker_id:$(id)}}}]}] add st_give_back
$clear @a[tag=st_give_back] spawner[custom_data={spawner_tweaker_id:$(id),spawner_tweaker_spawner:1b}]
$scoreboard players set @a[tag=st_give_back] give_spawner $(id)
execute as @a[tag=st_give_back] at @s run function spawner_tweaker:give_spawners/trigger_give
tag @a[tag=st_give_back] remove st_give_back