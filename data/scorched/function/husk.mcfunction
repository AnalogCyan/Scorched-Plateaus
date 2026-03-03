execute as @e[type=minecraft:zombie] at @s run summon minecraft:husk ~ ~ ~
execute as @e[type=minecraft:zombie] run data merge entity @s {DeathLootTable:"minecraft:empty",drop_chances:{}}
kill @e[type=minecraft:zombie]
