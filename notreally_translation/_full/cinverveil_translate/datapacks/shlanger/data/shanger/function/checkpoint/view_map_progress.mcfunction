

tellraw @s [{"color":"gold","text":"----------------------"}]

tellraw @s [{"bold":true,"color":"#FFEB9C","text":"맵 진행 상황:\n"}]



execute if score .wool1 shanger.data matches 1 run tellraw @s [{"text":"✔ ","color":"green"},{"text":"흰색 양털 (서바이벌 모드)","color":"#E3E3E3"}]
execute if score .wool2 shanger.data matches 1 run tellraw @s [{"text":"✔ ","color":"green"},{"text":"주황색 양털 (+0.5 타격 거리)","color":"#FFA845"}]
execute if score .wool3 shanger.data matches 1 run tellraw @s [{"text":"✔ ","color":"green"},{"text":"자홍색 양털 (+2 채굴 효율)","color":"#E97DFF"}]
execute if score .wool4 shanger.data matches 1 run tellraw @s [{"text":"✔ ","color":"green"},{"text":"하늘색 양털 (+2 방어력)","color":"#78E8FF"}]
execute if score .wool5 shanger.data matches 1 run tellraw @s [{"text":"✔ ","color":"green"},{"text":"노란색 양털 (+2 넉백 저항)","color":"#FBFF82"}]
execute if score .wool6 shanger.data matches 1 run tellraw @s [{"text":"✔ ","color":"green"},{"text":"연두색 양털 (+1 공격력)","color":"#61FF66"}]
execute if score .wool7 shanger.data matches 1 run tellraw @s [{"text":"✔ ","color":"green"},{"text":"분홍색 양털 (+0.5 블록 도달 거리)","color":"#FDBFFF"}]
execute if score .wool8 shanger.data matches 1 run tellraw @s [{"text":"✔ ","color":"green"},{"text":"회색 양털 (+50% 낙하 저항)","color":"#C7C7C7"}]
execute if score .wool9 shanger.data matches 1 run tellraw @s [{"text":"✔ ","color":"green"},{"text":"연회색 양털 (독 면역)","color":"#D6D6D6"}]
execute if score .wool10 shanger.data matches 1 run tellraw @s [{"text":"✔ ","color":"green"},{"text":"청록색 양털 (영구 레벨)","color":"#56DEE3"}]
execute if score .wool11 shanger.data matches 1 run tellraw @s [{"text":"✔ ","color":"green"},{"text":"보라색 양털 (+15% 속도)","color":"#BE99FF"}]
execute if score .wool12 shanger.data matches 1 run tellraw @s [{"text":"✔ ","color":"green"},{"text":"갈색 양털 (아이템 유지)","color":"#BD957E"}]
execute if score .wool13 shanger.data matches 1 run tellraw @s [{"text":"✔ ","color":"green"},{"text":"파란색 양털 (+50% 최대 체력)","color":"#699BFF"}]
execute if score .wool14 shanger.data matches 1 run tellraw @s [{"text":"✔ ","color":"green"},{"text":"초록색 양털 (무한 공격 속도)","color":"#73C77F"}]
execute if score .wool15 shanger.data matches 1 run tellraw @s [{"text":"✔ ","color":"green"},{"text":"빨간색 양털 (기가 킬)","color":"#FF7575"}]
execute if score .wool16 shanger.data matches 1 run tellraw @s [{"text":"✔ ","color":"green"},{"text":"검은색 양털 (크리에이티브 모드)","color":"#ADADAD"}]

execute unless score .wool1 shanger.data matches 1 run tellraw @s [{"text":"흰색 양털","color":"gray","italic":true}]
execute unless score .wool2 shanger.data matches 1 run tellraw @s [{"text":"주황색 양털","color":"gray","italic":true}]
execute unless score .wool3 shanger.data matches 1 run tellraw @s [{"text":"자홍색 양털","color":"gray","italic":true}]
execute unless score .wool4 shanger.data matches 1 run tellraw @s [{"text":"하늘색 양털","color":"gray","italic":true}]
execute unless score .wool5 shanger.data matches 1 run tellraw @s [{"text":"노란색 양털","color":"gray","italic":true}]
execute unless score .wool6 shanger.data matches 1 run tellraw @s [{"text":"연두색 양털","color":"gray","italic":true}]
execute unless score .wool7 shanger.data matches 1 run tellraw @s [{"text":"분홍색 양털","color":"gray","italic":true}]
execute unless score .wool8 shanger.data matches 1 run tellraw @s [{"text":"회색 양털","color":"gray","italic":true}]
execute unless score .wool9 shanger.data matches 1 run tellraw @s [{"text":"연회색 양털","color":"gray","italic":true}]
execute unless score .wool10 shanger.data matches 1 run tellraw @s [{"text":"청록색 양털","color":"gray","italic":true}]
execute unless score .wool11 shanger.data matches 1 run tellraw @s [{"text":"보라색 양털","color":"gray","italic":true}]
execute unless score .wool12 shanger.data matches 1 run tellraw @s [{"text":"갈색 양털","color":"gray","italic":true}]
execute unless score .wool13 shanger.data matches 1 run tellraw @s [{"text":"파란색 양털","color":"gray","italic":true}]
execute unless score .wool14 shanger.data matches 1 run tellraw @s [{"text":"초록색 양털","color":"gray","italic":true}]
execute unless score .wool15 shanger.data matches 1 run tellraw @s [{"text":"빨간색 양털","color":"gray","italic":true}]
execute unless score .wool16 shanger.data matches 1 run tellraw @s [{"text":"검은색 양털","color":"gray","italic":true}]



tellraw @s [{"color":"gold","text":"----------------------"}]

playsound minecraft:ui.button.click master @s ~ ~ ~ 0.3 1