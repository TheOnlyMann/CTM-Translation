# set target damage
scoreboard players set $total_dmg trove_ab_absorb_main 10

# release once at threshold
execute if score @s trove_ab_absorb_main >= $total_dmg trove_ab_absorb_main run function trove:ability/absorb/release

# store damage
scoreboard players operation @s trove_ab_absorb_dmg /= 10 trove_math
scoreboard players operation @s trove_ab_absorb_main += @s trove_ab_absorb_dmg

# ready
execute if score @s trove_ab_absorb_main >= $total_dmg trove_ab_absorb_main run playsound minecraft:entity.parrot.imitate.wither player @s ~ ~ ~ 0.5 2
execute if score @s trove_ab_absorb_main >= $total_dmg trove_ab_absorb_main run particle minecraft:angry_villager ^ ^.5 ^1 2 1 2 0 10 normal @s