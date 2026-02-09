
summon item_display ~ ~ ~ {teleport_duration:20,Tags:["shanger.obj"],brightness:{sky:15,block:15},transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[0.5f,0.5f,0.5f]},item:{id:"minecraft:stone",count:1}}

summon interaction ~ ~-0.25 ~ {width:0.5f,height:0.5f,Tags:["shanger.obj"]}


setblock ~ ~ ~ glass
setblock ~ ~1 ~ bedrock
setblock ~ ~-1 ~ bedrock

say spawned an objective display