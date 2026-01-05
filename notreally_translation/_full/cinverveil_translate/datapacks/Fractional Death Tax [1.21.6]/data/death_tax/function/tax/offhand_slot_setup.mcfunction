scoreboard players set #shift_slot co_math -106
execute store result storage death_tax:storage root.temp.shift_slot int 1 run scoreboard players get #shift_slot co_math


function death_tax:tax/offhand_slot with storage death_tax:storage root.temp


