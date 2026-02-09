#Initiates the chest randomizing process
#This is just checking valid containers and removing them from data

#Write data to a temporary list
data remove storage spawner_tweaker:temp debug
data remove storage spawner_tweaker:temp container_checker
data remove storage spawner_tweaker:temp container_randomizer
data modify storage spawner_tweaker:temp container_checker set from storage spawner_tweaker:temp Chests

#Get container counts
scoreboard players set chests_randomized st_priming 0
scoreboard players set chests_checked st_priming 0
scoreboard players add total_chests st_priming 0
execute store result score total_chests st_priming if data storage spawner_tweaker:temp container_checker[]

#Figuring out which chests must be foreloaded
scoreboard players set n temp 0
data modify storage spawner_tweaker:temp container_checker[0].n set value 0
data modify storage spawner_tweaker:temp container_checker[0].next set value 1
function spawner_tweaker:chests/randomizer/load_checker with storage spawner_tweaker:temp container_checker[0]

#Reset the seed
$random reset spawner_tweaker:randomizer $(seed)