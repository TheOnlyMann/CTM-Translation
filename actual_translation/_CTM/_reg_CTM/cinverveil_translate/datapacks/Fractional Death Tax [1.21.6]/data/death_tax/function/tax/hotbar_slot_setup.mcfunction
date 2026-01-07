execute store result storage death_tax:storage root.temp.hotbar_slot int 1 run scoreboard players get #hotbar_slot co_math

scoreboard players operation #shift_slot co_math = #hotbar_slot co_math
execute store result storage death_tax:storage root.temp.shift_slot int 1 run scoreboard players get #shift_slot co_math


function death_tax:tax/hotbar_slot with storage death_tax:storage root.temp


