execute store result score $rand_armour trove_mpp run random value 1..10
execute store result score $rand_weapon trove_mpp run random value 1..10
execute store result score $rand_misc trove_mpp run random value 1..10




execute if score $rand_armour trove_mpp matches 1..2 run item replace entity @s armor.legs with minecraft:iron_leggings
execute if score $rand_armour trove_mpp matches 2..4 run item replace entity @s armor.chest with minecraft:iron_chestplate
execute if score $rand_armour trove_mpp matches 4..5 run item replace entity @s armor.head with minecraft:diamond_helmet

execute if score $rand_weapon trove_mpp matches 1..2 run item replace entity @s weapon.mainhand with minecraft:golden_pickaxe
execute if score $rand_weapon trove_mpp matches 3..4 run item replace entity @s weapon.mainhand with minecraft:iron_sword
execute if score $rand_weapon trove_mpp matches 5 run item replace entity @s weapon.mainhand with minecraft:diamond_axe

execute if score $rand_misc trove_mpp matches 1 run item replace entity @s weapon.offhand with minecraft:totem_of_undying