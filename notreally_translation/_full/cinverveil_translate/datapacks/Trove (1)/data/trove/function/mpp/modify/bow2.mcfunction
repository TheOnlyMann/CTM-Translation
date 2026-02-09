execute store result score $rand_armour trove_mpp run random value 1..10
execute store result score $rand_weapon trove_mpp run random value 1..10
execute store result score $rand_misc trove_mpp run random value 1..10



execute if score $rand_armour trove_mpp matches 1..5 run item replace entity @s armor.chest with minecraft:leather_chestplate


execute if score $rand_weapon trove_mpp matches 1..4 run item replace entity @s weapon.mainhand with bow
execute if score $rand_weapon trove_mpp matches 5..9 run item replace entity @s weapon.mainhand with bow[enchantments={"power":1}]
execute if score $rand_weapon trove_mpp matches 10 run item replace entity @s weapon.mainhand with bow[enchantments={"flame":1}]