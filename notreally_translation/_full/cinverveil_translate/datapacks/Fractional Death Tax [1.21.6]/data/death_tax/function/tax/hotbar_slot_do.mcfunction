$function death_tax:tax/slot/amt {location:"Inventory[{Slot:$(shift_slot)b}]",check:"hotbar.$(hotbar_slot)",phys:"entity @s"}

# get item amt and slot for the set macro
execute store result storage death_tax:storage root.temp.count int 1 run scoreboard players get #item_amt co_math
$data modify storage death_tax:storage root.temp.slot set value "hotbar.$(hotbar_slot)"

function death_tax:tax/slot/set with storage death_tax:storage root.temp


