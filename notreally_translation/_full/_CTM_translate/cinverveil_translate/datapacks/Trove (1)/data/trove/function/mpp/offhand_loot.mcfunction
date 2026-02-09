data merge entity @s {drop_chances:{offhand:2.000}}

execute store result score $rand_item trove_mpp run random value 0..26
execute if score $rand_item trove_mpp matches 0 run item replace entity @s weapon.offhand from block ~ ~ ~ container.0
execute if score $rand_item trove_mpp matches 1 run item replace entity @s weapon.offhand from block ~ ~ ~ container.1
execute if score $rand_item trove_mpp matches 2 run item replace entity @s weapon.offhand from block ~ ~ ~ container.2
execute if score $rand_item trove_mpp matches 3 run item replace entity @s weapon.offhand from block ~ ~ ~ container.3
execute if score $rand_item trove_mpp matches 4 run item replace entity @s weapon.offhand from block ~ ~ ~ container.4
execute if score $rand_item trove_mpp matches 5 run item replace entity @s weapon.offhand from block ~ ~ ~ container.5
execute if score $rand_item trove_mpp matches 6 run item replace entity @s weapon.offhand from block ~ ~ ~ container.6
execute if score $rand_item trove_mpp matches 7 run item replace entity @s weapon.offhand from block ~ ~ ~ container.7
execute if score $rand_item trove_mpp matches 8 run item replace entity @s weapon.offhand from block ~ ~ ~ container.8
execute if score $rand_item trove_mpp matches 9 run item replace entity @s weapon.offhand from block ~ ~ ~ container.9
execute if score $rand_item trove_mpp matches 10 run item replace entity @s weapon.offhand from block ~ ~ ~ container.10
execute if score $rand_item trove_mpp matches 11 run item replace entity @s weapon.offhand from block ~ ~ ~ container.11
execute if score $rand_item trove_mpp matches 12 run item replace entity @s weapon.offhand from block ~ ~ ~ container.12
execute if score $rand_item trove_mpp matches 13 run item replace entity @s weapon.offhand from block ~ ~ ~ container.13
execute if score $rand_item trove_mpp matches 14 run item replace entity @s weapon.offhand from block ~ ~ ~ container.14
execute if score $rand_item trove_mpp matches 15 run item replace entity @s weapon.offhand from block ~ ~ ~ container.15
execute if score $rand_item trove_mpp matches 16 run item replace entity @s weapon.offhand from block ~ ~ ~ container.16
execute if score $rand_item trove_mpp matches 17 run item replace entity @s weapon.offhand from block ~ ~ ~ container.17
execute if score $rand_item trove_mpp matches 18 run item replace entity @s weapon.offhand from block ~ ~ ~ container.18
execute if score $rand_item trove_mpp matches 19 run item replace entity @s weapon.offhand from block ~ ~ ~ container.19
execute if score $rand_item trove_mpp matches 20 run item replace entity @s weapon.offhand from block ~ ~ ~ container.20
execute if score $rand_item trove_mpp matches 21 run item replace entity @s weapon.offhand from block ~ ~ ~ container.21
execute if score $rand_item trove_mpp matches 22 run item replace entity @s weapon.offhand from block ~ ~ ~ container.22
execute if score $rand_item trove_mpp matches 23 run item replace entity @s weapon.offhand from block ~ ~ ~ container.23
execute if score $rand_item trove_mpp matches 24 run item replace entity @s weapon.offhand from block ~ ~ ~ container.24
execute if score $rand_item trove_mpp matches 25 run item replace entity @s weapon.offhand from block ~ ~ ~ container.25
execute if score $rand_item trove_mpp matches 26 run item replace entity @s weapon.offhand from block ~ ~ ~ container.26