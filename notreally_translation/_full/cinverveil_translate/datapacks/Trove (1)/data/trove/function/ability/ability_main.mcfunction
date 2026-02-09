
execute if score @s trove_ab_cleave_cd matches 1 run title @s actionbar "Cleave Ready!"
execute if score @s trove_ab_cleave_cd matches 1 run function trove_mob:fx/s/cleave_telegraph

execute if score @s trove_ab_cleave_cd matches 1.. run scoreboard players remove @s trove_ab_cleave_cd 1



execute if score @s trove_ab_absorb_dmg matches 1.. run function trove:ability/absorb/dmg_taken
scoreboard players set @s trove_ab_absorb_dmg 0



