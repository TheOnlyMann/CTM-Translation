execute if score @s trove_mob_tick matches ..-1 if entity @p[tag=trove.target.player,distance=..8] run scoreboard players add @s trove_mob_tick 1


execute if score @s trove_mob_tick matches 0 run function trove_mob:active/cleave_attempt
execute if score @s trove_mob_tick matches 1 run function trove_mob:active/channel/start_channel
execute if score @s trove_mob_tick matches 1.. if score @s trove_mob_tick < @s trove_mob_init_telegraph run function trove_mob:active/cleave_telegraph
execute if score @s trove_mob_tick = @s trove_mob_init_telegraph run function trove_mob:active/cleave_atk_


execute if score @s trove_mob_tick matches 0.. run scoreboard players add @s trove_mob_tick 1