--[[
	NoMoreTrolls
	Version 1.0.0.0
	By CalixFoxUK
]]--

-- Presets for the script don't edit
NoMoreTrolls.Client = {
	Admin = {
		Troll = nil,
		Return = nil
	},
	AmIFrozen = false,
	Heartbeat = true,
	Unarmed = GetHashKey("WEAPON_UNARMED");
	Death = true;
}

-- We wont include any functionanlity if the script is set to NoMoreTrolls.Enabled = false
if NoMoreTrolls.Enabled then
	RegisterNetEvent("nomoretrolls:message")
	AddEventHandler("nomoretrolls:message", function(t_message)
		
		if type(t_message) == "table" then
			TriggerEvent('chat:addMessage',{color = {255, 0, 0}, multiline = true, args = {t_message[1], t_message[2]}});
		end

	end)
	RegisterNetEvent("nomoretrolls:tpreturn")
	AddEventHandler("nomoretrolls:tpreturn", function(t_message)
		a, b,c = table.unpack(t_message);
		NoMoreTrolls.Client.Admin.Troll = t_message;
		
	end)
	RegisterNetEvent("nomoretrolls:tpjump")
	AddEventHandler("nomoretrolls:tpjump", function(b_back)
		player_id = PlayerId();
		player_ped = GetPlayerPed(player_id);
		
		if NoMoreTrolls.Client.Admin.Troll ~= nil or NoMoreTrolls.Client.Admin.Return ~= nil then
			if NoMoreTrolls.Client.Admin.Troll ~= nil then
				px, py, pz = table.unpack(NoMoreTrolls.Client.Admin.Troll);
				NoMoreTrolls.Client.Admin.Troll = nil;
				NoMoreTrolls.Client.Admin.Return = GetEntityCoords(player_ped, true);
			else
				px, py, pz = table.unpack(NoMoreTrolls.Client.Admin.Return);
				NoMoreTrolls.Client.Admin.Return = nil;
			end
			SetEntityCoords(player_ped, px, py, pz, 0, 0, 0, false);
		else
			NoMoreTrolls.Print("~r~Admin~w~: No Troll found, have your frozen them?");
		end	
	end)
	RegisterNetEvent("nomoretrolls:freeze")
	AddEventHandler("nomoretrolls:freeze", function(b_do, source)
		player_id = PlayerId();
		player_ped = GetPlayerPed(player_id);
		
		isDo = true;
		
		if type(b_do) == "boolean" then
			isDo = b_do;
		end
		
		if NoMoreTrolls.Client.AmIFrozen then
			NoMoreTrolls.Client.AmIFrozen = false;
			FreezeEntityPosition(player_ped, false);
			NoMoreTrolls.Print("~r~Admin~w~: Your free to play.");
		else
			if isDo then 
				NoMoreTrolls.Client.AmIFrozen = true;
				NoMoreTrolls.Print("~r~Admin~w~: We are on our way, please stand by.");
				SetCurrentPedWeapon(player_ped, NoMoreTrolls.Client.Unarmed, true);
				BadBoyPed = GetEntityCoords(player_ped, true);
				TriggerServerEvent("nomoretrolls:tpmsg", {BadBoyPed, source});
			end
			FreezeEntityPosition(player_ped, isDo);
		end
		
	end)

	Citizen.CreateThread(function()
		while true do
			Citizen.Wait(0);
			if NoMoreTrolls.Client.AmIFrozen then
				NoMoreTrolls.DoThis();
			end
		end
	end)
end

--This is just a helper function to move it out of the loop when we was testing.
function NoMoreTrolls.DoThis()
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
	SetCurrentPedWeapon(player_ped, NoMoreTrolls.Client.Unarmed, true);
	FreezeEntityPosition(player_ped, true);
end

-- prints the message in game in the bottom left
function NoMoreTrolls.Print(text_s, txt_b, options_t)
	SetNotificationTextEntry("STRING");
	AddTextComponentString(text_s)
	if txt_b then
		SetNotificationMessage(options_t[1], icon, true, 4, sender, title, text)
	end
	DrawNotification(false, false)
end