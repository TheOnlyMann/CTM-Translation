# store the item physically for whitelist and blacklist check
setblock 1000002 71 1000000 chest
data modify block 1000002 71 1000000 Items set value []
$data modify block 1000002 71 1000000 Items append from entity @s $(component).components.minecraft:container[{slot:$(shulker_slot)}].item

# calculate amount
$function death_tax:tax/slot/amt {location:"$(component).components.minecraft:container[{slot:$(shulker_slot)}].item",check:"container.0",phys:"block 1000002 71 1000000"}

# get the item from the player
$data modify storage death_tax:storage root.temp.item set from entity @s $(component).components.minecraft:container[{slot:$(shulker_slot)}]

# set the item's slot to be the current one
$data modify storage death_tax:storage root.temp.item.item.Slot set value $(shulker_slot)b

# write value to storage
execute store result storage death_tax:storage root.temp.count int 1 run scoreboard players get #item_amt co_math

# set amount in stack
execute if score #tax_this_item co_math matches 1 unless score #tax_type co_math matches 2 if score #durability co_math matches 0 run data modify storage death_tax:storage root.temp.item.item.count set from storage death_tax:storage root.temp.count

# set durability of gear
execute if score #tax_this_item co_math matches 1 unless score #tax_type co_math matches 1 if score #durability co_math matches 1.. run data modify storage death_tax:storage root.temp.item.item.components."minecraft:damage" set from storage death_tax:storage root.temp.count

# put the item into the physical shulker
execute unless score #item_amt co_math matches 0 run data modify block 1000000 71 1000000 Items append from storage death_tax:storage root.temp.item.item


