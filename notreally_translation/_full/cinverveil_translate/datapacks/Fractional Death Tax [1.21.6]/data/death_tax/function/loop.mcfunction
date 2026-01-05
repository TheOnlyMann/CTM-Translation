execute as @a if score @s tax_death matches 1.. if score #tax_disabled co_math matches 0 run function death_tax:death
execute as @a run scoreboard players set @s tax_death 0


