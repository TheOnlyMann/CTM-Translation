scoreboard players add $2t trove_loop 1
execute if score $2t trove_loop matches 2.. run scoreboard players set $2t trove_loop 0




execute as @a at @s run function trove:1t_player




scoreboard players set $mpp trove_main 1
execute if score $mpp trove_main matches 1.. as @e[type=#trove:hostile,tag=!trove_mpp] at @s run function trove:mpp/main


scoreboard players set $enable suso.nats 1
scoreboard players set $cap suso.nats 30