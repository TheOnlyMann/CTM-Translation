#Initiates the priming process

#Error if this is already ongoing
execute if score $st_ongoing_process temp matches 1.. run tellraw @s {"color":"red","italic":false,"text":"Please wait until the current process is finished"}
execute if score $st_ongoing_process temp matches 1.. run playsound minecraft:block.note_block.didgeridoo master @s ~ ~ ~ 1 1
execute if score $st_ongoing_process temp matches 1.. run scoreboard players set @s prime_spawners -999
execute if score $st_ongoing_process temp matches 1.. run return 1

#Lock in the delay
scoreboard players add delay st_priming 0
scoreboard players operation delay st_priming = @s prime_spawners
execute if score delay st_priming matches ..0 run scoreboard players set delay st_priming 0

#Write data to a temporary list
data remove storage spawner_tweaker:temp Priming
data remove storage spawner_tweaker:temp Checking
data modify storage spawner_tweaker:temp Checking set from storage spawner_tweaker:temp Spawners
execute unless score $prime_range spawner_tweaker matches 1.. run data modify storage spawner_tweaker:temp Priming set from storage spawner_tweaker:temp Checking

#Fix this list by removing spawners outside of range
execute if score $prime_range spawner_tweaker matches 1.. store result score x temp run data get entity @p[scores={prime_spawners=-998..}] Pos[0]
execute if score $prime_range spawner_tweaker matches 1.. store result score y temp run data get entity @p[scores={prime_spawners=-998..}] Pos[1]
execute if score $prime_range spawner_tweaker matches 1.. store result score z temp run data get entity @p[scores={prime_spawners=-998..}] Pos[2]
execute if score $prime_range spawner_tweaker matches 1.. run function spawner_tweaker:spawner_priming/range_checker

#Get spawner counts
scoreboard players set spawners_primed st_priming 0
scoreboard players add total_spawners st_priming 0
execute store result score total_spawners st_priming if data storage spawner_tweaker:temp Priming[]

#Figuring out which spawners must be foreloaded
scoreboard players set n temp 0
data modify storage spawner_tweaker:temp Priming[0].n set value 0
data modify storage spawner_tweaker:temp Priming[0].next set value 1
data modify storage spawner_tweaker:temp Priming[0].x set from storage spawner_tweaker:temp Priming[0].Pos[0]
data modify storage spawner_tweaker:temp Priming[0].y set from storage spawner_tweaker:temp Priming[0].Pos[1]
data modify storage spawner_tweaker:temp Priming[0].z set from storage spawner_tweaker:temp Priming[0].Pos[2]
function spawner_tweaker:spawner_priming/load_checker with storage spawner_tweaker:temp Priming[0]

#Flags
scoreboard players set @s prime_spawners -999
scoreboard players set timer st_priming 1
scoreboard players set $st_ongoing_process temp 1