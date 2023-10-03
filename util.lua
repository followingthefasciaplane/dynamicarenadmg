local function CalculateModifications(unit, auraList)
    local modifications = {
        physical = 0,
        arcane = 0,
        fire = 0,
        frost = 0,
        nature = 0,
        shadow = 0,
        holy = 0,
    }

    for i = 1, 40 do
        local _, _, _, _, _, _, _, _, _, spellId = UnitAura(unit, i, "HARMFUL")
        if spellId and auraList[spellId] then
            for _, auraInfo in ipairs(auraList[spellId]) do
                local schoolsToAffect = {}
                if multiSchoolMapping[auraInfo.type] then
                    schoolsToAffect = multiSchoolMapping[auraInfo.type]
                else
                    schoolsToAffect = {auraInfo.type}
                end
                for _, school in ipairs(schoolsToAffect) do
                    modifications[school] = modifications[school] + auraInfo.value
                end
            end
        end
    end
    
    return modifications
end

function GetModificationText(modifications)
    local hasModifications = false
    local modificationText = ""
    for school, value in pairs(modifications) do
        if value ~= 0 then
            hasModifications = true
            modificationText = modificationText .. string.format("%d%% %s, ", value, school)
        end
    end
    return hasModifications and modificationText or "baseline"
end