#Happens on containers that are found

#Basic checks to see if this container is something with stuff inside
scoreboard players set chest_pass temp 0
execute if data block ~ ~ ~ Items[{}] run scoreboard players set chest_pass temp 1
execute if data block ~ ~ ~ LootTable run scoreboard players set chest_pass temp 1

#Getting the relevant positioning information
function spawner_tweaker:chests/register/detect_location

#Final check to check for existance
execute if score chest_pass temp matches 1.. run function spawner_tweaker:chests/register/check_existing with storage spawner_tweaker:temp Pos
execute if score exist temp matches 1 run scoreboard players set chest_pass temp 0

#Return if conditions do not match
execute if score chest_pass temp matches 0 run return 1
#Record this in storage if this is a new container, due to the above condition
data modify storage spawner_tweaker:temp Chests append from storage spawner_tweaker:temp Pos
scoreboard players set y temp -90
scoreboard players set x temp 0
playsound minecraft:block.chest.open master @a ~ ~ ~ 1 0.8
playsound item.firecharge.use master @s ~ ~ ~ 0.8 0.5
execute align xyz positioned ~0.5 ~0.5 ~0.5 rotated 0 -90 run function spawner_tweaker:chests/register/register_particle_loop
