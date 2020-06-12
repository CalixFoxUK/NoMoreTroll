--[[
	NoMoreRun
	Version 0.0.1
	By CalixFoxUK
]]--

AddEventHandler('chatMessage', function(source, name, raw)
	pedfreeze = source;
	if type(raw) ~= "nil" then
		cl = stringsplit(raw, " ");
		if cl[1] == "/freeze" then
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
			TriggerClientEvent('nomoretrolls:freeze', pedfreeze, isFreeze, source);
		end
		if cl[1] == "/tpj" then
			CancelEvent();
			TriggerClientEvent('nomoretrolls:tpjump', pedfreeze);
		end
		if cl[1] == "/tpr" then
			CancelEvent();
			TriggerClientEvent('nomoretrolls:tpjump', pedfreeze, true);
		end	
		if cl[1] == "/nomoretrolls" then
			CancelEvent();
			TriggerClientEvent('nomoretrolls:about', pedfreeze, true);
		end	
	end
	
end)

RegisterServerEvent("nomoretrolls:tpmsg")
AddEventHandler("nomoretrolls:tpmsg", function(t_stuff)

	TriggerClientEvent("nomoretrolls:tpreturn", t_stuff[2], t_stuff[1])

end)

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