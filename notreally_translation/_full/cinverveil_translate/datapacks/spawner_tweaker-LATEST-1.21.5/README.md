This datapack is currently a work in progress for 1.21.5. For legacy versions and backports, view branches on the repository.<br>
**NOTE:** If your map was 1.21.4 or below and used Spawner Tweaker, you will need to re-register spawners or update most ids due to major minecraft nbt reworks. When re-registering, use these commands to reset the data storage:<br>
`/data remove storage spawner_tweaker:temp Ids`<br>
`/data remove storage spawner_tweaker:temp Spawners`<br>

## How To Use
Look at a spawner with a spawner in your hand to open its settings & info. Right or left click to modify values, shift right or left click to scroll through the menu. <br>

Holding down shift allows placing spawners without pulling up the tweaking menu. Looking at a new spawner while tweaking for a full second will switch the selection. Selecting another spawner while holding sift will allow you to select mutltiple spawners to edit at once. <br>

### Bulk Editing
Any spawner you interact with will be registered in storage and assigned an id. Spawner ids are linked to their spawnpotentials, so multiple spawners can share the same id.<br>

You can prime all registered spawners using `/trigger prime_spawners set <ticks>` This works accross dimensions.<br>

If you want to bulk edit spawners of a specific id, modify that spawner in your world (by placing a new one in the same spot, or by using /data modify), then select it with spawner tweaker. You will be prompted on how you would like to bulk edit spawners that share the same id. Please make sure to place modified spawners on the same block, or else it will be registered as a new id.<br>

Alternatively, drop your spawner while tweaking the spawner you wish to modify. This will always force the menu open, along with providing options to highlight spawners and transform spawners into the held spawner's id.<br>

**Bulk-editing spawners with multiple SpawnPotentials will always choose a random SpawnPotential for each spawner's SpawnData, ignoring weights*<br>

### Main Options
`/trigger toggle_spawner_tweaker`<br>
Enables/disables spawner tweaker for you (default is on)<br>
`/trigger toggle_piercing_spawner_tweaker`<br>
Toggles if spawner tweaker's raycast halts when hitting solid blocks (default is piercing)<br>
`/trigger give_spawner set <id>`<br>
Gives you a placable spawner<br>
`/trigger give_all_spawners`<br>
Generates barrels beneath you containing a spawner for each registered spawner id<br>
`/trigger delete_spawner_id set <id>`<br>
Removes a spawner's id and any corresponding spawner locations under that id<br>
`/trigger highlight_spawners set <ticks>`<br>
Highlights all loaded spawners for a certain number of ticks<br>
`/scoreboard players set $search_range spawner_tweaker <range>`<br>
Default of 6, max of 15, cubical range to passively register spawners and containers in, with negative numbers being none (ex. 10 would search a 20x20x20 sized cube centered on where creative mode players are looking at)<br>
`/trigger search_volume`<br>
Pulls up a menu for checking an area for unregistered spawners<br>
`/scoreboard players set $modification_limit spawner_tweaker <spawners/tick>`<br>
Default of 20, how many spawners to attempt to modify each tick with priming/bulk edit<br>

### Niche Options
`/scoreboard players set $highlight_id spawner_tweaker <id>`<br>
Default of -1 (meaning any id), resets on reload. Only shows spawners with this id when triggering spawner highlights.<br>
`/scoreboard players set $prime_range spawner_tweaker <range>`<br>
Default of -1, cubical range to prime or update spawners in, with negative numbers being infinite (ex. 100 would be a 200 sized cube centered on the player)<br>
`/scoreboard players set $reselect_ticks spawner_tweaker <ticks>`<br>
Default of 20, minimum of 1. How many ticks it takes for tweaker to select a new spawner<br>
`/execute positioned <x> <y> <z> run function spawner_tweaker:bulk_edit/trigger_update`<br>
Forces an id update for the spawner at that location (updates SpawnPotentials for that id)<br>
`/execute positioned <x> <y> <z> run function spawner_tweaker:bulk_edit/trigger_bse`<br>
Forces a bulk spawner edit for the spawner at that location (updates all spawner attributes for that id)<br>
`/tag @s add st_reset_settings`<br>
This tag will always set the setting to Player Range when re-entering tweaking mode (default off)<br>
`/scoreboard players set $efficient_data spawner_tweaker 1`<br>
1 or 0, default 1. Wheather or not to delete unnecessary data in spawners when priming. Useful for reducing lag when publishing maps.<br>
`/scoreboard players set $data_population spawner_tweaker 1`<br>
1 or 0, default 1. Wheather or not to populate spawner data when priming/bulk editing; no mob will appear in the spawner until a player gets in range, useful if you use weights or want this effect.<br>

### Spawner and Chest Randomizer
**ALWAYS MAKE BACKUPS WHEN USING RANDOMIZERS**<br>
Spawner Tweaker comes with randomizer capabilities. Randomized spawners have their potentials and SpawnData randomized, but not other aspects such as player range, delay, and count. Container (chest) randomization swaps the contents or loot tables of all registered containers. Containers register into the system just as spawners do--either passively while looking around or by running volume checks.<br>
Before using the randomizer, make sure you first:<br>
* Remove problematic spawners (such as anti-cheese or potion) with `/trigger delete_spawner_id set <id>`, see all map spawners with `/trigger give_all_spawners`
* Remove problematic chests (such as dev chests and fleecy boxes) with `/trigger delete_nearby_chests set <range>`<br>

You may now run the chest and spawner randomizer functions.<br>

`/scoreboard players set $randomizer_seed spawner_tweaker x`<br>
Sets the seed for the randomizer. If unassigned, a random seed will be chosen.<br>
`/function spawner_tweaker:randomizer/randomize_equally`<br>
Each spawner will choose a random id with equal probability.<br>
`/function spawner_tweaker:randomizer/randomize_weighted`<br>
Spawners in the map will be randomized, but keep their id distribution (so if your original map has 5 skeleton and 10 zombie spawners, the randomizer will have 5 sekeleton and 10 zombie spawners total).<br>
`/function spawner_tweaker:chests/randomizer/randomize`<br>
Randomizes all loot containers in the map (a loot container is any chest, barrel, or shulker that has items or a loot table)<br>
`/trigger delete_nearby_chests set <range>`<br>
Cubical range centered on yourself to remove chests from the chest id system. Use this to clear out chests inside of dev rooms or ones you always want to generate in the same spot.<br>

Known limitations:<br>
Randomized containers that had loot tables will cause block updates. This is because mojang doesn't allow /data remove on block loot tables.<br>

### Reuse and Contact
Feel free to use, modify, and distribute. This datapack is by link2012.<br>
Latest version at https://github.com/the-link2012/spawner_tweaker<br>
The pack is low impact so it is fine to keep in published maps.

For bugs, feedback, and update requests please message @link2012 on discord