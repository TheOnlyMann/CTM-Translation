# if contains item, tax this slot
$execute if items entity @s inventory.$(inv_slot) * run function death_tax:tax/inv_slot_do with storage death_tax:storage root.temp

# if contains shulker, tax it
scoreboard players set #shulker_whitelist co_math 0
$execute store result score #shulker_whitelist co_math run data get entity @s Inventory[{Slot:$(shift_slot)b}].components."minecraft:custom_data".tax_whitelist

$execute if score #shulker_whitelist co_math matches 0 if score #tax_shulker co_math matches 1 if items entity @s inventory.$(inv_slot) #minecraft:shulker_boxes run function death_tax:tax/container/shulker_for {setup:"Inventory[{Slot:$(shift_slot)b}]",replace:"inventory.$(inv_slot)"}




