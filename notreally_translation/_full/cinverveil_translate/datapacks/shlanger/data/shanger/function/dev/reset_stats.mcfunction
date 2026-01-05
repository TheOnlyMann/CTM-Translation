

scoreboard objectives remove stats.deaths
scoreboard objectives remove stats.mobkills
scoreboard objectives remove stats.spawners
scoreboard objectives remove stats.torch
scoreboard objectives remove stats.time
scoreboard objectives remove stats.totems
scoreboard objectives remove stats.challenge_time




scoreboard objectives add stats.deaths deathCount [{"text":"☠ Deaths","bold":false,"color":"red"}]
scoreboard objectives add stats.mobkills minecraft.custom:minecraft.mob_kills [{"text":"⚔ Mob Kills","bold":false,"color":"light_purple"}]
scoreboard objectives add stats.spawners minecraft.mined:minecraft.spawner [{"text":"⛏ Spawners Mined","bold":false,"color":"dark_aqua"}]
scoreboard objectives add stats.torch minecraft.used:minecraft.torch [{"text":"🔥 Torches Placed","bold":false,"color":"yellow"}]
scoreboard objectives add stats.time dummy [{"text":"⏰ Time Played","bold":false,"color":"green"}]
scoreboard objectives add stats.totems minecraft.used:minecraft.totem_of_undying [{"text":"❤ Totems Popped","bold":false,"color":"gold"}]
scoreboard objectives add stats.challenge_time dummy
scoreboard objectives setdisplay list stats.deaths
say reset all stats