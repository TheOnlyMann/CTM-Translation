

tellraw @s ["",{color:"gold",text:"----------------------"},"\n\n",{color:"yellow",text:"여기를 ",extra:[{text:"[클릭해]",click_event:{action:"open_url",url:"https://pastebin.com/qCfA3FCB"}}," 힌트를 한 곳에서 보기 위한 pastebin을 여세요"]},"\n\n",{color:"gold",text:"----------------------"}]
playsound minecraft:ui.button.click master @s ~ ~ ~ 0.3 1
tag @s add all_hints