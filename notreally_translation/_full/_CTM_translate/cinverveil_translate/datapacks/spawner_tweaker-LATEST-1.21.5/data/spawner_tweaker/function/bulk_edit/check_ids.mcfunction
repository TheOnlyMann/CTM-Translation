#Compare ids
scoreboard players set check_id temp -1
execute store result score check_id temp run data get storage spawner_tweaker:temp Check_ID[0].id
execute if score id st_priming = check_id temp run data modify storage spawner_tweaker:temp Checking append from storage spawner_tweaker:temp Check_ID[0]

#Remove and repeat
data remove storage spawner_tweaker:temp Check_ID[0]
execute if data storage spawner_tweaker:temp Check_ID[0] run function spawner_tweaker:bulk_edit/check_ids