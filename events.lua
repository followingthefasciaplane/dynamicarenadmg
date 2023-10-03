local frame = CreateFrame("Frame", "Tracker", UIParent, "BasicFrameTemplateWithInset")
frame:SetSize(300, 400)
frame:SetPoint("CENTER") 
frame.title = frame:CreateFontString(nil, "OVERLAY")
frame.title:SetFontObject("GameFontHighlight")
frame.title:SetPoint("LEFT", frame.TitleBg, "LEFT", 5, 0)
frame.title:SetText("Aura Tracker")

frame.text = frame:CreateFontString(nil, "OVERLAY")
frame.text:SetFontObject("GameFontHighlight")
frame.text:SetPoint("TOPLEFT", frame, "TOPLEFT", 10, -30)
frame.text:SetWidth(280)
frame.text:SetJustifyH("LEFT")
frame.text:SetJustifyV("TOP")

frame:RegisterEvent("UNIT_AURA")
frame:SetScript("OnEvent", function(self, event, unit)
    local unitsToCheck = {}
    local inInstance, instanceType = IsInInstance()
    if inInstance and instanceType == "arena" then
        unitsToCheck = {"arena1", "arena2", "arena3"}
    elseif not inInstance then
        unitsToCheck = {"target", "focus"}
    end
    
    local displayText = ""
    for _, unit in ipairs(unitsToCheck) do
        if UnitIsPlayer(unit) and UnitCanAttack("player", unit) then
            local damageReduction = CalculateModifications(unit, damageReductionAuras)
            local damageIncrease = CalculateModifications(unit, damageIncreaseAuras)
            
            displayText = displayText .. UnitName(unit) .. " (" .. unit .. "):\n"
            displayText = displayText .. "Damage done: " .. GetModificationText(damageIncrease) .. "\n"
            displayText = displayText .. "Damage reductions: " .. GetModificationText(damageReduction) .. "\n\n"
        end
    end
    self.text:SetText(displayText)
end)