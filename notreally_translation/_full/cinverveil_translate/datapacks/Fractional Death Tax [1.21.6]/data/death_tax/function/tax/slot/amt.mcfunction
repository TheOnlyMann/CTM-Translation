scoreboard players set #tax_this_item co_math 1
scoreboard players set #item_amt co_math 3

# get exact item amt
$execute store result score #item_amt co_math run data get entity @s $(location).count

# get durability
$data modify storage death_tax:storage root.get_durability set from entity @s $(location)
function death_tax:tool/max_durability
execute if score #durability co_math matches 1.. run scoreboard players operation #item_amt co_math = #durability co_math
execute if score #durability co_math matches 1.. run scoreboard players operation #item_amt co_math -= #damage co_math

##############################################################################################
### tax override priority
### blanket whitelist/blacklist < custom data blacklist < custom data whitelist < tax evasion enchant < vanishing enchant 
# if we're using the whitelist and the item is on the whitelist, ignore it
$execute if score #tax_safe co_math matches 1 if items $(phys) $(check) #death_tax:whitelist unless data entity @s $(location).components."minecraft:custom_data".tax_blacklist run scoreboard players set #tax_this_item co_math 0

# if we're using the blacklist, ignore the item unless it's on any of the blacklists
$execute if score #tax_safe co_math matches 0 unless items $(phys) $(check) #death_tax:blacklist unless data entity @s $(location).components."minecraft:custom_data".tax_blacklist run scoreboard players set #tax_this_item co_math 0

# item is manually whitelisted, definitely don't modify
$execute if data entity @s $(location).components."minecraft:custom_data".tax_whitelist run scoreboard players set #tax_this_item co_math 0

# item has tax evasion don't modify
$execute if data entity @s $(location).components."minecraft:enchantments"."death_tax:tax_evasion" run scoreboard players set #tax_this_item co_math 0

# remove vanishing items if flag is set no matter what
$execute if data entity @s $(location).components."minecraft:enchantments"."minecraft:vanishing_curse" if score #tax_vanishing co_math matches 1 run scoreboard players set #item_amt co_math 0
$execute if data entity @s $(location).components."minecraft:enchantments"."minecraft:vanishing_curse" if score #tax_vanishing co_math matches 1 run scoreboard players set #durability co_math 0
$execute if data entity @s $(location).components."minecraft:enchantments"."minecraft:vanishing_curse" if score #tax_vanishing co_math matches 1 run scoreboard players set #tax_this_item co_math 1
##############################################################################################

# subtract the taxed fraction of item (rounds down by default)
scoreboard players operation #tax_penalty co_math = #item_amt co_math
scoreboard players operation #tax_penalty co_math *= #tax_numerator co_math
scoreboard players operation #tax_penalty co_math /= #tax_denominator co_math

scoreboard players operation #item_amt co_math -= #tax_penalty co_math

# convert durability remaining into damage
execute if score #durability co_math matches 1.. run scoreboard players operation #item_amt co_math *= -1 co_math
execute if score #durability co_math matches 1.. run scoreboard players operation #item_amt co_math += #durability co_math


