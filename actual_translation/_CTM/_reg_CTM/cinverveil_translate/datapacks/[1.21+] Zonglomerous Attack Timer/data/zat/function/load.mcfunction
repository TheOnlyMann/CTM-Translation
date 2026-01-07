
scoreboard objectives add zat_attack_speed dummy
scoreboard objectives add zat_last_attack dummy
scoreboard objectives add zat_charged_time dummy
scoreboard objectives add zat.data dummy

scoreboard players set $5 zat.data 5








schedule clear zat:loop/1s
schedule function zat:loop/1s 1s