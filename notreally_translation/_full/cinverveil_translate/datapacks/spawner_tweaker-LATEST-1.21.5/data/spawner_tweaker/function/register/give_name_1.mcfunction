#Generates a name for display, kinda silly but has to be done this way
$tellraw @s [{"color":"yellow","hover_event":{"action":"show_text","value":[{"text":"Bulk Spawner Editing ID for grouping similar spawners"}]},"text":"BSE ID Registered "},{"color":"gray","text":"["},{"color":"gray","text":"ID:"},{"color":"gold","score":{"name":"id","objective":"temp"}},{"color":"gray","text":"] - "},$(name)]
scoreboard players set said_name temp 1
