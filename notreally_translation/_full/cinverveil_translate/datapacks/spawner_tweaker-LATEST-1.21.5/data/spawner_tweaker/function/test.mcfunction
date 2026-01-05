#test for loading chunks sub-tick
forceload add 9787 8768
execute positioned 9787 100 8768 if loaded ~ ~ ~ run say loaded
execute positioned 9787 100 8768 unless loaded ~ ~ ~ run say not loaded
forceload remove 9787 8768
