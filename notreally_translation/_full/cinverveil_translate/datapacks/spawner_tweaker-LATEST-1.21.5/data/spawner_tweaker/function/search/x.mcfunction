#Iterates search along the x axis

execute if block ~ ~ ~ #spawner_tweaker:container run function spawner_tweaker:chests/register/found_container
execute if block ~ ~ ~ spawner run function spawner_tweaker:register/register_base
execute if score debug temp matches 1.. run particle electric_spark ~ ~ ~ 0 0 0 0 1 force @s

scoreboard players add search_x temp 1
execute if score search_x temp <= max_length temp positioned ~1 ~ ~ run function spawner_tweaker:search/x with storage spawner_tweaker:temp variables
$execute unless score search_x temp <= max_length temp if score search_z temp matches ..$(max_length) positioned ~-$(max_length) ~ ~ run function spawner_tweaker:search/z with storage spawner_tweaker:temp variables