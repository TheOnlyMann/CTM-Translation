# this file taken and modified from Cartographer 2.0, thank you Pear

# reset
scoreboard players set #durability co_math 0
scoreboard players set #damage co_math 0

# read custom max durability values
execute store result score #durability co_math run data get storage death_tax:storage root.get_durability.components.minecraft:max_damage
execute store result score #damage co_math run data get storage death_tax:storage root.get_durability.components.minecraft:damage

# ranged weapons
execute unless score #durability co_math matches 1.. if data storage death_tax:storage root.get_durability{id:"minecraft:bow"} run scoreboard players set #durability co_math 384
execute unless score #durability co_math matches 1.. if data storage death_tax:storage root.get_durability{id:"minecraft:trident"} run scoreboard players set #durability co_math 250
execute unless score #durability co_math matches 1.. if data storage death_tax:storage root.get_durability{id:"minecraft:crossbow"} run scoreboard players set #durability co_math 465

# tools
execute unless score #durability co_math matches 1.. if data storage death_tax:storage root.get_durability{id:"minecraft:wooden_sword"} run scoreboard players set #durability co_math 59
execute unless score #durability co_math matches 1.. if data storage death_tax:storage root.get_durability{id:"minecraft:wooden_axe"} run scoreboard players set #durability co_math 59
execute unless score #durability co_math matches 1.. if data storage death_tax:storage root.get_durability{id:"minecraft:wooden_pickaxe"} run scoreboard players set #durability co_math 59
execute unless score #durability co_math matches 1.. if data storage death_tax:storage root.get_durability{id:"minecraft:wooden_shovel"} run scoreboard players set #durability co_math 59
execute unless score #durability co_math matches 1.. if data storage death_tax:storage root.get_durability{id:"minecraft:wooden_hoe"} run scoreboard players set #durability co_math 59

execute unless score #durability co_math matches 1.. if data storage death_tax:storage root.get_durability{id:"minecraft:stone_sword"} run scoreboard players set #durability co_math 131
execute unless score #durability co_math matches 1.. if data storage death_tax:storage root.get_durability{id:"minecraft:stone_axe"} run scoreboard players set #durability co_math 131
execute unless score #durability co_math matches 1.. if data storage death_tax:storage root.get_durability{id:"minecraft:stone_pickaxe"} run scoreboard players set #durability co_math 131
execute unless score #durability co_math matches 1.. if data storage death_tax:storage root.get_durability{id:"minecraft:stone_shovel"} run scoreboard players set #durability co_math 131
execute unless score #durability co_math matches 1.. if data storage death_tax:storage root.get_durability{id:"minecraft:stone_hoe"} run scoreboard players set #durability co_math 131

execute unless score #durability co_math matches 1.. if data storage death_tax:storage root.get_durability{id:"minecraft:golden_sword"} run scoreboard players set #durability co_math 32
execute unless score #durability co_math matches 1.. if data storage death_tax:storage root.get_durability{id:"minecraft:golden_axe"} run scoreboard players set #durability co_math 32
execute unless score #durability co_math matches 1.. if data storage death_tax:storage root.get_durability{id:"minecraft:golden_pickaxe"} run scoreboard players set #durability co_math 32
execute unless score #durability co_math matches 1.. if data storage death_tax:storage root.get_durability{id:"minecraft:golden_shovel"} run scoreboard players set #durability co_math 32
execute unless score #durability co_math matches 1.. if data storage death_tax:storage root.get_durability{id:"minecraft:golden_hoe"} run scoreboard players set #durability co_math 32

execute unless score #durability co_math matches 1.. if data storage death_tax:storage root.get_durability{id:"minecraft:iron_sword"} run scoreboard players set #durability co_math 250
execute unless score #durability co_math matches 1.. if data storage death_tax:storage root.get_durability{id:"minecraft:iron_axe"} run scoreboard players set #durability co_math 250
execute unless score #durability co_math matches 1.. if data storage death_tax:storage root.get_durability{id:"minecraft:iron_pickaxe"} run scoreboard players set #durability co_math 250
execute unless score #durability co_math matches 1.. if data storage death_tax:storage root.get_durability{id:"minecraft:iron_shovel"} run scoreboard players set #durability co_math 250
execute unless score #durability co_math matches 1.. if data storage death_tax:storage root.get_durability{id:"minecraft:iron_hoe"} run scoreboard players set #durability co_math 250

execute unless score #durability co_math matches 1.. if data storage death_tax:storage root.get_durability{id:"minecraft:diamond_sword"} run scoreboard players set #durability co_math 1561
execute unless score #durability co_math matches 1.. if data storage death_tax:storage root.get_durability{id:"minecraft:diamond_axe"} run scoreboard players set #durability co_math 1561
execute unless score #durability co_math matches 1.. if data storage death_tax:storage root.get_durability{id:"minecraft:diamond_pickaxe"} run scoreboard players set #durability co_math 1561
execute unless score #durability co_math matches 1.. if data storage death_tax:storage root.get_durability{id:"minecraft:diamond_shovel"} run scoreboard players set #durability co_math 1561
execute unless score #durability co_math matches 1.. if data storage death_tax:storage root.get_durability{id:"minecraft:diamond_hoe"} run scoreboard players set #durability co_math 1561

execute unless score #durability co_math matches 1.. if data storage death_tax:storage root.get_durability{id:"minecraft:netherite_sword"} run scoreboard players set #durability co_math 2031
execute unless score #durability co_math matches 1.. if data storage death_tax:storage root.get_durability{id:"minecraft:netherite_axe"} run scoreboard players set #durability co_math 2031
execute unless score #durability co_math matches 1.. if data storage death_tax:storage root.get_durability{id:"minecraft:netherite_pickaxe"} run scoreboard players set #durability co_math 2031
execute unless score #durability co_math matches 1.. if data storage death_tax:storage root.get_durability{id:"minecraft:netherite_shovel"} run scoreboard players set #durability co_math 2031
execute unless score #durability co_math matches 1.. if data storage death_tax:storage root.get_durability{id:"minecraft:netherite_hoe"} run scoreboard players set #durability co_math 2031


# armor
execute unless score #durability co_math matches 1.. if data storage death_tax:storage root.get_durability{id:"minecraft:leather_helmet"} run scoreboard players set #durability co_math 55
execute unless score #durability co_math matches 1.. if data storage death_tax:storage root.get_durability{id:"minecraft:leather_chestplate"} run scoreboard players set #durability co_math 80
execute unless score #durability co_math matches 1.. if data storage death_tax:storage root.get_durability{id:"minecraft:leather_leggings"} run scoreboard players set #durability co_math 75
execute unless score #durability co_math matches 1.. if data storage death_tax:storage root.get_durability{id:"minecraft:leather_boots"} run scoreboard players set #durability co_math 65

execute unless score #durability co_math matches 1.. if data storage death_tax:storage root.get_durability{id:"minecraft:golden_helmet"} run scoreboard players set #durability co_math 77
execute unless score #durability co_math matches 1.. if data storage death_tax:storage root.get_durability{id:"minecraft:golden_chestplate"} run scoreboard players set #durability co_math 112
execute unless score #durability co_math matches 1.. if data storage death_tax:storage root.get_durability{id:"minecraft:golden_leggings"} run scoreboard players set #durability co_math 105
execute unless score #durability co_math matches 1.. if data storage death_tax:storage root.get_durability{id:"minecraft:golden_boots"} run scoreboard players set #durability co_math 91

execute unless score #durability co_math matches 1.. if data storage death_tax:storage root.get_durability{id:"minecraft:chainmail_helmet"} run scoreboard players set #durability co_math 165
execute unless score #durability co_math matches 1.. if data storage death_tax:storage root.get_durability{id:"minecraft:chainmail_chestplate"} run scoreboard players set #durability co_math 240
execute unless score #durability co_math matches 1.. if data storage death_tax:storage root.get_durability{id:"minecraft:chainmail_leggings"} run scoreboard players set #durability co_math 225
execute unless score #durability co_math matches 1.. if data storage death_tax:storage root.get_durability{id:"minecraft:chainmail_boots"} run scoreboard players set #durability co_math 195

execute unless score #durability co_math matches 1.. if data storage death_tax:storage root.get_durability{id:"minecraft:iron_helmet"} run scoreboard players set #durability co_math 165
execute unless score #durability co_math matches 1.. if data storage death_tax:storage root.get_durability{id:"minecraft:iron_chestplate"} run scoreboard players set #durability co_math 240
execute unless score #durability co_math matches 1.. if data storage death_tax:storage root.get_durability{id:"minecraft:iron_leggings"} run scoreboard players set #durability co_math 225
execute unless score #durability co_math matches 1.. if data storage death_tax:storage root.get_durability{id:"minecraft:iron_boots"} run scoreboard players set #durability co_math 195

execute unless score #durability co_math matches 1.. if data storage death_tax:storage root.get_durability{id:"minecraft:diamond_helmet"} run scoreboard players set #durability co_math 363
execute unless score #durability co_math matches 1.. if data storage death_tax:storage root.get_durability{id:"minecraft:diamond_chestplate"} run scoreboard players set #durability co_math 528
execute unless score #durability co_math matches 1.. if data storage death_tax:storage root.get_durability{id:"minecraft:diamond_leggings"} run scoreboard players set #durability co_math 495
execute unless score #durability co_math matches 1.. if data storage death_tax:storage root.get_durability{id:"minecraft:diamond_boots"} run scoreboard players set #durability co_math 429

execute unless score #durability co_math matches 1.. if data storage death_tax:storage root.get_durability{id:"minecraft:netherite_helmet"} run scoreboard players set #durability co_math 407
execute unless score #durability co_math matches 1.. if data storage death_tax:storage root.get_durability{id:"minecraft:netherite_chestplate"} run scoreboard players set #durability co_math 592
execute unless score #durability co_math matches 1.. if data storage death_tax:storage root.get_durability{id:"minecraft:netherite_leggings"} run scoreboard players set #durability co_math 555
execute unless score #durability co_math matches 1.. if data storage death_tax:storage root.get_durability{id:"minecraft:netherite_boots"} run scoreboard players set #durability co_math 481


# misc
execute unless score #durability co_math matches 1.. if data storage death_tax:storage root.get_durability{id:"minecraft:turtle_helmet"} run scoreboard players set #durability co_math 275
execute unless score #durability co_math matches 1.. if data storage death_tax:storage root.get_durability{id:"minecraft:elytra"} run scoreboard players set #durability co_math 432

execute unless score #durability co_math matches 1.. if data storage death_tax:storage root.get_durability{id:"minecraft:flint_and_steel"} run scoreboard players set #durability co_math 64
execute unless score #durability co_math matches 1.. if data storage death_tax:storage root.get_durability{id:"minecraft:wolf_armor"} run scoreboard players set #durability co_math 64
execute unless score #durability co_math matches 1.. if data storage death_tax:storage root.get_durability{id:"minecraft:brush"} run scoreboard players set #durability co_math 64
execute unless score #durability co_math matches 1.. if data storage death_tax:storage root.get_durability{id:"minecraft:fishing_rod"} run scoreboard players set #durability co_math 64
execute unless score #durability co_math matches 1.. if data storage death_tax:storage root.get_durability{id:"minecraft:carrot_on_a_stick"} run scoreboard players set #durability co_math 25
execute unless score #durability co_math matches 1.. if data storage death_tax:storage root.get_durability{id:"minecraft:warped_fungus_on_a_stick"} run scoreboard players set #durability co_math 100
execute unless score #durability co_math matches 1.. if data storage death_tax:storage root.get_durability{id:"minecraft:shears"} run scoreboard players set #durability co_math 238
execute unless score #durability co_math matches 1.. if data storage death_tax:storage root.get_durability{id:"minecraft:shield"} run scoreboard players set #durability co_math 336


