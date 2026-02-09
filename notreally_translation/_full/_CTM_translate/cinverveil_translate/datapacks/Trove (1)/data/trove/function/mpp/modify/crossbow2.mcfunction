execute store result score $rand_armour trove_mpp run random value 1..10
execute store result score $rand_weapon trove_mpp run random value 1..10
execute store result score $rand_misc trove_mpp run random value 1..10



execute if score $rand_weapon trove_mpp matches 1..3 run item replace entity @s weapon.mainhand with crossbow[enchantments={"quick_charge":2,"piercing":2}]
execute if score $rand_weapon trove_mpp matches 4.. run item replace entity @s weapon.mainhand with crossbow
execute if score $rand_weapon trove_mpp matches 10 run item replace entity @s weapon.mainhand with crossbow[enchantments={"multishot":1}]

execute if score $rand_weapon trove_mpp matches 10 run item replace entity @s armor.legs with minecraft:gold_leggings