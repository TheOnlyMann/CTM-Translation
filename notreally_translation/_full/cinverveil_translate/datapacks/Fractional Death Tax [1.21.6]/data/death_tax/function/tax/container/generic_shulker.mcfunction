$execute if data entity @s $(component).components.minecraft:container[{slot:$(shulker_slot)}] run function death_tax:tax/container/generic_shulker_do with storage death_tax:storage root.temp

#$say shift slot: $(shift_slot), shulker slot: $(shulker_slot)

