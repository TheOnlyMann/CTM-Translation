

tellraw @s ["",{color:"gold",text:"----------------------"},"\n\n",{color:"yellow",text:"Click ",extra:[{text:"[Here]",click_event:{action:"open_url",url:"https://pastebin.com/qCfA3FCB"}}," to open a pastebin link to view all the hints in one place"]},"\n\n",{color:"gold",text:"----------------------"}]
playsound minecraft:ui.button.click master @s ~ ~ ~ 0.3 1
tag @s add all_hints