#Sees if the container here can be used in randomizer. If not, yeet it.

#Basic checks to see if this container is something with stuff inside
scoreboard players set chest_pass temp 0
execute if data block ~ ~ ~ Items[{}] run scoreboard players set chest_pass temp 1
execute if data block ~ ~ ~ LootTable run scoreboard players set chest_pass temp 1

#Failure will result in TERMINATION
#Else, just set flags and move along
$execute if score chest_pass temp matches 0 run data remove storage spawner_tweaker:temp Chests[{x:$(x),y:$(y),z:$(z),dimension:"$(dimension)"}]
execute if score chest_pass temp matches 0 if score force_load temp matches 0 align xyz run summon item_display ~0.499 ~0.499 ~0.499 {Tags:["st_primer"],Glowing:1b,width:100f,height:100f,interpolation_duration:2,teleport_duration:2,brightness:{sky:15,block:15},transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[1.02f,1.02f,1.02f]},item:{id:"minecraft:tinted_glass",count:1b}}
execute if score chest_pass temp matches 0 align xyz positioned ~0.5 ~0.5 ~0.5 run team join spawner_tweaker_red @e[distance=..1,limit=1,sort=nearest,tag=st_primer,type=item_display]

$execute if score chest_pass temp matches 1 run data modify storage spawner_tweaker:temp container_checker[$(n)].contents set from block ~ ~ ~
$execute if score chest_pass temp matches 1 run data modify storage spawner_tweaker:temp container_randomizer append from storage spawner_tweaker:temp container_checker[$(n)]
execute if score chest_pass temp matches 1 run particle minecraft:happy_villager ~ ~ ~ 0.5 0.5 0.5 0 10

scoreboard players add chests_checked st_priming 1
$data modify storage spawner_tweaker:temp container_checker[$(n)].remove set value 1b
