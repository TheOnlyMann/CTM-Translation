$data modify storage death_tax:storage root.temp.shulker_color set from entity @s $(slot).id

# setup up physical storage and clear previous usage
function death_tax:tax/container/shulker_color with storage death_tax:storage root.temp
setblock 1000001 71 1000000 chest
item replace block 1000001 71 1000000 container.0 with air

