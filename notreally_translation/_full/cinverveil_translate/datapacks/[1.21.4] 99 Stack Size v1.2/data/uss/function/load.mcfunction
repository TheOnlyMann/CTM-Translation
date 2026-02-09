
schedule clear uss:loop/1s
schedule clear uss:loop/4t
data modify storage uss:storage stack_size set value 99

schedule function uss:loop/1s 1s
schedule function uss:loop/4t 4t