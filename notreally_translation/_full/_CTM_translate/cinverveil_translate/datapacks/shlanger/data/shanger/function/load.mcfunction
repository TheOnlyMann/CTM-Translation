
schedule clear shanger:loop/1s
scoreboard objectives add mine_spawner minecraft.mined:minecraft.spawner

setblock 92 238 -119 chest



scoreboard objectives add shanger.data dummy
scoreboard objectives add shanger.trigger trigger
scoreboard objectives add inventory_steal dummy
scoreboard objectives add die deathCount

scoreboard objectives add stats.deaths deathCount [{"text":"☠ 사망 횟수","bold":false,"color":"red"}]
scoreboard objectives add stats.mobkills minecraft.custom:minecraft.mob_kills [{"text":"⚔ 몹 처치","bold":false,"color":"light_purple"}]
scoreboard objectives add stats.spawners minecraft.mined:minecraft.spawner [{"text":"⛏ 스포너 채굴","bold":false,"color":"dark_aqua"}]
scoreboard objectives add stats.torch minecraft.used:minecraft.torch [{"text":"🔥 횃불 설치","bold":false,"color":"yellow"}]
scoreboard objectives add stats.time dummy [{"text":"⏰ 플레이 시간","bold":false,"color":"green"}]
scoreboard objectives add stats.totems minecraft.used:minecraft.totem_of_undying [{"text":"❤ 토템 사용","bold":false,"color":"gold"}]
scoreboard objectives add stats.challenge_time dummy
scoreboard objectives add time_alive minecraft.custom:minecraft.time_since_death




bossbar add shanger:obj [{"text":"skibbidy"}]
bossbar set shanger:obj color red
bossbar set shanger:obj max 16


scoreboard players set .-1 shanger.data -1
scoreboard players set .2 shanger.data 2
scoreboard players set .3 shanger.data 3
scoreboard players set .60 shanger.data 60
scoreboard players set .100 shanger.data 100
scoreboard players set .3600 shanger.data 3600




schedule function shanger:loop/1s 1s