

scoreboard objectives remove stats.deaths
scoreboard objectives remove stats.mobkills
scoreboard objectives remove stats.spawners
scoreboard objectives remove stats.torch
scoreboard objectives remove stats.time
scoreboard objectives remove stats.totems
scoreboard objectives remove stats.challenge_time




scoreboard objectives add stats.deaths deathCount [{"text":"☠ 사망 횟수","bold":false,"color":"red"}]
scoreboard objectives add stats.mobkills minecraft.custom:minecraft.mob_kills [{"text":"⚔ 몹 처치","bold":false,"color":"light_purple"}]
scoreboard objectives add stats.spawners minecraft.mined:minecraft.spawner [{"text":"⛏ 스포너 채굴","bold":false,"color":"dark_aqua"}]
scoreboard objectives add stats.torch minecraft.used:minecraft.torch [{"text":"🔥 횃불 설치","bold":false,"color":"yellow"}]
scoreboard objectives add stats.time dummy [{"text":"⏰ 플레이 시간","bold":false,"color":"green"}]
scoreboard objectives add stats.totems minecraft.used:minecraft.totem_of_undying [{"text":"❤ 토템 사용","bold":false,"color":"gold"}]
scoreboard objectives add stats.challenge_time dummy
scoreboard objectives setdisplay list stats.deaths
say reset all stats