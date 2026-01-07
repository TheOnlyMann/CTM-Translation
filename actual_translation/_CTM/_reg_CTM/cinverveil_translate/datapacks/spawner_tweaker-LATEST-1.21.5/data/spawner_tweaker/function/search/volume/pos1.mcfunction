#Happens when this option is selected from the settings menu

#failsafe
execute if score $st_ongoing_process temp matches 1.. run tellraw @s {"color":"red","italic":false,"text":"You can't do this during an ongoing process"}
execute if score $st_ongoing_process temp matches 1.. run playsound minecraft:block.note_block.didgeridoo master @s ~ ~ ~ 1 1
execute if score $st_ongoing_process temp matches 1.. run return 1

#Store position
execute align xyz run summon marker ~ ~ ~ {UUID:[I;-44439381,467092815,-2143523091,-286623066]}
execute store result score x st_volume run data get entity fd59e8ab-1bd7-454f-803c-6eedeeea7aa6 Pos[0]
execute store result score y st_volume run data get entity fd59e8ab-1bd7-454f-803c-6eedeeea7aa6 Pos[1]
execute store result score z st_volume run data get entity fd59e8ab-1bd7-454f-803c-6eedeeea7aa6 Pos[2]
kill fd59e8ab-1bd7-454f-803c-6eedeeea7aa6

#Determine volume metrics
function spawner_tweaker:search/volume/determine_volume

#Tell ouput
execute unless score $pos2_set st_volume matches 1.. run tellraw @s {"color":"yellow","text":"Position 1 set"}
execute if score $pos2_set st_volume matches 1.. run function spawner_tweaker:search/volume/pos1_tell with storage spawner_tweaker:temp variables

#Flags
scoreboard players set $pos1_set st_volume 1

#Visualize this instantly
tag @s add st_show_box
function spawner_tweaker:search/volume/visualize
tag @s remove st_show_box