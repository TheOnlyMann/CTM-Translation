#Happens when you run the trigger to give yourself a spawner


#flags
scoreboard players set @s give_all_spawners 0
tag @s add st_give_all

#Set up storage
scoreboard players set give_all_id temp 0
scoreboard players set give_all_y temp 0
scoreboard players set spawners_generated temp 0
scoreboard players set slot_in_barrel temp 0
execute store result score total_spawners temp if data storage spawner_tweaker:temp Ids[]
execute store result storage spawner_tweaker:temp give_all.id int 1 run scoreboard players get give_all_id temp
execute store result storage spawner_tweaker:temp give_all.y int 1 run scoreboard players get give_all_y temp

#Enter loop to give everything
function spawner_tweaker:give_spawners/give_all_loop with storage spawner_tweaker:temp give_all

#Bells and wistles
scoreboard players add give_all_y temp 1
playsound entity.puffer_fish.blow_up master @s ~ ~ ~ 1 0.8
tellraw @s [{"color":"green","text":"Generated "},{"color":"yellow","score":{"name":"spawners_generated","objective":"temp"}}," spawners and placed them inside ",{"color":"yellow","score":{"name":"give_all_y","objective":"temp"}}," barrels."]

#Flags
tag @s remove st_give_all
