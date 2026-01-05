# 5 tick loop
scoreboard players add $5t voidr_main 1
execute if score $5t voidr_main matches 5.. run scoreboard players set $5t voidr_main 0

# 5 tick function on player position
execute if score $5t voidr_main matches 0 run execute as @a[gamemode=!creative,gamemode=!spectator] at @s align xyz run function voidr:as_player