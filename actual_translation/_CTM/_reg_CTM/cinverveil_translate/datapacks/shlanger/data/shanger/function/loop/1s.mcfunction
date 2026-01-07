



execute as @e[type=item_display,tag=shanger.obj] at @s run tp @s ~ ~ ~ ~90 ~

execute as @a[gamemode=survival,tag=shanger.init] at @s run scoreboard players add @s stats.time 1
execute if score .submission_cd shanger.data matches 1.. run scoreboard players remove .submission_cd shanger.data 1

schedule function shanger:loop/1s 1s