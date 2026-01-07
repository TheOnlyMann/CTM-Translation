function death_tax:test/shulker {slot:"hotbar.0"}
function death_tax:test/shulker {slot:"inventory.0"}
function death_tax:test/shulker {slot:"weapon.offhand"}

item replace entity @s hotbar.1 with cobblestone[enchantments={"vanishing_curse":1}] 64
item replace entity @s hotbar.2 with deepslate[enchantments={"death_tax:tax_evasion":1}] 64
item replace entity @s hotbar.3 with netherrack 64

item replace entity @s hotbar.5 with golden_pickaxe[enchantments={"vanishing_curse":1}]
item replace entity @s hotbar.6 with stone_pickaxe[enchantments={"death_tax:tax_evasion":1}]
item replace entity @s hotbar.7 with wooden_pickaxe


item replace entity @s inventory.1 with cobblestone[enchantments={"vanishing_curse":1}] 64
item replace entity @s inventory.2 with deepslate[enchantments={"death_tax:tax_evasion":1}] 64
item replace entity @s inventory.3 with netherrack 64

item replace entity @s inventory.5 with golden_pickaxe[enchantments={"vanishing_curse":1}]
item replace entity @s inventory.6 with stone_pickaxe[enchantments={"death_tax:tax_evasion":1}]
item replace entity @s inventory.7 with wooden_pickaxe


item replace entity @s armor.head with leather_helmet[enchantments={"vanishing_curse":1}]
item replace entity @s armor.chest with leather_chestplate[enchantments={"death_tax:tax_evasion":1}]
item replace entity @s armor.legs with leather_leggings
item replace entity @s armor.feet with leather_boots
