--[[
	NoMoreTroll
	Version 1.0.0.1
	By CalixFoxUK
]]--

AddEventHandler('chatMessage', function(source, name, raw)
	pedfreeze = source;
	if type(raw) ~= "nil" then
		cl = stringsplit(raw, " ");
		if cl[1] == "/freeze" then
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
		-- Warn users
		if cl[1] == "/wt" then
			Can_Trigger = NoMoreTroll.CheckAce(source);
			
			if Can_Trigger then
				CancelEvent();
				GrabCL = type(tonumber(cl[2]));
				if GrabCL == "number" then
					TriggerClientEvent("nomoretroll:triggerwarning", tonumber(cl[2]), false, 4);
				end	
			end
		end
		-- TP to the player
		if cl[1] == "/tpj" then
			Can_Trigger = NoMoreTroll.CheckAce(source);
			
			if Can_Trigger then
				CancelEvent();
				TriggerClientEvent('nomoretroll:tpjump', pedfreeze);
			end
		end
		-- coming soon
		if cl[1] == "/nomoretroll" then
			Can_Trigger = NoMoreTroll.CheckAce(source);
			
			if Can_Trigger then
				CancelEvent();
				TriggerClientEvent('nomoretroll:about', pedfreeze, true);
			end
		end	
	end
	
end)

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
	if NoMoreTroll.Ace.Enabled then	
		return IsPlayerAceAllowed(source, "nomoretroll.admin"), false, "Passed";
	else
		-- If NoMoreTroll.Ace.Enabled in the config dose not = true we auto set this as true as all users have permissions.
		return true, false, "Passed";
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