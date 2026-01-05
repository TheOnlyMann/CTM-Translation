
#Getting the relevant positioning information
execute align xyz run summon marker ~0.5 ~0.5 ~0.5 {UUID:[I;-44439381,467092815,-2143523091,-286623066]}
data modify storage spawner_tweaker:temp Pos set value {Pos:[0.0d,0.0d,0.0d],x:0,y:0,z:0,dimension:"minecraft:overworld"}
data modify storage spawner_tweaker:temp Pos.Pos set from entity fd59e8ab-1bd7-454f-803c-6eedeeea7aa6 Pos
data modify storage spawner_tweaker:temp Pos.dimension set from entity @p Dimension
data modify storage spawner_tweaker:temp Pos.x set from storage spawner_tweaker:temp Pos.Pos[0]
data modify storage spawner_tweaker:temp Pos.y set from storage spawner_tweaker:temp Pos.Pos[1]
data modify storage spawner_tweaker:temp Pos.z set from storage spawner_tweaker:temp Pos.Pos[2]
data remove storage spawner_tweaker:temp Pos.Pos
kill fd59e8ab-1bd7-454f-803c-6eedeeea7aa6
