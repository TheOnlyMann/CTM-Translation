
$execute unless items entity @s contents #uss:exclude unless items entity @s contents *[minecraft:custom_data={uss_exclude:1}] run data merge entity @s {Item:{components:{"minecraft:max_stack_size":$(stack_size)}}}





tag @s add item_checked