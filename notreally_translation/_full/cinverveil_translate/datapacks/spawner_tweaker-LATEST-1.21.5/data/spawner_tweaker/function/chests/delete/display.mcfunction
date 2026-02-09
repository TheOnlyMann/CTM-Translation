#Creates display for the deleted chest
$execute in $(dimension) positioned $(x) $(y) $(z) if loaded ~ ~ ~ align xyz run summon item_display ~0.499 ~0.499 ~0.499 {Tags:["st_primer"],Glowing:1b,width:100f,height:100f,interpolation_duration:2,teleport_duration:2,brightness:{sky:15,block:15},transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[1.02f,1.02f,1.02f]},item:{id:"minecraft:tinted_glass",count:1b}}
$execute in $(dimension) positioned $(x) $(y) $(z) if loaded ~ ~ ~ align xyz positioned ~0.5 ~0.5 ~0.5 run team join spawner_tweaker_red @e[distance=..1,limit=1,sort=nearest,tag=st_primer,type=item_display]

#Add to counter
scoreboard players add removed_chests temp 1
