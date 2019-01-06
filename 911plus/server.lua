--config
local webhook = "" --modify, also set in your gateway config!
--Change the webhook address to your discord webhook address!
--end config

function process(statusCode, text, headers) end

RegisterCommand('911', function(source, args, raw)	
	local wh_content = "**New 911 Call!** ("..GetPlayerName(source)..")\n\n"..table.concat(args, " ")
	
	PerformHttpRequest(webhook, process, "POST", "content="..wh_content.."&tts=true")
	local msg = "Dispatcher Notified: "..table.concat(args, " ")		
	TriggerClientEvent("notify", source, msg)
end)

RegisterCommand('panic', function(source, args, raw)		
	local wh_content = "**Panic Button Pressed!** ("..GetPlayerName(source)..")\n\nLocation: "..table.concat(args, " ")
	
	PerformHttpRequest(webhook, process, "POST", "content="..wh_content.."&tts=true")
	local msg = "Panic Button Pressed"	
	TriggerClientEvent("notify", source, msg)
end)