local GuarmaMode = false

function SetGuarmaWorldhorizonActive(toggle)
	Citizen.InvokeNative(0x74E2261D2A66849A , toggle)
end

function SetWorldWaterType(waterType)
	Citizen.InvokeNative(0xE8770EE02AEE45C2, waterType)
end

function IsInGuarma()
	local x, y, z = table.unpack(GetEntityCoords(PlayerPedId()))
	return x >= 500 and y <= 4100
end

CreateThread(function()
	while true do
		Wait(0)

		if IsInGuarma() and not GuarmaMode then
			print('Entered Guarma')
			SetGuarmaWorldhorizonActive(true);
			SetWorldWaterType(1);
			GuarmaMode = true
		elseif GuarmaMode then
			print('Exited Guarma')
			SetGuarmaWorldhorizonActive(false);
			SetWorldWaterType(0);
			GuarmaMode = false
		end
	end
end)
