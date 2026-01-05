# trove.mob         // all mobs should have this
# trove.mob.notick  // to be excluded from ticking - to be applied on init
# trove.mob.init    // this mob has been init

scoreboard players set $buffer trove_mob_tick 0
execute as @e[type=#trove:hostile,tag=trove.mob,tag=!trove.mob.notick] at @s run function trove_mob:1t_on_mob
execute as @e[type=#trove:hostile,tag=trove.mob,tag=!trove.mob.notick] if score @s trove_mob_tick matches 1.. if score @s trove_mob_tick matches ..4 run scoreboard players add $buffer trove_mob_tick 1



# just in-case
#execute as @a[tag=trove.target.player] run tag @s remove trove.target.player