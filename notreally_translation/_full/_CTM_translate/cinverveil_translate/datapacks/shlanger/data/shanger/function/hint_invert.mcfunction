advancement revoke @s only shanger:hint_invert


execute if items entity @s weapon.mainhand *[minecraft:custom_data~{objective:1}] run tag @s add invert_go
execute if items entity @s weapon.mainhand *[minecraft:custom_data~{objective:1b}] run tag @s add invert_go

execute if entity @s[tag=invert_go] run function shanger:hint_invert_go
execute unless entity @s[tag=invert_go] run function shanger:hint_invert_fail
tag @s remove invert_go
