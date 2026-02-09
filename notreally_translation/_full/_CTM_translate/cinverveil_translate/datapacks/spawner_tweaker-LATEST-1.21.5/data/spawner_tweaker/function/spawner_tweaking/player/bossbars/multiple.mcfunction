#Generates the bossbar for the spawner for those tweaking
$bossbar add spawner_tweaker_$(tweaker_id) [{"color":"white","text":"Multiple Spawners"},{"color":"gray","text":""},{"color":"gray","text":""},{"color":"gold","text":""},{"color":"gray","text":""},{"text":""},{"color":"gray","text":" - $(spawners) selected"}]
$bossbar set spawner_tweaker_$(tweaker_id) color white
$bossbar set spawner_tweaker_$(tweaker_id) max 100
$bossbar set spawner_tweaker_$(tweaker_id) value 100
$bossbar set spawner_tweaker_$(tweaker_id) players @s
$bossbar set spawner_tweaker_$(tweaker_id) style progress

scoreboard players set displayed_name temp 1