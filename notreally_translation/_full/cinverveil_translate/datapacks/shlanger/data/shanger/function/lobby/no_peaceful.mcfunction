

kill @a
difficulty normal
tellraw @a [{"text":"맵을 평화로움 모드로 플레이하지 마세요!","color":"red"}]
execute as @a at @s run playsound minecraft:ui.toast.challenge_complete master @s ~ ~ ~ 1 0.5
summon zombie 56 142 -67 {Tags:["no_peaceful"],PersistenceRequired:1b,NoAI:1b,Invulnerable:1b}