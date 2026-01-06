

playsound minecraft:block.note_block.didgeridoo master @s ~ ~ ~ 0.5 1
tellraw @s [{"color":"red","text":"정답을 다시 제출하려면 "},{"bold":true,"color":"#FF6E6E","italic":false,"score":{"name":".submission_cd","objective":"shanger.data"}},{"bold":false,"color":"red","italic":false,"text":"초 기다려야 합니다"}]