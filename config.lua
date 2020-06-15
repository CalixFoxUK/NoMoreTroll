--[[
	NoMoreTroll
	Version 1.0.0.2
	By CalixFoxUK
]]--

NoMoreTroll = {
	-- This is the version of the script your running, I would advice you not changing this.
	Version = "1.0.0.2",
	-- This sets the language for the script, defined in Dialect/lang.lua file.(future maybe)
	Dialect = "en",
	-- Me the creater, please don't remove thanks :D(Big Smilly Face)
	Author = "CalixFoxUK",
	-- Enable/Disable This Script without removing it from server.cfg
	Enabled = true,
	-- This version of the Ace is now a extra step and you can leve this false if you want, it might be removed in a future
	-- version no you just need a admin with the command allow.
	Ace = {
		-- Enable/Disable the Ace support nomoretrol.admin add below to your server.cfg
		-- add_ace group.admin nomoretroll.admin allow # give admins script admins.
		-- in version 1.0.0.2 this becomes a sub group and you can enable this for extra level of admins
		Enabled = false,	
		-- In game dialogs related to Ace
		Warn = {
			-- Enable/Disable Warning to the end user.							
			Enabled = true,														
			-- The error show if Chat Mode used
			CommandChatError = "^System^0: We are sorry, while looking for your admin ID, we seemed to of washed it, access denied.",
			-- The error shown if Display Mode used
			CommandDialogError = { 
				"~r~System~w~: We are sorry, while looking for",
				"your admin ID, we seemed to of washed it, access denied."
			},
			CommandHead = {
				Title = "~o~System~w~: Admin",
				TextHead = "CHAR_BLOCKED", 		-- https://wiki.gtanet.work/index.php?title=Notification_Pictures More heads here.
				Message = "We are sorry, while looking for your admin ID, we seemed to of washed it, access denied."
			},
			-- 0 = Mute, 1 = Chat, 2 = Dialog, 3 = TextHead(Shows like a GTA text message)
			Mode = 3																	
		}
	},
	-- In game related dialongs not linked to Ace
	Dialogs = {
		-- Enable/Disable Dialogs to the end user.
		Enabled = true,
		-- This is the message shown to a frozen player if Chat Mode is enabled
		IsFrozenChat = "^1Admin^0: We are on our way, please stand by.",
		-- This is the message shown to a frozen player if Dialog Mode is enabled
		IsFrozenDialog = "~r~Admin~w~: We are on our way, please stand by.",
		-- This is the message that shows up like a text message for frozen if Mode 3 is enabled
		IsFrozenHead = {
			Title = "~r~Admin~w~: Information",
			TextHead = "CHAR_BLOCKED", 		-- https://wiki.gtanet.work/index.php?title=Notification_Pictures More heads here.
			Message = "We are on our way, please stand by."			
		},
		-- This is the message shown to the frozen user when freed if Chat Mode is enabled
		IsFreedChat = "^1Admin^0: Your free to play.",
		-- This is the message shown to the frozen user when freed if Dialog Mode is enabled
		IsFreedDialog = "~r~Admin~w~: Your free to play.",
		-- This is the message that shows up like a text message for freed if Mode 3 is enabled
		IsFreedHead = {
			Title = "~r~Admin~w~: Information",
			TextHead = "CHAR_BLOCKED", 		-- https://wiki.gtanet.work/index.php?title=Notification_Pictures More heads here.
			Message = "Your free to play."	
		},
		-- This is the message printed to the admin you can't tp to the frozen player if Chat Mode is enabled
		NoTrollChat = "^1Admin^0: No Troll found, have your frozen them?",
		-- This is the message printed to the admin you can't tp to the frozen player if Dialog Mode is enabled
		NoTrollDialog = "~r~Admin~w~: No Troll found, have your frozen them?",
		-- This is the message printed to the admin you can't tp to the frozen player if Mode 3 is enabled
		NoTrollHead = {
			Title = "~r~Admin~w~: Information",
			TextHead = "CHAR_BLOCKED", 		-- https://wiki.gtanet.work/index.php?title=Notification_Pictures More heads here.
			Message = "No Troll found, have your frozen them?"			
		},
		WarnUserChat = "^1Admin^0: We have had reports that you might be trolling or breaking server rules if so PLEASE stop!",
		WarnUserDialog = {
			"~r~Admin~w~: We have had reports that you might be",
			"~w~trolling or breaking server rules if so PLEASE stop!"
		},
		WarnUserHead = {
			Title = "~r~Admin~w~: Warning",
			TextHead = "CHAR_BLOCKED", 		-- https://wiki.gtanet.work/index.php?title=Notification_Pictures More heads here.
			Message = "We have had reports that you might be trolling or breaking server rules if so PLEASE stop!"
		},
		-- 0 = Mute, 1 = Chat, 2 = Dialog, 3 = TextHead(Shows like a GTA text message)
		Mode = 3																		
	}
}

--- This script was created by CalixFoxUK but helped alot by BadKaiPanda, we are not the same people please view this image below to see the team.
--- https://i.imgur.com/jzedkJg.jpg