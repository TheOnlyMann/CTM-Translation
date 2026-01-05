

kill @a
difficulty normal
tellraw @a [{"text":"Please do not play the map on peaceful difficulty!","color":"red"}]
execute as @a at @s run playsound minecraft:ui.toast.challenge_complete master @s ~ ~ ~ 1 0.5
summon zombie 56 142 -67 {Tags:["no_peaceful"],PersistenceRequired:1b,NoAI:1b,Invulnerable:1b}