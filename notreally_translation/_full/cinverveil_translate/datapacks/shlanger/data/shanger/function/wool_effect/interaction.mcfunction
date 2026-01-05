advancement revoke @s only shanger:obj_punch

summon item ~ ~ ~ {Age:5998,PickupDelay:0,Tags:["shanger.obj"],Item:{id:"minecraft:glass_bottle",count:1}}

data modify entity @n[type=item,tag=shanger.obj] Item set from entity @n[type=item_display,tag=shanger.obj] item

playsound minecraft:block.wool.place master @s

scoreboard players set @s zat_last_attack -40