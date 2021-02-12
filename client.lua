function SetGuarmaWorldhorizonActive(toggle)
	Citizen.InvokeNative(0x74E2261D2A66849A , toggle)
end

function SetWorldWaterType(waterType)
	Citizen.InvokeNative(0xE8770EE02AEE45C2, waterType)
end

function SetWorldMapType(mapType)
	Citizen.InvokeNative(0xA657EC9DBC6CC900, mapType)
end

function IsInGuarma()
	local x, y, z = table.unpack(GetEntityCoords(PlayerPedId()))
	return x >= 0 and y <= -4096
end

local GuarmaMode = false

CreateThread(function()
	while true do
		Wait(500)

		if IsInGuarma() then
			if not GuarmaMode then
				SetGuarmaWorldhorizonActive(true);
				SetWorldWaterType(1);
				SetWorldMapType(`guarma`)
				GuarmaMode = true
			end
		else
			if GuarmaMode then
				SetGuarmaWorldhorizonActive(false);
				SetWorldWaterType(0);
				SetWorldMapType(`world`)
				GuarmaMode = false
			end
		end
	end
end)
