#Initiating a bulk edit or update. These process mainly use the same code except
#$st_ongoing_process temp 2 = bulk update, $st_ongoing_process temp 3 = bulk edit
#Update is only the SpawnPotenials, Bulk Edit is everything (simpler, ironically)

#Write spawndata to spawnpotentials if none exist (very rare edge case)
scoreboard players set write_potential temp 0
execute unless data block ~ ~ ~ SpawnPotentials[0] run scoreboard players set write_potential temp 1
execute if score write_potential temp matches 1.. run data modify storage spawner_tweaker:temp SpawnData set value [{data:{entity:{id:"minecraft:item"}},weight:1}]
execute if score write_potential temp matches 1.. run data modify storage spawner_tweaker:temp SpawnData[0].data set from block ~ ~ ~ SpawnData
execute if score write_potential temp matches 1.. run data modify block ~ ~ ~ SpawnPotentials set from storage spawner_tweaker:temp SpawnData

#Lock in the new spawner
data remove storage spawner_tweaker:temp update_to
data modify storage spawner_tweaker:temp update_to set from block ~ ~ ~
data remove storage spawner_tweaker:temp update_to.SpawnData

summon marker ~ ~ ~ {UUID:[I;-44439381,467092815,-2143523091,-286623066]}
data modify storage spawner_tweaker:temp Spawner set value {Pos:[0.0d,0.0d,0.0d],dimension:"minecraft:overworld"}
data modify storage spawner_tweaker:temp Spawner.Pos set from entity fd59e8ab-1bd7-454f-803c-6eedeeea7aa6 Pos
data modify storage spawner_tweaker:temp Spawner.dimension set from entity @s Dimension
kill fd59e8ab-1bd7-454f-803c-6eedeeea7aa6
function spawner_tweaker:register/get_id with storage spawner_tweaker:temp Spawner
scoreboard players operation id st_priming = id temp
execute store result storage spawner_tweaker:temp update_to.id int 1 run scoreboard players get id temp

#Update the actual id
function spawner_tweaker:bulk_edit/update_id with storage spawner_tweaker:temp update_to

#Write data to a temporary list
data remove storage spawner_tweaker:temp BSE
data remove storage spawner_tweaker:temp Check_ID
data remove storage spawner_tweaker:temp Checking
data modify storage spawner_tweaker:temp Check_ID set from storage spawner_tweaker:temp Spawners

#Check the list for proper ids
function spawner_tweaker:bulk_edit/check_ids

#Writing data directly if there is no range requirement
execute unless score $prime_range spawner_tweaker matches 1.. run data modify storage spawner_tweaker:temp BSE set from storage spawner_tweaker:temp Checking

#Fix this list by removing spawners outside of range
execute if score $prime_range spawner_tweaker matches 1.. store result score x temp run data get entity @s Pos[0]
execute if score $prime_range spawner_tweaker matches 1.. store result score y temp run data get entity @s Pos[1]
execute if score $prime_range spawner_tweaker matches 1.. store result score z temp run data get entity @s Pos[2]
execute if score $prime_range spawner_tweaker matches 1.. run function spawner_tweaker:spawner_priming/range_checker

#Get spawner counts
scoreboard players set spawners_updated st_priming 0
scoreboard players add total_spawners st_priming 0
execute store result score total_spawners st_priming if data storage spawner_tweaker:temp BSE[]

#Figuring out which spawners must be foreloaded
scoreboard players set n temp 0
data modify storage spawner_tweaker:temp BSE[0].n set value 0
data modify storage spawner_tweaker:temp BSE[0].next set value 1
data modify storage spawner_tweaker:temp BSE[0].x set from storage spawner_tweaker:temp BSE[0].Pos[0]
data modify storage spawner_tweaker:temp BSE[0].y set from storage spawner_tweaker:temp BSE[0].Pos[1]
data modify storage spawner_tweaker:temp BSE[0].z set from storage spawner_tweaker:temp BSE[0].Pos[2]
function spawner_tweaker:bulk_edit/load_checker with storage spawner_tweaker:temp BSE[0]

#Flags
scoreboard players set bse_timer st_priming 1