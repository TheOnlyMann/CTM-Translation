$function death_tax:tax/container/setup {slot:"$(setup)"}
$data modify storage death_tax:storage root.temp.component set value "$(setup)"

# copy the stuff into the box
function death_tax:storage/forloop {iter:0,max_iter:27,current:"#shulker_slot co_math",command:"function death_tax:tax/container/generic_shulker_setup"}

# put the shulker in the chest
loot insert 1000001 71 1000000 mine 1000000 71 1000000

# move the shulker from chest to inventory
$item replace entity @s $(replace) from block 1000001 71 1000000 container.0

