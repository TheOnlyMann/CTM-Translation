forceload add 1000000 1000000
scoreboard objectives add co_math dummy
scoreboard objectives add tax_death deathCount

scoreboard players set -1 co_math -1

execute unless score #first_load co_math matches 1 run function death_tax:first_load



