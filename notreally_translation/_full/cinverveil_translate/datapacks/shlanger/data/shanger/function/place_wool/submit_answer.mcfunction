
advancement revoke @s only shanger:submit_answer

scoreboard players add .win_message shanger.data 0
execute if score .win_message shanger.data matches 1.. run tellraw @s {"text":"Submissions no longer accetped","color":"red"}
execute if score .win_message shanger.data matches 1.. run playsound minecraft:block.note_block.didgeridoo master @s ~ ~ ~ 0.5 1
execute if score .win_message shanger.data matches ..0 if score .submission_cd shanger.data matches 1.. run function shanger:place_wool/submission_cd
execute if score .win_message shanger.data matches ..0 unless score .submission_cd shanger.data matches 1.. run function shanger:place_wool/check_if_all_placed

