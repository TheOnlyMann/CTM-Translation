# Motion credit from RenderXR/Suso, used in the Untold Stories series.

# You can do whatever you want to the projectile in here. The below slows down its x, y and z motion.

execute store result entity @s Motion[0] double 0.00008 run data get entity @s Motion[0] 10000
execute store result entity @s Motion[1] double 0.00009 run data get entity @s Motion[1] 10000
execute store result entity @s Motion[2] double 0.00008 run data get entity @s Motion[2] 10000

