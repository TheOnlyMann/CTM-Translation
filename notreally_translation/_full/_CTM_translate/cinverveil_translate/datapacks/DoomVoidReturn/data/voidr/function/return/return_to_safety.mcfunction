$tp $(x) $(y) $(z) 

# Ensure the spot they teleport to is safe.
#
execute at @s if block ~ ~-1 ~ #voidr:not_safe_footing run setblock ~ ~-1 ~ minecraft:glass destroy
execute at @s unless block ~ ~ ~ #voidr:air_types run setblock ~ ~ ~ minecraft:air destroy
execute at @s unless block ~ ~1 ~ #voidr:air_types run setblock ~ ~1 ~ minecraft:air destroy

# Run effects at the location they teleport to
#
execute at @s run function voidr:return/return_to_safety_fx
