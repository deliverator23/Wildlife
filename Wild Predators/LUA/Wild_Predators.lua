function tablelength(T)
    local count = 0
    for _ in pairs(T) do count = count + 1 end
    return count
end

function getindexatpos(tab, sp)
    local p = 1
    local si
    for i, e in pairs(tab) do
        if p == sp then
            si = i
            break
        end
        p = p + 1
    end
    return si
end

function getelementatpos(tab, sp)
    return tab[getindexatpos(tab, sp)]
end

function has_value(tab, val)
    for index, value in ipairs(tab) do
        if value == val then
            return true
        end
    end
    return false
end

function GetValidPlotsFromPlotIndexTable(tTable, canSpawnWithinTerritory)
    local tNewTable = {}
    local iCount = 1
    for i, iPlotIndex in ipairs(tTable) do
        local pPlot = Map.GetPlotByIndex(iPlotIndex)
        if (pPlot ~= nil) then
            local iPlotX, iPlotY = pPlot:GetX(), pPlot:GetY()
            if (pPlot:GetOwner() == -1 or canSpawnWithinTerritory) and (pPlot:IsMountain() == false) and (pPlot:IsWater() == false) and (pPlot:IsNaturalWonder() == false) and (pPlot:IsImpassable() == false) and (pPlot:IsCity() == false) then
                local bPlotHasUnit = false
                local unitList :table = Units.GetUnitsInPlotLayerID(iPlotX, iPlotY, MapLayers.ANY)
                if unitList ~= nil then
                    for i, pUnit in ipairs(unitList) do
                        local tUnitDetails = GameInfo.Units[pUnit:GetType()]
                        if tUnitDetails ~= nil then
                            if not pUnit:IsDead() and not pUnit:IsDelayedDeath() then
                                bPlotHasUnit = true
                                break
                            end
                        end
                    end
                end
                if (bPlotHasUnit == false) then
                    tNewTable[iCount] = pPlot
                    iCount = iCount + 1
                end
            end
        end
    end
    return tNewTable
end

local tBaseContinents = {
    "CONTINENT_AFRICA",
    "CONTINENT_EUROPE",
    "CONTINENT_NORTH_AMERICA",
    "CONTINENT_SOUTH_AMERICA",
    "CONTINENT_ASIA",
    "CONTINENT_OCEANIA"
}

local m_ContinentToBaseContinent
local m_ContinentPlots
local m_BaseContinentSumRandomSize

-- Higher = more animals, lower = less animals
local masterProbabilityAdjustment = 0.5;

function WildPredators(iPlayer)

    local tContinents = Map.GetContinentsInUse()

    if m_BaseContinentSumRandomSize == nil then
        m_BaseContinentSumRandomSize = {}
		for currentEra in GameInfo.Eras() do
            for unitSpawnContinent in GameInfo.UnitSpawnContinents() do
                local currentEraType = currentEra.EraType
				
                if m_BaseContinentSumRandomSize[unitSpawnContinent.ContinentType] == nil then
                    m_BaseContinentSumRandomSize[unitSpawnContinent.ContinentType] = {}
                end

                if m_BaseContinentSumRandomSize[unitSpawnContinent.ContinentType][currentEraType] == nil then
                    m_BaseContinentSumRandomSize[unitSpawnContinent.ContinentType][currentEraType] = 0
                end

                if UnitCanSpawnInEra(unitSpawnContinent.UnitType, currentEraType) then
                    local current_sum = m_BaseContinentSumRandomSize[unitSpawnContinent.ContinentType][currentEraType]
                    m_BaseContinentSumRandomSize[unitSpawnContinent.ContinentType][currentEraType] = current_sum + unitSpawnContinent.RandomSize
                end
            end
        end
    end

    if m_ContinentToBaseContinent == nil then
        m_ContinentToBaseContinent = {}
        m_ContinentPlots = {}
        local tCurrentContinentPool = tBaseContinents

        for ci, iContinent in ipairs(tContinents) do

            for bi, baseContinent in ipairs(tCurrentContinentPool) do
                if GameInfo.Continents[iContinent].ContinentType == baseContinent then
                    m_ContinentToBaseContinent[iContinent] = baseContinent
                end
            end

            if m_ContinentToBaseContinent[iContinent] == nil then
                local selContinentId = math.random(#tCurrentContinentPool)
                m_ContinentToBaseContinent[iContinent] = tCurrentContinentPool[selContinentId]
                table.remove(tCurrentContinentPool, selContinentId)
            end

            if #tCurrentContinentPool == 0 then
                tCurrentContinentPool = tBaseContinents
            end

            local eligiblePlots = GetValidPlotsFromPlotIndexTable(Map.GetContinentPlots(iContinent))
            m_ContinentPlots[iContinent] = tablelength(eligiblePlots)

            print(GameInfo.Continents[iContinent].ContinentType .. " assigned to " .. m_ContinentToBaseContinent[iContinent] .. ", plots: " .. m_ContinentPlots[iContinent])
        end
    end

    if PlayerConfigurations[iPlayer]:GetCivilizationTypeName() == "CIVILIZATION_BARBARIAN" then

        local pPlayer = Players[iPlayer]
        math.randomseed(os.time()) --set seed for rng
        for i = 1, 4 do math.random() end --extra math.randoms to progress the seed and provide a greater degree of randomness

        for ci, iContinent in ipairs(tContinents) do

            local spawningRuleContinent = m_ContinentToBaseContinent[iContinent]
            local spawnedPlots = {}

            for unitSpawnContinent in GameInfo.UnitSpawnContinents() do

                local canSpawnWithinTerritory = false
                for item in GameInfo.TypeTags() do
                    if item.Type == unitSpawnContinent.UnitType then
                        if item.Tag == 'CLASS_SPAWN_ANYWHERE' then
                            canSpawnWithinTerritory = true
                            break
                        end
                    end
                end

                local eligiblePlots = GetValidPlotsFromPlotIndexTable(Map.GetContinentPlots(iContinent), canSpawnWithinTerritory)
                local currentEra = GameInfo.Eras[Game.GetEras():GetCurrentEra()].EraType

                if eligiblePlots ~= nil and tablelength(eligiblePlots) > 0 and UnitCanSpawnInEra(unitSpawnContinent.UnitType, currentEra) and unitSpawnContinent.ContinentType == spawningRuleContinent then

                    local continentPlots = m_ContinentPlots[iContinent]
                    local continentRandomSumSize = m_BaseContinentSumRandomSize[m_ContinentToBaseContinent[iContinent]][currentEra]
                    local randomSize = math.floor(unitSpawnContinent.RandomSize * continentRandomSumSize / continentPlots / masterProbabilityAdjustment)
					
                    print(GameInfo.Continents[iContinent].ContinentType .. " " .. spawningRuleContinent .. " " .. unitSpawnContinent.UnitType .. " random size: " .. randomSize .. " = " .. unitSpawnContinent.RandomSize .. " * " .. continentRandomSumSize .. " / " .. continentPlots .. " / " .. masterProbabilityAdjustment)

                    if math.random(randomSize) == 1 then

                        -- Remove ineligible plots
                        for currentPlotIndex, currentPlot in pairs(eligiblePlots) do

                            local canSpawn = false

                            for unitSpawnTerrain in GameInfo.UnitSpawnTerrains() do
                                if currentPlot:GetTerrainType() == GameInfo.Terrains[unitSpawnTerrain.TerrainType].Index and unitSpawnContinent.UnitType == unitSpawnTerrain.UnitType then
                                    canSpawn = true
                                end
                            end

                            for unitSpawnFeature in GameInfo.UnitSpawnFeatures() do
                                if currentPlot:GetFeatureType() > -1 then
                                    if currentPlot:GetFeatureType() == GameInfo.Features[unitSpawnFeature.FeatureType].Index and unitSpawnContinent.UnitType == unitSpawnFeature.UnitType then
                                        canSpawn = true
                                    end
                                end
                            end

                            for si, spawnedPlot in pairs(spawnedPlots) do
                                if spawnedPlot:GetX() == currentPlot:GetX() and spawnedPlot:GetY() == currentPlot:GetY() then
                                    canSpawn = false
                                end
                            end

                            if (not canSpawn) then
                                eligiblePlots[currentPlotIndex] = nil
                            end
                        end

                        print("Found eligible tiles: " .. GameInfo.Continents[iContinent].ContinentType .. " " .. spawningRuleContinent .. " " .. unitSpawnContinent.UnitType .. " num of eligible plots:" .. tablelength(eligiblePlots) .. " num of spawned plots:" .. tablelength(spawnedPlots))

                        -- Randomly select from eligible plots and spawn unit
                        local iNumEligiblePlots = tablelength(eligiblePlots)
                        if iNumEligiblePlots > 0 then
                            local iRandomEligiblePlotsPosition = math.random(iNumEligiblePlots)
                            local spawnPlot = getelementatpos(eligiblePlots, iRandomEligiblePlotsPosition)

                            local spawnPlotTerrain = GameInfo.Terrains[spawnPlot:GetTerrainType()].TerrainType
                            local spawnPlotFeature = "NO_FEATURE"
                            if spawnPlot:GetFeatureType() >= 0 then
                                spawnPlotFeature = GameInfo.Features[spawnPlot:GetFeatureType()].FeatureType
                            end

                            print("spawning...")
                            print(unitSpawnContinent.UnitType .. " " .. GameInfo.Continents[iContinent].ContinentType .. " " .. unitSpawnContinent.ContinentType .. " " .. spawnPlotTerrain .. " " .. spawnPlotFeature)
                            local pUnits = pPlayer:GetUnits()
                            pUnits:Create(GameInfo.Units[unitSpawnContinent.UnitType].Index, spawnPlot:GetX(), spawnPlot:GetY())
                            table.insert(spawnedPlots, spawnPlot)
                        end
                    end
                end
            end
        end
    end
end

GameEvents.PlayerTurnStarted.Add(WildPredators)

local iNumberUnitsToSpawnPerTurn = 1
-- specify the basic target number of ocean units to spawn each turn
-- this will be the number spawned each turn until the limit of alive animals is reached
local iTargetNumberOceanPlotsPerAnimal = 140
--this is the target number of ocean plots needed per sea animal
--adjust as needed for enough but not too many ocean animals
local tOceanPlots, iNumberOceanPlots, bNoMoreSeaUnitsCanBeSpawned = {}, 1, true
local iOceanTile = GameInfo.Terrains["TERRAIN_OCEAN"].Index

for i = 0, Map.GetPlotCount() - 1, 1 do
    local pPlot = Map.GetPlotByIndex(i);
    if (pPlot ~= nil) and (pPlot:GetTerrainType() == iOceanTile) and (pPlot:GetOwner() == -1) and (pPlot:IsNaturalWonder() == false) then
        tOceanPlots[iNumberOceanPlots] = i
        iNumberOceanPlots = iNumberOceanPlots + 1
        bNoMoreSeaUnitsCanBeSpawned = false
    end
end

local tSpawnableOceanUnits = nil

function GetSpawnableOceanUnits()
    if tSpawnableOceanUnits == nil then
		tSpawnableOceanUnits = {}
        for unitSpawnTerrain in GameInfo.UnitSpawnTerrains() do
			if unitSpawnTerrain.TerrainType == "TERRAIN_OCEAN" then
                table.insert(tSpawnableOceanUnits, unitSpawnTerrain.UnitType)
            end
        end
    end
end

function UnitCanSpawnInEra(unitType, testEra)
	local unitSpawnEra;
	for curUnitSpawnEra in GameInfo.UnitSpawnEras() do
		if curUnitSpawnEra.UnitType == unitType then
			unitSpawnEra = curUnitSpawnEra
			break
		end
	end
    local minEra = GameInfo.Eras[unitSpawnEra.MinEraType].Index
    local maxEra = GameInfo.Eras[unitSpawnEra.MaxEraType].Index
    local canSpawnInEra = false

	local testEraId = GameInfo.Eras[testEra].Index
    if (testEraId >= minEra) and (testEraId <= maxEra) then
        canSpawnInEra = true
    end

    return canSpawnInEra
end

function GetNumberAllowedOceanPredators(iPlayer)
    local pPlayer = Players[iPlayer];
    local pUnits = pPlayer:GetUnits()
    local iNumberAliveUnits = 0
    for i, pUnit in pUnits:Members() do
        if has_value(tSpawnableOceanUnits, pUnit:GetType()) and not pUnit:IsDead() and not pUnit:IsDelayedDeath() then
            iNumberAliveUnits = iNumberAliveUnits + 1
        end
    end
    local iCurrentAllowedNumberUnits = (math.floor(iNumberOceanPlots / iTargetNumberOceanPlotsPerAnimal) - iNumberAliveUnits)
    if (iCurrentAllowedNumberUnits >= 1) then
        return iCurrentAllowedNumberUnits
    else
        return 0
    end
end

function SpawnOceanPredators(iPlayer)
	GetSpawnableOceanUnits()
    if (bNoMoreSeaUnitsCanBeSpawned == true) then return end
    if (PlayerConfigurations[iPlayer]:GetCivilizationTypeName() == "CIVILIZATION_BARBARIAN") then
        local pPlayer = Players[iPlayer];
        local iNumberToSpawnThisTurn = ((GetNumberAllowedOceanPredators(iPlayer) >= 1) and iNumberUnitsToSpawnPerTurn or 0)
        if (iNumberToSpawnThisTurn == 0) then return end
        local iAttemptsThisTurn = 0 -- safety valve "counter" to keep the code from doing an infinite unending loop
        while iNumberToSpawnThisTurn > 0 do
            local iSelectedTableKey = math.random(iNumberOceanPlots)
            local iPlotIndex = tOceanPlots[iSelectedTableKey]
            local pPlot = Map.GetPlotByIndex(iPlotIndex);
            if (pPlot ~= nil) then
                if (pPlot:GetOwner() == -1) then
                    local iPlotX, iPlotY = pPlot:GetX(), pPlot:GetY()
                    local bPlotHasUnit = false
                    local unitList :table = Units.GetUnitsInPlotLayerID(iPlotX, iPlotY, MapLayers.ANY);
                    if unitList ~= nil then
                        for i, pUnit in ipairs(unitList) do
                            local tUnitDetails = GameInfo.Units[pUnit:GetType()]
                            if tUnitDetails ~= nil then
                                if not pUnit:IsDead() and not pUnit:IsDelayedDeath() then
                                    bPlotHasUnit = true
                                    break
                                end
                            end
                        end
                    end
                    if (bPlotHasUnit == false) then
                        local unitTypeToSpawn = tSpawnableOceanUnits[math.random(table.count(tSpawnableOceanUnits))]
						local currentEra = GameInfo.Eras[Game.GetEras():GetCurrentEra()].EraType
                        if UnitCanSpawnInEra(unitTypeToSpawn, currentEra) then
							print("spawning...")
                            print(unitTypeToSpawn .. " at " .. iPlotX .. "," .. iPlotY)
                            local iUnitToSpawn = GameInfo.Units[unitTypeToSpawn].Index
                            local pUnits = pPlayer:GetUnits()
                            pUnits:Create(iUnitToSpawn, iPlotX, iPlotY); -- Create Unit
                            iNumberToSpawnThisTurn = iNumberToSpawnThisTurn - 1
                        end
                    end
                else
                    table.remove(tOceanPlots, iSelectedTableKey)
                    iNumberOceanPlots = iNumberOceanPlots - 1
                    if (iNumberOceanPlots == 0) then
                        bNoMoreSeaUnitsCanBeSpawned = true
                        return
                    end
                end
            end
            -- satefy valve check and routine end when the number of total attempts is at 21 for this turn
            iAttemptsThisTurn = iAttemptsThisTurn + 1
            if (iAttemptsThisTurn > 40) then return end
        end
    end
end

if (bNoMoreSeaUnitsCanBeSpawned == false) then
    GameEvents.PlayerTurnStarted.Add(SpawnOceanPredators)
end