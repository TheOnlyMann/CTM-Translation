advancement revoke @s only trove:recall3



scoreboard players set @s trove_recall 1
execute as @s if predicate {"condition":"minecraft:entity_properties","entity":"this","predicate":{"flags":{"is_sneaking":true}}} run scoreboard players set @s trove_recall 2