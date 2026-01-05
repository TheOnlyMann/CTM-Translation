



execute as @a at @s as @e[distance=..6,type=item,tag=!item_checked] at @s run function uss:initialize_dropped_item with storage uss:storage
execute as @a if items entity @s player.cursor * run function uss:update_inv