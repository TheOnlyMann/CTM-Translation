#Grabs the id of the spawner that we are about to give to the player

#Assign default values
data modify storage spawner_tweaker:temp give.RequiredPlayerRange set value 16
data modify storage spawner_tweaker:temp give.MaxNearbyEntities set value 6
data modify storage spawner_tweaker:temp give.Delay set value 0
data modify storage spawner_tweaker:temp give.MaxSpawnDelay_s set value 40
data modify storage spawner_tweaker:temp give.MinSpawnDelay_s set value 10
data modify storage spawner_tweaker:temp give.MaxSpawnDelay set value 800
data modify storage spawner_tweaker:temp give.MinSpawnDelay set value 200
data modify storage spawner_tweaker:temp give.SpawnCount set value 4
data modify storage spawner_tweaker:temp give.SpawnRange set value 4
data modify storage spawner_tweaker:temp give.MinBlockLight set value 0
data modify storage spawner_tweaker:temp give.MaxBlockLight set value 15
data modify storage spawner_tweaker:temp give.MinSkyLight set value 0
data modify storage spawner_tweaker:temp give.MaxSkyLight set value 15
data modify storage spawner_tweaker:temp give.Health set value "Default"
data modify storage spawner_tweaker:temp give.Absorption_desc set value ""
data modify storage spawner_tweaker:temp give.Absorption set value ""
data modify storage spawner_tweaker:temp give.Attack set value "Default"
data modify storage spawner_tweaker:temp give.name set value ""
data modify storage spawner_tweaker:temp give.tags set value ""
data modify storage spawner_tweaker:temp give.Tag_prefix set value ""
data modify storage spawner_tweaker:temp give.Speed_desc set value ""
data modify storage spawner_tweaker:temp give.Speed set value ""
data modify storage spawner_tweaker:temp give.Size_desc set value ""
data modify storage spawner_tweaker:temp give.Size set value ""
data modify storage spawner_tweaker:temp give.Armor_desc set value ""
data modify storage spawner_tweaker:temp give.Armor set value ""
data modify storage spawner_tweaker:temp give.Jockey set value ""

#Set up data
$data modify storage spawner_tweaker:temp give.spawner set from storage spawner_tweaker:temp Ids[{id:$(id)}]
data remove storage spawner_tweaker:temp give.spawner.id
data modify storage spawner_tweaker:temp give.MaxNearbyEntities set from storage spawner_tweaker:temp give.spawner.MaxNearbyEntities
data modify storage spawner_tweaker:temp give.Delay set from storage spawner_tweaker:temp give.spawner.Delay
data modify storage spawner_tweaker:temp give.RequiredPlayerRange set from storage spawner_tweaker:temp give.spawner.RequiredPlayerRange
execute store result storage spawner_tweaker:temp give.MaxSpawnDelay_s float 0.05 run data get storage spawner_tweaker:temp give.spawner.MaxSpawnDelay
execute store result storage spawner_tweaker:temp give.MinSpawnDelay_s float 0.05 run data get storage spawner_tweaker:temp give.spawner.MinSpawnDelay
execute store result storage spawner_tweaker:temp give.MaxSpawnDelay float 1 run data get storage spawner_tweaker:temp give.spawner.MaxSpawnDelay
execute store result storage spawner_tweaker:temp give.MinSpawnDelay float 1 run data get storage spawner_tweaker:temp give.spawner.MinSpawnDelay
data modify storage spawner_tweaker:temp give.SpawnCount set from storage spawner_tweaker:temp give.spawner.SpawnCount
data modify storage spawner_tweaker:temp give.SpawnRange set from storage spawner_tweaker:temp give.spawner.SpawnRange
data modify storage spawner_tweaker:temp give.MinBlockLight set from storage spawner_tweaker:temp give.spawner.SpawnPotentials[0].data.custom_spawn_rules.block_light_limit[0]
data modify storage spawner_tweaker:temp give.MaxBlockLight set from storage spawner_tweaker:temp give.spawner.SpawnPotentials[0].data.custom_spawn_rules.block_light_limit[1]
data modify storage spawner_tweaker:temp give.MinSkyLight set from storage spawner_tweaker:temp give.spawner.SpawnPotentials[0].data.custom_spawn_rules.sky_light_limit[0]
data modify storage spawner_tweaker:temp give.MaxSkyLight set from storage spawner_tweaker:temp give.spawner.SpawnPotentials[0].data.custom_spawn_rules.sky_light_limit[1]
execute if data storage spawner_tweaker:temp give.spawner.SpawnPotentials[0].data.entity.Passengers[] run data modify storage spawner_tweaker:temp give.Jockey set value " (Jockey)"
scoreboard players set health temp 0
execute store result score health temp run data get storage spawner_tweaker:temp give.spawner.SpawnPotentials[0].data.entity.Health 100
execute if data storage spawner_tweaker:temp give.spawner.SpawnPotentials[0].data.entity.Health store result storage spawner_tweaker:temp give.Health double 0.01 run scoreboard players get health temp
data modify storage spawner_tweaker:temp give.Absorption set from storage spawner_tweaker:temp give.spawner.SpawnPotentials[0].data.entity.AbsorptionAmount
execute if data storage spawner_tweaker:temp give.spawner.SpawnPotentials[0].data.entity.AbsorptionAmount run data modify storage spawner_tweaker:temp give.Absorption_desc set value " ❤ "
scoreboard players set damage temp 0
execute store result score damage temp run data get storage spawner_tweaker:temp give.spawner.SpawnPotentials[0].data.entity.attributes[{id:"minecraft:attack_damage"}].base 100
execute if data storage spawner_tweaker:temp give.spawner.SpawnPotentials[0].data.entity.attributes[{id:"minecraft:attack_damage"}].base store result storage spawner_tweaker:temp give.Attack double 0.01 run scoreboard players get damage temp
data modify storage spawner_tweaker:temp give.Speed set from storage spawner_tweaker:temp give.spawner.SpawnPotentials[0].data.entity.attributes.[{id:"minecraft:movement_speed"}].base
execute if data storage spawner_tweaker:temp give.spawner.SpawnPotentials[0].data.entity.attributes.[{id:"minecraft:movement_speed"}] run data modify storage spawner_tweaker:temp give.Speed_desc set value " 🏃 "
data modify storage spawner_tweaker:temp give.Size set from storage spawner_tweaker:temp give.spawner.SpawnPotentials[0].data.entity.attributes.[{id:"minecraft:scale"}].base
execute if data storage spawner_tweaker:temp give.spawner.SpawnPotentials[0].data.entity.attributes.[{id:"minecraft:scale"}] run data modify storage spawner_tweaker:temp give.Size_desc set value " ✥ "
data modify storage spawner_tweaker:temp give.Armor set from storage spawner_tweaker:temp give.spawner.SpawnPotentials[0].data.entity.attributes.[{id:"minecraft:armor"}].base
execute if data storage spawner_tweaker:temp give.spawner.SpawnPotentials[0].data.entity.attributes.[{id:"minecraft:armor"}] run data modify storage spawner_tweaker:temp give.Armor_desc set value " ⛨ "
data modify storage spawner_tweaker:temp give.tags set from storage spawner_tweaker:temp give.spawner.SpawnPotentials[0].data.entity.Tags
data modify storage spawner_tweaker:temp give.uuid set from entity @s UUID
data modify storage spawner_tweaker:temp give.SpawnPotentials set from storage spawner_tweaker:temp give.spawner.SpawnPotentials
data modify storage spawner_tweaker:temp give.SpawnData set from storage spawner_tweaker:temp give.spawner.SpawnPotentials[0].data

#Concat tags
data modify storage spawner_tweaker:temp give.Tags set value ""
execute if data storage spawner_tweaker:temp give.spawner.SpawnPotentials[0].data.entity.Tags run data modify storage spawner_tweaker:temp give.Tag_prefix set value "Tags: "
data modify storage spawner_tweaker:temp variables.concat1 set from storage spawner_tweaker:temp give.Tags
data modify storage spawner_tweaker:temp variables.concat2 set value ""
data modify storage spawner_tweaker:temp variables.concat2 set from storage spawner_tweaker:temp give.tags[0]
scoreboard players set continue temp 0
execute if data storage spawner_tweaker:temp give.tags[0] run scoreboard players set continue temp 1
execute if score continue temp matches 1.. run function spawner_tweaker:give_spawners/concat with storage spawner_tweaker:temp variables

#Get the name (pain)
scoreboard players set name temp 0
execute if data storage spawner_tweaker:temp give.spawner.SpawnPotentials[0].data.entity.CustomName run scoreboard players set name temp 1
execute if data storage spawner_tweaker:temp give.spawner.components."minecraft:custom_name" unless data storage spawner_tweaker:temp give.spawner.components."minecraft:custom_data".spawner_tweaker_spawner run scoreboard players set name temp 2
execute if data storage spawner_tweaker:temp give.spawner.components."minecraft:item_name" unless data storage spawner_tweaker:temp give.spawner.components."minecraft:custom_data".spawner_tweaker_spawner run scoreboard players set name temp 2
execute if score name temp matches 0 run data modify storage spawner_tweaker:temp give.name set string storage spawner_tweaker:temp give.spawner.SpawnPotentials[0].data.entity.id 10
execute if score name temp matches 1 run data modify storage spawner_tweaker:temp give.name set from storage spawner_tweaker:temp give.spawner.SpawnPotentials[0].data.entity.CustomName
execute if score name temp matches 2 if data storage spawner_tweaker:temp give.spawner.components."minecraft:custom_name" run data modify storage spawner_tweaker:temp give.name set from storage spawner_tweaker:temp give.spawner.components."minecraft:custom_name"
execute if score name temp matches 2 if data storage spawner_tweaker:temp give.spawner.components."minecraft:item_name" run data modify storage spawner_tweaker:temp give.name set from storage spawner_tweaker:temp give.spawner.components."minecraft:item_name"
execute if score name temp matches 0 if data storage spawner_tweaker:temp give.spawner.SpawnPotentials[0].data.entity.Passengers[] run data modify storage spawner_tweaker:temp give.Jockey set value " Jockey"

#Ouputs
execute if score name temp matches 0 if data storage spawner_tweaker:temp give.spawner run function spawner_tweaker:give_spawners/give_item_1 with storage spawner_tweaker:temp give
execute if score name temp matches 1.. if data storage spawner_tweaker:temp give.spawner run function spawner_tweaker:give_spawners/give_item_2 with storage spawner_tweaker:temp give
execute unless data storage spawner_tweaker:temp give.spawner run tellraw @s[tag=st_give_single] {"color":"red","text":"This spawner id does not exist"}
execute unless data storage spawner_tweaker:temp give.spawner run playsound minecraft:block.note_block.didgeridoo master @s[tag=st_give_single] ~ ~ ~ 1 1
