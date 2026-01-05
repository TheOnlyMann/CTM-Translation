# for loop implemented with a little bit of sneaky recursion
$scoreboard players set #current_iteration co_math $(iter)
$scoreboard players set #max_iteration co_math $(max_iter)

# if current iteration is less than max iteration
# this function uses 0 - indexed loop, so passing in
# 0 as iter and n as max_iter produces n iterations
#$execute if score #current_iteration co_math < #max_iteration co_math run tellraw @a "$(command)"
$scoreboard players operation $(current) = #current_iteration co_math
$execute if score #current_iteration co_math < #max_iteration co_math run $(command)

# recursively call this function
# passed in macros are guaranteed to not change
# get values again to enable nested for loops
$scoreboard players set #current_iteration co_math $(iter)
$scoreboard players set #max_iteration co_math $(max_iter)
scoreboard players add #current_iteration co_math 1

# set up next iteration
execute store result storage death_tax:storage root.forloop.iter int 1 run scoreboard players get #current_iteration co_math
execute store result storage death_tax:storage root.forloop.max_iter int 1 run scoreboard players get #max_iteration co_math
$data modify storage death_tax:storage root.forloop.command set value "$(command)"
$data modify storage death_tax:storage root.forloop.current set value "$(current)"

execute if score #current_iteration co_math < #max_iteration co_math run function death_tax:storage/forloop with storage death_tax:storage root.forloop

