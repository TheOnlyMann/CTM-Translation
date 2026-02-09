#Happens when the player triggers a spawner to register as a new id

tag @s add st_new_spawner
kill @e[distance=..2,tag=st_id_display,limit=1,sort=nearest]
execute align xyz positioned ~0.5 ~0.5 ~0.5 run function spawner_tweaker:register/register_base with block ~ ~ ~
tag @s remove st_new_spawner
