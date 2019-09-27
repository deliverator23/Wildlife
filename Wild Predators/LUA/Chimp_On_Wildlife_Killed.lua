-----------------------------------------------
-- WILDLIFE FUNCTIONS
-----------------------------------------------

	print("Wildlife functions initialised...")

-----------------------------------------------
-- Constants
-----------------------------------------------

	local tUnits = {}
	for row in GameInfo.Units() do
		if row.Combat > 0 then
			tUnits[row.Index] = row.Combat
		end
	end

	local iPercent = 0.50 -- Percentage of killed unit's combat strength (1 = 100%)

-----------------------------------------------
-- OnWildlifeKilledInCombat
-----------------------------------------------

function OnWildlifeKilledInCombat ( killedPlayerID, killedUnitID, playerID, unitID )

	local pPlayer = Players[playerID]
	local pCities = pPlayer:GetCities()
	local pUnits = pPlayer:GetUnits()
	local pUnit = pPlayerUnits:FindID(unitID)
	
	local pWildlife = Players[killedPlayerID]
	local pWildlifeUnits = pWildlife:GetUnits()
	local pWildlifeUnit = pWildlifeUnits:FindID(unitID)
	
	local bIsMajor = pPlayer:IsMajor()
	if not (bIsMajor == 1) then return end -- check if major civ
	
	if pWildlifeUnit then
		local iStrength	= tUnits[pWildlifeUnit:GetType()] -- get wildlife strength
		if iStrength then -- validation check. Does the wildlife unit have combat strength?

			local iX, iY = pUnit:GetX(), pUnit:GetY() -- Use unit to determine plot coordinates
			local iCount = 0
			local pTargetCity
			local pTargetName
			local iShortestDistance = 1000 -- holder
			
			for k, pClosestCity in pCities:Members() do
				local iDistance = Map.GetPlotDistance(pClosestCity:GetX(), pClosestCity:GetY(), iX, iY) -- get distance to captured city
				if iDistance <= iShortestDistance then
					iShortestDistance = iDistance -- overwrite holder
					local iClosestCity = pClosestCity:GetID()
					pTargetCity = pCities:FindID(iClosestCity) -- overwrite variable with new city
					pTargetName = pTargetCity:GetName()
					iCount = iCount + 1
				end
			end
			
			if iCount > 1 then
				local pQueue = pTargetCity:GetBuildQueue()
				local iProduction = math.floor(iStrength * iPercent)
				pQueue:AddProgress(iProduction)
				
				local sCityName = Locale.Lookup(pTargetName) -- localised string for city name
				if pPlayer:IsHuman() then
					Game.AddWorldViewText(playerID, Locale.Lookup("[COLOR_FLOAT_FAITH]+{1_Num} [ICON_PRODUCTION] Production granted to " .. sCityName .. "[ENDCOLOR]", iProduction), iX, iY, 0)
				end
			end
		end
	end
end

Events.UnitKilledInCombat.Add ( OnWildlifeKilledInCombat );