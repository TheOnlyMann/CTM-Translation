tag @s add trove_mpp

execute store result score $rand trove_mpp run random value 1..8
execute if score $rand trove_mpp matches 1 if entity @s[type=#trove:hostile_offhand_loot] unless items entity @s weapon.offhand * positioned 10 239 -12 run function trove:mpp/offhand_loot

execute if entity @s[tag=husk1] run function trove:mpp/modify/zombie1
execute if entity @s[tag=zombie1] run function trove:mpp/modify/zombie1
#execute if entity @s[tag=creeper1] run function trove:mpp/modify/creeper1
execute if entity @s[tag=babyskeleton1] run function trove:mpp/modify/babyskeleton1
#execute if entity @s[tag=spider1] run function trove:mpp/modify/spider1
#execute if entity @s[tag=blaze1] run function trove:mpp/modify/blaze1
#execute if entity @s[tag=rangedskeleton1] run function trove:mpp/modify/rangedskeleton1

execute if entity @s[tag=husk2] run function trove:mpp/modify/zombie2
execute if entity @s[tag=zombie2] run function trove:mpp/modify/zombie2
#execute if entity @s[tag=creeper2] run function trove:mpp/modify/creeper2
execute if entity @s[tag=babyskeleton2] run function trove:mpp/modify/babyskeleton2
execute if entity @s[tag=rangedpiglin2] run function trove:mpp/modify/crossbow2
#execute if entity @s[tag=magma2] run function trove:mpp/modify/magma2
execute if entity @s[tag=ghast2] run data merge entity @s {Health:5f}
execute if entity @s[tag=vindicator1] run function trove:mpp/modify/vindicator1
execute if entity @s[tag=pillager1] run function trove:mpp/modify/crossbow2
execute if entity @s[tag=brute1] run function trove:mpp/modify/brute1
execute if entity @s[tag=rangedskeleton2] run function trove:mpp/modify/bow2
execute if entity @s[tag=rangedstray2] run function trove:mpp/modify/bow2
execute if entity @s[tag=stray2] run function trove:mpp/modify/zombie2

execute if entity @s[tag=husk3] run function trove:mpp/modify/zombie3
execute if entity @s[tag=zombie3] run function trove:mpp/modify/zombie3
#execute if entity @s[tag=creeper3] run function trove:mpp/modify/creeper3
execute if entity @s[tag=babyskeleton3] run function trove:mpp/modify/babyskeleton3
#execute if entity @s[tag=magma3] run function trove:mpp/modify/magma3
execute if entity @s[tag=drowned1] run function trove:mpp/modify/zombie3
#execute if entity @s[tag=drowned2] run function trove:mpp/modify/drowned2
#execute if entity @s[tag=blaze3] run function trove:mpp/modify/blaze3
execute if entity @s[tag=bogged1] run function trove:mpp/modify/bow3
execute if entity @s[tag=bogged2] run function trove:mpp/modify/babyskeleton3
#execute if entity @s[tag=zoglin1] run function trove:mpp/modify/zoglin1

execute if entity @s[type=piglin] run effect give @s minecraft:fire_resistance infinite 0 true
execute if entity @s[type=piglin_brute] run effect give @s minecraft:fire_resistance infinite 0 true

#function trove:mpp/set_health {hp: 16}

