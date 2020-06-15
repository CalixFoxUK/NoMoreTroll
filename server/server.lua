--[[
	NoMoreTroll
	Version 1.0.0.2
	By CalixFoxUK
]]--

-- Freeze command freeze {PlayerID} {true/false}
RegisterCommand("freeze", function(source, arg, raw)
	if source > 0 then
		pedfreeze = source;
		if type(raw) ~= "nil" then
			cl = stringsplit(raw, " ");
			if cl[1] == "freeze" then
				Can_Trigger = NoMoreTroll.CheckAce(source);
				
				if Can_Trigger then
					CancelEvent();
					isFreeze = true;
					if type(cl[2]) ~= "nil" then
						
						if tonumber(cl[2]) ~= nil then
							pedfreeze = cl[2];
						end
						
						if type(cl[3]) ~= "nil" and cl[3] == "false" then
							isFreeze = false;
						end
					end	
					TriggerClientEvent('nomoretroll:freeze', pedfreeze, isFreeze, source);
				else
					if NoMoreTroll.Ace.Warn.Enabled then
						CancelEvent();
						TriggerClientEvent("nomoretroll:triggerwarning", source, true, 1);
					end
				end
			end
		end
	else
		print("^2NoreMoreTroll^0: This function is for in-game admins, console admins will find it hard to talk and deal with users via console.");
	end
end, true)

-- Warn Command wt {PlayerID}
RegisterCommand("wt", function(source, arg, raw)
	pedfreeze = source;
	if type(raw) ~= "nil" then
		cl = stringsplit(raw, " ");
		if cl[1] == "wt" then
			Can_Trigger = NoMoreTroll.CheckAce(source);
			
			if Can_Trigger then
				CancelEvent();
				GrabCL = type(tonumber(cl[2]));
				if GrabCL == "number" then
					print("^2NoMoreTroll^0: A warning sent to "..GetPlayerName(tonumber(cl[2])).."("..cl[2]..")");
					TriggerClientEvent("nomoretroll:triggerwarning", tonumber(cl[2]), false, 4);
				end
			end
		end
	end
end, true);

-- This is the Telleport to Freeze player command /tpj and /tpj to return.
RegisterCommand("tpj", function(source, arg, raw)
	if source > 0 then
	pedfreeze = source;
	if type(raw) ~= "nil" then
		cl = stringsplit(raw, " ");
		if cl[1] == "tpj" then
			Can_Trigger = NoMoreTroll.CheckAce(source);
			
			if Can_Trigger then
				CancelEvent();
				TriggerClientEvent('nomoretroll:tpjump', pedfreeze);
			end
		end
	end
	else
		print("^2NoMoreTroll^0: You can't telleport the server to the player!");
	end
end, true);

-- About return
RegisterCommand("nomoretroll", function(source, arg, raw)
	pedfreeze = source;
	if type(raw) ~= "nil" then
		cl = stringsplit(raw, " ");
		if cl[1] == "nomoretroll" then
			Can_Trigger = NoMoreTroll.CheckAce(source);
			
			if Can_Trigger then
				CancelEvent();
				if pedfreeze > 0 then
					TriggerClientEvent('nomoretroll:about', pedfreeze, true);
				else
					print("^2NoMoreTroll^0:  Stop your basic troll in there tracks, with our new anti Troll formula.");
					print("^2NoMoreTroll^0:  Created by CalixFoxUK");
				end
			end
		end	
	end
end, true)

-- 
RegisterServerEvent("nomoretroll:tpmsg")
AddEventHandler("nomoretroll:tpmsg", function(t_stuff)
	TriggerClientEvent("nomoretroll:tpreturn", t_stuff[2], t_stuff[1])
end)

-- Use this option if NoMoreTroll.Ace.Enabled is true, if not it returns true.
function NoMoreTroll.CheckAce(source, trigger)
	-- Check if the source is nil
	if type(source) == "nil" then
		return false, true, "NoMoreTroll.CheckAce: bad argument #1 (number expected got nil)";
	end
	if source > 0 then
		if NoMoreTroll.Ace.Enabled then	
			return IsPlayerAceAllowed(source, "nomoretroll.admin"), false, "Passed";
		else
			-- If NoMoreTroll.Ace.Enabled in the config dose not = true we auto set this as true as all users have permissions.
			return true, false, "Passed";
		end
	else
		return true, false, "Passed"
	end
end

--helpingFunctions--
function stringsplit(inputstr, sep)
    if sep == nil then
        sep = "%s"
    end
    local t={} ; i=1
    for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
        t[i] = str
        i = i + 1
    end
    return t
end