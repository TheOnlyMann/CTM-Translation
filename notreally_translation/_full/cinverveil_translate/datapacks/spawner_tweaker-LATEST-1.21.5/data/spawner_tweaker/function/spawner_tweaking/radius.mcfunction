#Modifies the radius scaling
$data merge entity @s {interpolation_duration:2,teleport_duration:12,start_interpolation:0,transformation:[$(scale)f,0f,0f,-$(x)f,0f,$(scale)f,0f,-$(y)f,0f,0f,1f,0f,0f,0f,0f,1f]}
$execute if entity @s[tag=st_radius_x,tag=st_multiple_select] align xyz positioned ~0.5 ~0.5 ~0.5 run tp @s ~ ~$(height) ~
$execute if entity @s[tag=!st_radius_x,tag=st_multiple_select] align xyz positioned ~0.5 ~0.5 ~0.5 run tp @s ~$(height) ~ ~$(height)