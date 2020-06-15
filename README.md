![image](https://repository-images.githubusercontent.com/271748811/d745c580-ac95-11ea-854d-7fc66c890cbf)

# NoMoreTroll
A fun little Freeze and tp mod for admins.

### Install:
Click the clone or download button and click download **zip**, once downloaded unzip the file and rename NoMoreTroll-master to NoMoreTroll and put this within your resource folder of your FiveM server.

To be able to use it all the time, open up your **server.cfg** and add **ensure NoMoreTroll** to the list of ensures, if you only want to use this script now and then and don't want it in your **server.cfg** then in game or via the server control type **refresh**(server/F8) or **/refresh** via the chat this will get the server to find the new files, then do **start NoMoreTroll** or **/start NoMoreTroll** from the chat.

### Adding Ace Support:
The Ace is now a extra level of admin support, as long as your admins have command allow in the admin command list you
don't need to do anything else
Commands if you want to split them up

* **command.freeze**		-- to freeze the player
* **command.wt**		-- to be able to warn a player.
* **command.tpj** 		-- your admins will need this to tp to the frozen player
* **command.nomoretroll**  	-- So your admins can check the about, don't give this to normal users you don't want to let them know what scripts your running.

Commands what support console don't do a Ace check as the server don't need it.

The old Ace check is still in place so you can also make sure your admins have the nomoretroll.admin level

To enable select admins to use this script only add the below ace command to your user ace's in your **server.cfg** file

```
add_principal identifier.steam:110000000000000 nomoretroll.admin 			# give admins script admins.
```
replace **identifier.steam:110000000000000** with there steam id

Then in your resource/{path}/NoMoreTroll open up the **config.lua** file and change the Ace Enabled option from false
to true, you can see this below.

```lua
	-- This version of the Ace is now a extra step and you can leve this false if you want, it might be removed in a future
	-- version no you just need a admin with the command allow.
	Ace = {
		-- Enable/Disable the Ace support nomoretrol.admin add below to your server.cfg
		-- add_ace group.admin nomoretroll.admin allow # give admins script admins.
		-- in version 1.0.0.2 this becomes a sub group and you can enable this for extra level of admins
		Enabled = false,	
```

to

```lua
	-- This version of the Ace is now a extra step and you can leve this false if you want, it might be removed in a future
	-- version no you just need a admin with the command allow.
	Ace = {
		-- Enable/Disable the Ace support nomoretrol.admin add below to your server.cfg
		-- add_ace group.admin nomoretroll.admin allow # give admins script admins.
		-- in version 1.0.0.2 this becomes a sub group and you can enable this for extra level of admins
		Enabled = true,	
```

### How to use:
In-game you can do **/freeze PLAYERSERVERID true** or **false**, if you do **/freeze PLAYERSERVERID true** then **/tpj** it will TP you to that player, once you have dealt with the problem you can unfreeze them or do whatever you need to then do **/tpj** to return to where you was before. **/nomoretroll** will show our basic about dialog and if you would like to warn a user before having to freeze them you can do **/wt PLAYERSERVERID** then it will send a warning saying you have reports of them been a troll or breaking rules and ask them to stop.

**Commands that work server side**:
* **wt PlayerID** - just like you would in game but without the /
* **nomoretroll** - just the about dialog


### Can I use this script:
Yes please feel free to fork it as much and has hard as you like, this is under the WTFPL
