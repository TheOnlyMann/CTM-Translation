execute store result score $rand_armour trove_mpp run random value 1..10
execute store result score $rand_weapon trove_mpp run random value 1..10
execute store result score $rand_misc trove_mpp run random value 1..10




execute if score $rand_armour trove_mpp matches 1..2 run item replace entity @s armor.legs with minecraft:iron_leggings
execute if score $rand_armour trove_mpp matches 2..4 run item replace entity @s armor.chest with minecraft:chainmail_chestplate
execute if score $rand_armour trove_mpp matches 4..5 run item replace entity @s armor.head with minecraft:chainmail_helmet

execute if score $rand_weapon trove_mpp matches 1..2 run item replace entity @s weapon.mainhand with minecraft:golden_pickaxe
execute if score $rand_weapon trove_mpp matches 3..4 run item replace entity @s weapon.mainhand with minecraft:stone_sword
execute if score $rand_weapon trove_mpp matches 5 run item replace entity @s weapon.mainhand with minecraft:stone_axe