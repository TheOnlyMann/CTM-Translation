# In ticks:
#   Telegraph = How long the wind up for the attack should be
#   Cooldown = After making an attack, set the cooldown to this
#   Retry = If the attack attempt fails (e.g. line of sight broken), how long to wait before retrying
#   Startup = Amount of cooldown a mob should have to start with once spawned

scoreboard players set @s trove_mob_init_telegraph 30
scoreboard players set @s trove_mob_init_cooldown 80
scoreboard players set @s trove_mob_init_retry 10
scoreboard players set @s trove_mob_init_startup 40
scoreboard players set @s trove_mob_init_damage 0