
data modify storage shanger:storage real_hint set from entity @s SelectedItem.components."minecraft:custom_data".real_hint
data modify storage shanger:storage lie_hint set from entity @s SelectedItem.components."minecraft:custom_data".lie_hint
data modify storage shanger:storage showing set from entity @s SelectedItem.components."minecraft:custom_data".showing
item replace block 92 238 -119 container.0 from entity @s weapon.mainhand

execute if data storage shanger:storage {showing:"real"} run function shanger:hint_invert_show_lie
execute if data storage shanger:storage {showing:"lie"} run function shanger:hint_invert_show_real
playsound minecraft:ui.button.click master @s ~ ~ ~ 0.3 1