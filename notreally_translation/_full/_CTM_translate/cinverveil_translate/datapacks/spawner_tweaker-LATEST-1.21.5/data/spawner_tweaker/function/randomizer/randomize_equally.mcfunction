#Initiates the ranomization process
#Each id has an equal chance of appearing

#Error if this is already ongoing
execute if score $st_ongoing_process temp matches 1.. run tellraw @s {"color":"red","italic":false,"text":"Please wait until the current process is finished"}
execute if score $st_ongoing_process temp matches 1.. run playsound minecraft:block.note_block.didgeridoo master @s ~ ~ ~ 1 1
execute if score $st_ongoing_process temp matches 1.. run return 1

#Flags
scoreboard players set random_timer st_priming 1
scoreboard players set $st_ongoing_process temp 6

#Generate seed if none exists
execute if score $randomizer_seed spawner_tweaker matches 0 store result score $randomizer_seed spawner_tweaker run random value 1..1000000
tellraw @a [{"color":"green","text":"Your randomizer seed is "},{"color":"yellow","score":{"name":"$randomizer_seed","objective":"spawner_tweaker"}}]
execute store result storage spawner_tweaker:temp variables.seed int 1 run scoreboard players get $randomizer_seed spawner_tweaker

#Continue to main bulk of code
function spawner_tweaker:randomizer/initiate with storage spawner_tweaker:temp variables

