# if item shouldn't be taxed, break
execute if score #tax_this_item co_math matches 0 run return 0

# macro to set the amount of item
$execute unless score #tax_type co_math matches 2 if score #durability co_math matches 0 run item modify entity @s $(slot) {function:"minecraft:set_count","count":$(count)}

# macro to set durability
$execute unless score #tax_type co_math matches 1 if score #durability co_math matches 1.. run item modify entity @s $(slot) {function:"minecraft:set_components","components":{"minecraft:damage":$(count)}}




