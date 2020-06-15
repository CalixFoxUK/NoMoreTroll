--[[
	NoMoreTroll
	Version 1.0.0.2
	By CalixFoxUK
]]--

-- Presets for the script don't edit
NoMoreTroll.Client = {
	Admin = {
		Troll = nil,
		Return = nil
	},
	AmIFrozen = false,
	Heartbeat = true,
	Unarmed = GetHashKey("WEAPON_UNARMED"),
	Death = true
}

-- We wont include any functionanlity if the script is set to NoMoreTrolls.Enabled = false
if NoMoreTroll.Enabled then
	-- Was a tester function to learn what was going on created by CalixFoxUK without any aid
	RegisterNetEvent("nomoretroll:message")
	AddEventHandler("nomoretroll:message", function(t_message)
		if type(t_message) == "table" then
			TriggerEvent('chat:addMessage',{color = {255, 0, 0}, multiline = true, args = {t_message[1], t_message[2]}});
		end

	end)
	RegisterNetEvent("nomoretroll:triggerwarning")
	AddEventHandler("nomoretroll:triggerwarning", function(...)
		local arg = {...}
		NoMoreTroll.PrintMode(arg[1], arg[2]);
	end)
	-- Sets the TP details for the player
	RegisterNetEvent("nomoretroll:tpreturn")
	AddEventHandler("nomoretroll:tpreturn", function(t_message)
		NoMoreTroll.Client.Admin.Troll = t_message;
	end)
	-- About
	RegisterNetEvent("nomoretroll:about")
	AddEventHandler("nomoretroll:about", function()
		NoMoreTroll.PrintMode(false, 5);
	end)
	RegisterNetEvent("nomoretroll:tpjump")
	AddEventHandler("nomoretroll:tpjump", function(b_back)
		player_id = PlayerId();
		player_ped = GetPlayerPed(player_id);
		
		if NoMoreTroll.Client.Admin.Troll ~= nil or NoMoreTroll.Client.Admin.Return ~= nil then
			if NoMoreTroll.Client.Admin.Troll ~= nil then
				px, py, pz = table.unpack(NoMoreTroll.Client.Admin.Troll);
				NoMoreTroll.Client.Admin.Troll = nil;
				NoMoreTroll.Client.Admin.Return = GetEntityCoords(player_ped, true);
			else
				px, py, pz = table.unpack(NoMoreTroll.Client.Admin.Return);
				NoMoreTroll.Client.Admin.Return = nil;
			end
			SetEntityCoords(player_ped, px, py, pz, 0, 0, 0, false);
		else
			NoMoreTroll.PrintMode(false, 3)
		end	
	end)
	RegisterNetEvent("nomoretroll:freeze")
	AddEventHandler("nomoretroll:freeze", function(b_do, source)
		player_id = PlayerId();
		player_ped = GetPlayerPed(player_id);
		
		isDo = true;
		
		if type(b_do) == "boolean" then
			isDo = b_do;
		end
		
		if NoMoreTroll.Client.AmIFrozen then
			NoMoreTroll.Client.AmIFrozen = false;
			FreezeEntityPosition(player_ped, false);
			NoMoreTroll.PrintMode(false, 2)
		else
			if isDo then 
				NoMoreTroll.Client.AmIFrozen = true;
				NoMoreTroll.PrintMode(false, 1)
				SetCurrentPedWeapon(player_ped, NoMoreTroll.Client.Unarmed, true);
				BadBoyPed = GetEntityCoords(player_ped, true);
				TriggerServerEvent("nomoretroll:tpmsg", {BadBoyPed, source});
			end
			FreezeEntityPosition(player_ped, isDo);
		end
		
	end)

	Citizen.CreateThread(function()
		while true do
			Citizen.Wait(0);
			if NoMoreTroll.Client.AmIFrozen then
				NoMoreTroll.DoThis();
			end
		end
	end)
end

--This is just a helper function to move it out of the loop when we was testing.
function NoMoreTroll.DoThis()
	player_id = PlayerId();
	player_ped = GetPlayerPed(player_id);
	DisablePlayerFiring(player_ped, true);
	DisableAllControlActions(0);
	DisableAllControlActions(1);
	EnableControlAction(0, 200, true)--
	ClearPedTasksImmediately(player_ped);
	DisableControlAction(1, 140, true)
	DisableControlAction(1, 141, true)
	DisableControlAction(1, 142, true)
	SetPedPathCanUseLadders(player_ped, false)
	if IsPedInAnyVehicle(player_ped, false) then
		DisableControlAction(0, 59, true)
	end
	SetCurrentPedWeapon(player_ped, NoMoreTroll.Client.Unarmed, true);
	FreezeEntityPosition(player_ped, true);
end

function NoMoreTroll.PrintMode(b_warn, options)
	-- Checking if it's warn print or normal
	if b_warn then
		if NoMoreTroll.Ace.Warn.Enabled then
			if options == 1 then
				if NoMoreTroll.Ace.Warn.Mode == 3 then
					NoMoreTroll.Print(NoMoreTroll.Ace.Warn.CommandHead.Message, true, {NoMoreTroll.Ace.Warn.CommandHead.TextHead, NoMoreTroll.Ace.Warn.CommandHead.Title});
				end
				if NoMoreTroll.Ace.Warn.Mode == 2 then
					NoMoreTroll.Print(NoMoreTroll.Ace.Warn.CommandDialogError[1]);
					NoMoreTroll.Print(NoMoreTroll.Ace.Warn.CommandDialogError[2]);
				end
				if NoMoreTroll.Ace.Warn.Mode == 1 then
					TriggerEvent("chatMessage", NoMoreTroll.Ace.Warn.CommandChatError);
				end
			end
		end
	else
		if NoMoreTroll.Dialogs.Enabled then
			if options == 1 then
				if NoMoreTroll.Dialogs.Mode == 3 then
					NoMoreTroll.Print(NoMoreTroll.Dialogs.IsFrozenHead.Message, true, {NoMoreTroll.Dialogs.IsFrozenHead.TextHead, NoMoreTroll.Dialogs.IsFrozenHead.Title})
				end
				if NoMoreTroll.Dialogs.Mode == 2 then
					NoMoreTroll.Print(NoMoreTroll.Dialogs.IsFrozenDialog)
				end
				if NoMoreTroll.Dialogs.Mode == 1 then
					TriggerEvent("chatMessage", NoMoreTroll.Dialogs.IsFrozenChat);
				end
			end
			if options == 2 then
				if NoMoreTroll.Dialogs.Mode == 3 then
					NoMoreTroll.Print(NoMoreTroll.Dialogs.IsFreedHead.Message, true, {NoMoreTroll.Dialogs.IsFreedHead.TextHead, NoMoreTroll.Dialogs.IsFreedHead.Title})
				end			
				if NoMoreTroll.Dialogs.Mode == 2 then
					NoMoreTroll.Print(NoMoreTroll.Dialogs.IsFreedDialog);
				end
				if NoMoreTroll.Dialogs.Mode == 1 then
					TriggerEvent("chatMessage", NoMoreTroll.Dialogs.IsFreedChat);
				end
			end
			if options == 3 then
				if NoMoreTroll.Dialogs.Mode == 3 then
					NoMoreTroll.Print(NoMoreTroll.Dialogs.NoTrollHead.Message, true, {NoMoreTroll.Dialogs.NoTrollHead.TextHead, NoMoreTroll.Dialogs.NoTrollHead.Title});
				end
				if NoMoreTroll.Dialogs.Mode == 2 then
					NoMoreTroll.Print(NoMoreTroll.Dialogs.NoTrollDialog)
				end
				if NoMoreTroll.Dialogs.Mode == 1 then
					TriggerEvent("chatMessage", NoMoreTroll.Dialogs.NoTrollChat);
				end
			end
			if options == 4 then
				if NoMoreTroll.Dialogs.Mode == 3 then
					NoMoreTroll.Print(NoMoreTroll.Dialogs.WarnUserHead.Message, true, {NoMoreTroll.Dialogs.WarnUserHead.TextHead, NoMoreTroll.Dialogs.WarnUserHead.Title});
				end
				if NoMoreTroll.Dialogs.Mode == 2 then
					NoMoreTroll.Print(NoMoreTroll.Dialogs.WarnUserDialog[1]);
					NoMoreTroll.Print(NoMoreTroll.Dialogs.WarnUserDialog[2]);
				end
				if NoMoreTroll.Dialogs.Mode == 1 then
					TriggerEvent("chatMessage", NoMoreTroll.Dialogs.WarnUserChat);
				end		
			end
			if options == 5 then
				if NoMoreTroll.Dialogs.Mode == 3 then
				    local handle = RegisterPedheadshotTransparent(PlayerPedId())
					while not IsPedheadshotReady(handle) or not IsPedheadshotValid(handle) do
						Citizen.Wait(0)
					end
					local txd = GetPedheadshotTxdString(handle);
					NoMoreTroll.Print("~g~NoMoreTroll~w~: Stop your basic troll in there tracks, with our new anti Troll formula.", true, {txd, "NoMoreTroll"});
					NoMoreTroll.Print("Created by CalixFoxUK");
					UnregisterPedheadshot(handle)
				end
				if NoMoreTroll.Dialogs.Mode == 2 then
					NoMoreTroll.Print("~g~NoMoreTroll~w~: Stop your basic troll in there tracks,");
					NoMoreTroll.Print("with our new anti Troll formula. Created by CalixFoxUK");
				end
				if NoMoreTroll.Dialogs.Mode == 1 then
					TriggerEvent("chatMessage", "^3NoMoreTroll^0: Stop your basic troll in there tracks, with our new anti Troll formula. Created by CalixFoxUK");
				end		
			end
		end
	end
	
end

-- prints the message in game in the bottom left - This function as borrowed from CuffsUP by BadKaiPanda
function NoMoreTroll.Print(text_s, txt_b, options_t)
	SetNotificationTextEntry("STRING");
	AddTextComponentString(text_s)
	if txt_b then
		SetNotificationMessage(options_t[1], options_t[1], true, 4, sender, options_t[2], text_s)
	end
	DrawNotification(false, false)
end