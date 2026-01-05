# get stored value
scoreboard players set #stored co_math 0
$execute store result score #stored co_math run data get storage $(str) 1

# get modifier
$scoreboard players set #modifier co_math $(mod)

# apply operation
$scoreboard players operation #stored co_math $(op)= #modifier co_math

# store back
$execute store result storage $(str) int 1 run scoreboard players get #stored co_math



