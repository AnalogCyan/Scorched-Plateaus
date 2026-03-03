function scorched:husk

# First-join welcome effects (per-player, multiplayer-safe)
scoreboard players add @a scorched.welcomed 0
execute as @a[scores={scorched.welcomed=0}] run effect give @s minecraft:regeneration 10 1 true
execute as @a[scores={scorched.welcomed=0}] run effect give @s minecraft:saturation 10 1 true
execute as @a[scores={scorched.welcomed=0}] run effect give @s minecraft:darkness 10 0 true
execute as @a[scores={scorched.welcomed=0}] run effect give @s minecraft:fire_resistance 10 0 true
execute as @a[scores={scorched.welcomed=0}] run effect give @s minecraft:mining_fatigue 10 255 true
execute as @a[scores={scorched.welcomed=0}] at @s run setblock ~ ~ ~ minecraft:fire
execute as @a[scores={scorched.welcomed=0}] run scoreboard players set @s scorched.fire_timer 40
execute as @a[scores={scorched.welcomed=0}] run title @s times 10 200 30
execute as @a[scores={scorched.welcomed=0}] run title @s title {"text":"Scorched Plateaus","color":"#FF8C42"}
execute as @a[scores={scorched.welcomed=0}] run title @s subtitle {"text":"you awaken to a parched land...","color":"#FFCF99","italic":true}
execute as @a[scores={scorched.welcomed=0}] run scoreboard players set @s scorched.welcomed 1

# Remove fire block after 2s (long enough to catch the player)
scoreboard players remove @a[scores={scorched.fire_timer=1..}] scorched.fire_timer 1
execute as @a[scores={scorched.fire_timer=0}] at @s if block ~ ~ ~ minecraft:fire run setblock ~ ~ ~ minecraft:air
execute as @a[scores={scorched.fire_timer=0}] run scoreboard players set @s scorched.fire_timer -1
