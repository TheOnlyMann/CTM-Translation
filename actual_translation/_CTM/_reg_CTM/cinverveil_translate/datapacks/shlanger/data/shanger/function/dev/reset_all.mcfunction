
function shanger:dev/reset_stats
function startingstuff:reset
#function shanger:dev/checkpoint/reset
#function shanger:wool_effect/reset_all

function shanger:place_wool/clear_wools

scoreboard players set .total_spawners shanger.data 0

scoreboard players set .tutorial_puzzle shanger.data 0
scoreboard players set $found_monument trove_recall 0

scoreboard players set .win_message shanger.data 0
scoreboard players set .correct_wools shanger.data 0
scoreboard players set .total_submissions shanger.data 0
function shanger:place_wool/update_display
scoreboard players set .sidebar_cycle shanger.data 0
scoreboard players set .sidebar_timer shanger.data -1
scoreboard objectives setdisplay sidebar
advancement revoke @a from shanger:display/root
