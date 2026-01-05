execute if entity @s[tag=!trove.mob.init] run function trove_mob:mob_init


execute on target run tag @s add trove.target.player



execute if entity @s[tag=trove.mob.cleave] run function trove_mob:active/cleave_
execute if entity @s[tag=trove.mob.imprison] run function trove_mob:active/imprison_




execute on target run tag @s remove trove.target.player
