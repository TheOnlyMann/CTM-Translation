#Spawns the needed displays if they do not exist

#Main rotating glass display
summon item_display ~ ~ ~ {Tags:["st_display","st_glass","st_uninitialized"],Glowing:1b,width:100f,height:100f,interpolation_duration:5,teleport_duration:11,brightness:{sky:15,block:15},transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[1.01f,1.01f,1.01f]},item:{id:"minecraft:glass",count:1b}}
team join spawner_tweaker_green @e[limit=1,sort=nearest,distance=..1,tag=st_glass,tag=st_uninitialized]

#Extra display for spawner range
summon block_display ~ ~ ~ {Tags:["st_display","st_box","st_uninitialized"],view_range:100f,width:100f,height:100f,teleport_duration:12,brightness:{sky:15,block:15},transformation:[0.1f,0f,0f,0f,0f,0.1f,0f,0f,0f,0f,0.1f,0f,0f,0f,0f,1f],block_state:{Name:"minecraft:red_stained_glass"}}

#Displays for radius
summon text_display ~ ~ ~ {Glowing:1b,view_range:100f,width:100f,height:100f,billboard:"vertical",start_interpolation:-1,interpolation_duration:2,teleport_duration:12,text_opacity:120,Rotation:[0F,-90F],Tags:["st_display","st_radius_x","st_radius","st_uninitialized"],brightness:{sky:15,block:15},transformation:[0.1f,0f,0f,0f,0f,0.1f,0f,0f,0f,0f,0.1f,0f,0f,0f,0f,1f],text:{"color":"red","italic":false,"text":"⬤"},background:16711680}

summon text_display ~ ~ ~ {Glowing:1b,view_range:100f,width:100f,height:100f,billboard:"fixed",start_interpolation:-1,interpolation_duration:2,teleport_duration:12,text_opacity:120,Rotation:[0F,0F],Tags:["st_display","st_radius_y","st_radius","st_uninitialized"],brightness:{sky:15,block:15},transformation:[0.1f,0f,0f,0f,0f,0.1f,0f,0f,0f,0f,0.1f,0f,0f,0f,0f,1f],text:{"color":"red","italic":false,"text":"⬤"},background:16711680}

summon text_display ~ ~ ~ {Glowing:1b,view_range:100f,width:100f,height:100f,billboard:"fixed",start_interpolation:-1,interpolation_duration:2,teleport_duration:12,text_opacity:120,Rotation:[45F,0F],Tags:["st_display","st_radius_y","st_radius","st_uninitialized"],brightness:{sky:15,block:15},transformation:[0.1f,0f,0f,0f,0f,0.1f,0f,0f,0f,0f,0.1f,0f,0f,0f,0f,1f],text:{"color":"red","italic":false,"text":"⬤"},background:16711680}

summon text_display ~ ~ ~ {Glowing:1b,view_range:100f,width:100f,height:100f,billboard:"fixed",start_interpolation:-1,interpolation_duration:2,teleport_duration:12,text_opacity:120,Rotation:[90F,0F],Tags:["st_display","st_radius_y","st_radius","st_uninitialized"],brightness:{sky:15,block:15},transformation:[0.1f,0f,0f,0f,0f,0.1f,0f,0f,0f,0f,0.1f,0f,0f,0f,0f,1f],text:{"color":"red","italic":false,"text":"⬤"},background:16711680}

summon text_display ~ ~ ~ {Glowing:1b,view_range:100f,width:100f,height:100f,billboard:"fixed",start_interpolation:-1,interpolation_duration:2,teleport_duration:12,text_opacity:120,Rotation:[135F,0F],Tags:["st_display","st_radius_y","st_radius","st_uninitialized"],brightness:{sky:15,block:15},transformation:[0.1f,0f,0f,0f,0f,0.1f,0f,0f,0f,0f,0.1f,0f,0f,0f,0f,1f],text:{"color":"red","italic":false,"text":"⬤"},background:16711680}

summon text_display ~ ~ ~ {Glowing:1b,view_range:100f,width:100f,height:100f,billboard:"fixed",start_interpolation:-1,interpolation_duration:2,teleport_duration:12,text_opacity:120,Rotation:[180F,0F],Tags:["st_display","st_radius_y","st_radius","st_uninitialized"],brightness:{sky:15,block:15},transformation:[0.1f,0f,0f,0f,0f,0.1f,0f,0f,0f,0f,0.1f,0f,0f,0f,0f,1f],text:{"color":"red","italic":false,"text":"⬤"},background:16711680}

summon text_display ~ ~ ~ {Glowing:1b,view_range:100f,width:100f,height:100f,billboard:"fixed",start_interpolation:-1,interpolation_duration:2,teleport_duration:12,text_opacity:120,Rotation:[-45F,0F],Tags:["st_display","st_radius_y","st_radius","st_uninitialized"],brightness:{sky:15,block:15},transformation:[0.1f,0f,0f,0f,0f,0.1f,0f,0f,0f,0f,0.1f,0f,0f,0f,0f,1f],text:{"color":"red","italic":false,"text":"⬤"},background:16711680}

summon text_display ~ ~ ~ {Glowing:1b,view_range:100f,width:100f,height:100f,billboard:"fixed",start_interpolation:-1,interpolation_duration:2,teleport_duration:12,text_opacity:120,Rotation:[-90F,0F],Tags:["st_display","st_radius_y","st_radius","st_uninitialized"],brightness:{sky:15,block:15},transformation:[0.1f,0f,0f,0f,0f,0.1f,0f,0f,0f,0f,0.1f,0f,0f,0f,0f,1f],text:{"color":"red","italic":false,"text":"⬤"},background:16711680}

summon text_display ~ ~ ~ {Glowing:1b,view_range:100f,width:100f,height:100f,billboard:"fixed",start_interpolation:-1,interpolation_duration:2,teleport_duration:12,text_opacity:120,Rotation:[-135F,0F],Tags:["st_display","st_radius_y","st_radius","st_uninitialized","st_uninitialized"],brightness:{sky:15,block:15},transformation:[0.1f,0f,0f,0f,0f,0.1f,0f,0f,0f,0f,0.1f,0f,0f,0f,0f,1f],text:{"color":"red","italic":false,"text":"⬤"},background:16711680}

#Radius under
summon text_display ~ ~ ~ {Glowing:1b,view_range:100f,width:100f,height:100f,billboard:"vertical",start_interpolation:-1,interpolation_duration:2,teleport_duration:12,text_opacity:120,Rotation:[0F,90F],Tags:["st_display","st_radius_x2","st_radius_x","st_radius","st_uninitialized"],brightness:{sky:15,block:15},transformation:[0.1f,0f,0f,0f,0f,0.1f,0f,0f,0f,0f,0.1f,0f,0f,0f,0f,1f],text:{"color":"red","italic":false,"text":"⬤"},background:16711680}

#Player interactions
execute if entity @s[tag=!st_multiple_select] run summon interaction ~ ~ ~ {width:5.0f,height:2.0f,response:0b,Tags:["spawner_interaction","top","st_uninitialized"]}
execute if entity @s[tag=!st_multiple_select] run summon interaction ~ ~ ~ {width:5.0f,height:2.0f,response:0b,Tags:["spawner_interaction","bottom","st_uninitialized"]}

#Assign ids and scores
execute store result score random temp run random value -100..100
execute as @e[tag=st_glass] if score @s spawner_tweaker_offset = random temp store result score random temp run random value -100..100
execute store result score @e[distance=..0.1,tag=st_uninitialized,tag=st_glass] spawner_tweaker_offset run scoreboard players get random temp
scoreboard players operation @e[distance=..0.1,tag=st_uninitialized] spawner_tweaker_id = tweaker_id spawner_tweaker
execute if entity @s[tag=st_multiple_select] run tag @e[distance=..0.1,tag=st_uninitialized] add st_multiple_select
tag @e[distance=..0.1,tag=st_uninitialized] remove st_uninitialized