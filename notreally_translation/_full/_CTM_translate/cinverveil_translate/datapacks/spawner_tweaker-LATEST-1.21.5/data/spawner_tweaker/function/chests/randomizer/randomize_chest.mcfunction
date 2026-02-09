#Rewrites the container's contents to the randomly assigned properties

#Kill contents of the container
data remove block ~ ~ ~ Items
data remove block ~ ~ ~ LootTable

execute if data block ~ ~ ~ LootTable run function spawner_tweaker:chests/randomizer/i_hate_mojang1

#Generate new contents
$data modify block ~ ~ ~ Items set from storage spawner_tweaker:temp container_randomizer[$(n)].contents_source.Items
$data modify block ~ ~ ~ LootTable set from storage spawner_tweaker:temp container_randomizer[$(n)].contents_source.LootTable

#Bells and wistles
execute if score force_load temp matches 0 align xyz run summon item_display ~0.499 ~0.499 ~0.499 {Tags:["st_primer"],Glowing:1b,width:100f,height:100f,interpolation_duration:2,teleport_duration:2,brightness:{sky:15,block:15},transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[1.02f,1.02f,1.02f]},item:{id:"minecraft:tinted_glass",count:1b}}
execute align xyz positioned ~0.5 ~0.5 ~0.5 run team join spawner_tweaker_green @e[distance=..1,limit=1,sort=nearest,tag=st_primer,type=item_display]

#Flags
scoreboard players add chests_randomized st_priming 1
$data modify storage spawner_tweaker:temp container_randomizer[$(n)].remove set value 1b

#Debug
#$data modify storage spawner_tweaker:temp debug append from storage spawner_tweaker:temp container_randomizer[$(n)]