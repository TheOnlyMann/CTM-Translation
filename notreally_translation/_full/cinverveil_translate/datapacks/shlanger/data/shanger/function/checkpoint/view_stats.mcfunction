
advancement revoke @s only shanger:stats

scoreboard players add @s stats.deaths 0
scoreboard players add @s stats.spawners 0
scoreboard players add @s stats.mobkills 0
scoreboard players add @s stats.torch 0
scoreboard players add @s stats.time 0
scoreboard players add @s stats.totems 0


#### PLAYTIME MATH

scoreboard players operation tplay.hr shanger.data = @s stats.time 
scoreboard players operation tplay.hr shanger.data /= .3600 shanger.data 

scoreboard players operation tplay.min shanger.data = tplay.hr shanger.data
scoreboard players operation tplay.min shanger.data *= .3600 shanger.data
scoreboard players operation tplay.min shanger.data *= .-1 shanger.data 
scoreboard players operation tplay.min shanger.data += @s stats.time
scoreboard players operation tplay.min shanger.data /= .60 shanger.data

scoreboard players operation tplay.sec.a shanger.data = tplay.hr shanger.data
scoreboard players operation tplay.sec.a shanger.data *= .3600 shanger.data

scoreboard players operation tplay.sec.b shanger.data = tplay.min shanger.data
scoreboard players operation tplay.sec.b shanger.data *= .60 shanger.data


scoreboard players operation tplay.sec shanger.data = @s stats.time
scoreboard players operation tplay.sec shanger.data -= tplay.sec.a shanger.data
scoreboard players operation tplay.sec shanger.data -= tplay.sec.b shanger.data

scoreboard players operation @s stats.time.s = tplay.sec shanger.data
scoreboard players operation @s stats.time.m = tplay.min shanger.data
scoreboard players operation @s stats.time.h = tplay.hr shanger.data




####





tellraw @s [{"color":"gold","text":"----------------------\n"}]

tellraw @s [{"bold":true,"color":"#99EBFF","selector":"@s"},{"text":"'s Stats\n","bold":true,"color":"#99EBFF"}]

tellraw @s [{"text":"☠ Deaths: ","bold":false,"color":"red"},{"score":{"name":"@s","objective":"stats.deaths"},"color":"white"}]
tellraw @s [{"sprite":"item/totem_of_undying"},{"bold":false,"color":"gold","text":" Totems Popped: "},{"color":"white","score":{"name":"@s","objective":"stats.totems"}}]
tellraw @s [{"sprite":"item/diamond_pickaxe"},{"bold":false,"color":"dark_aqua","text":" Spawners Mined: "},{"color":"white","score":{"name":"@s","objective":"stats.spawners"}}]
tellraw @s [{"sprite":"item/iron_sword"},{"bold":false,"color":"light_purple","text":" Mob Kills: "},{"color":"white","score":{"name":"@s","objective":"stats.mobkills"}}]
tellraw @s [{"sprite":"block/torch"},{"bold":false,"color":"yellow","text":" Torches Placed: "},{"color":"white","score":{"name":"@s","objective":"stats.torch"}}]
tellraw @s [{"sprite":"item/clock_00"},{"bold":false,"color":"green","text":" Time Played: "},{"color":"white","score":{"name":"tplay.hr","objective":"shanger.data"}},{"color":"white","text":"h "},{"color":"white","score":{"name":"tplay.min","objective":"shanger.data"}},{"color":"white","text":"m "},{"color":"white","score":{"name":"tplay.sec","objective":"shanger.data"}},{"color":"white","text":"s "}]


tellraw @s [{"color":"gold","text":"\n----------------------"}]

playsound minecraft:ui.button.click master @s ~ ~ ~ 0.3 1