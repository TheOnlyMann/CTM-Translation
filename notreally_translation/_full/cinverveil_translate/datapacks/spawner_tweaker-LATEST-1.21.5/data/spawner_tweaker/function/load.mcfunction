#Runs when the datapack loads, sets up any necessary scoreboards and teams

#Debug message

#Fix visuals of volume
execute unless score $st_ongoing_process temp matches 4 run kill 18c359ed-00ca-4242-9e49-91cd8846f33a
execute unless score $st_ongoing_process temp matches 4 run scoreboard players set $pos1_set st_volume 0
execute unless score $st_ongoing_process temp matches 4 run scoreboard players set $pos2_set st_volume 0

#Scoreboards
scoreboard objectives add temp dummy
scoreboard objectives add spawner_tweaker dummy
scoreboard objectives add spawner_tweaker_slot dummy
scoreboard objectives add spawner_tweaker_slot_prev dummy
scoreboard objectives add spawner_tweaker_id dummy
scoreboard objectives add spawner_tweaker_setting dummy
scoreboard objectives add prime_spawners trigger
scoreboard objectives add toggle_spawner_tweaker trigger
scoreboard objectives add toggle_piercing_spawner_tweaker trigger
scoreboard objectives add search_volume trigger
scoreboard objectives add highlight_spawners trigger
scoreboard objectives add give_all_spawners trigger
scoreboard objectives add give_spawner trigger
scoreboard objectives add delete_spawner_id trigger
scoreboard objectives add delete_nearby_chests trigger
scoreboard objectives add spawner_tweaker_delay dummy
scoreboard objectives add numbers dummy
scoreboard objectives add spawner_tweaker_offset dummy
scoreboard objectives add st_priming dummy
scoreboard objectives add st_search dummy
scoreboard objectives add st_swap dummy
scoreboard objectives add st_drop_spawner minecraft.dropped:minecraft.spawner
scoreboard objectives add st_volume dummy

#Scores
scoreboard players set $highlight_id spawner_tweaker -1
execute unless score setup spawner_tweaker matches 6.. unless score $reselect_ticks spawner_tweaker matches ..19 run scoreboard players set $reselect_ticks spawner_tweaker 5
execute unless score setup spawner_tweaker matches 4.. run scoreboard players set $data_population spawner_tweaker 1
execute unless score setup spawner_tweaker matches 4.. run scoreboard players set $search_range spawner_tweaker 6
execute unless score setup spawner_tweaker matches 4.. run scoreboard players set $modification_limit spawner_tweaker 20
execute unless score setup spawner_tweaker matches 1.. run scoreboard players set $efficient_data spawner_tweaker 1
execute unless score setup spawner_tweaker matches 4.. run scoreboard players set $prime_range spawner_tweaker -1
execute unless score setup spawner_tweaker matches 7.. run scoreboard players set $randomizer_seed spawner_tweaker 0
scoreboard players set setup spawner_tweaker 7

scoreboard players set -1 numbers -1
scoreboard players set 2 numbers 2
scoreboard players set 5 numbers 5
scoreboard players set 10 numbers 10
scoreboard players set 20 numbers 20
scoreboard players set 100 numbers 100
scoreboard players set 1000 numbers 1000

#Teams
team add spawner_tweaker_gray {"text":"Gray","color":"gray","bold":false,"italic":false,"underlined":false}
team add spawner_tweaker_dark_gray {"text":"Dark Gray","color":"dark_gray","bold":false,"italic":false,"underlined":false}
team add spawner_tweaker_green {"text":"Green","color":"green","bold":false,"italic":false,"underlined":false}
team add spawner_tweaker_red {"text":"Red","color":"red","bold":false,"italic":false,"underlined":false}
team add spawner_tweaker_yellow {"text":"Yellow","color":"red","bold":false,"italic":false,"underlined":false}
team modify spawner_tweaker_green color green
team modify spawner_tweaker_red color red
team modify spawner_tweaker_yellow color yellow
team modify spawner_tweaker_gray color gray
team modify spawner_tweaker_dark_gray color dark_gray

#Gamerules
gamerule maxCommandForkCount 2147483647
gamerule maxCommandChainLength 2147483647