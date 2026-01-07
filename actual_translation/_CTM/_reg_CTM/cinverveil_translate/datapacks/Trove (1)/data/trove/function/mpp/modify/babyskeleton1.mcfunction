execute store result score $rand_armour trove_mpp run random value 1..10
execute store result score $rand_weapon trove_mpp run random value 1..10
execute store result score $rand_misc trove_mpp run random value 1..10




execute if score $rand_armour trove_mpp matches 1..2 run item replace entity @s armor.feet with minecraft:leather_boots

execute if score $rand_weapon trove_mpp matches 1 run item replace entity @s weapon.mainhand with minecraft:wooden_axe
execute if score $rand_weapon trove_mpp matches 2..3 run item replace entity @s weapon.mainhand with minecraft:wooden_sword
execute if score $rand_weapon trove_mpp matches 4..7 run item replace entity @s weapon.mainhand with minecraft:wooden_pickaxe