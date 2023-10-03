local function InitializeOptionsPanel()
    local panel = CreateFrame("Frame", "TrackerOptions", UIParent)
    panel.name = "Aura Tracker Options"
    InterfaceOptions_AddCategory(panel)
    
    local title = panel:CreateFontString(nil, "ARTWORK", "GameFontNormalLarge")
    title:SetPoint("TOPLEFT", 16, -16)
    title:SetText("Aura Tracker Options")
    
    local toggleButton = CreateFrame("CheckButton", "AuraTrackerToggle", panel, "UICheckButtonTemplate")
    toggleButton:SetPoint("TOPLEFT", title, "BOTTOMLEFT", 0, -10)
    toggleButton.text = toggleButton:CreateFontString(nil, "ARTWORK", "GameFontNormal")
    toggleButton.text:SetPoint("LEFT", toggleButton, "RIGHT", 0, 0)
    toggleButton.text:SetText("Enable for arenas")
    
    toggleButton:SetScript("OnClick", function(self)
        if self:GetChecked() then
            print("Aura tracking for arenas enabled.")
        else
            print("Aura tracking for arenas disabled.")
        end
    end)
    
    local dropdown = CreateFrame("Frame", "AuraTrackerDropdown", panel, "UIDropDownMenuTemplate")
    dropdown:SetPoint("TOPLEFT", toggleButton, "BOTTOMLEFT", -16, -10)
    UIDropDownMenu_SetWidth(dropdown, 200)
    
    UIDropDownMenu_Initialize(dropdown, function(self, level)
        local info = UIDropDownMenu_CreateInfo()
        local units = {"arena1", "arena2", "arena3", "target", "focus"}
        for i, unit in ipairs(units) do
            info.text = unit
            info.value = unit
            info.func = function()
                UIDropDownMenu_SetSelectedID(dropdown, i)
                print("Now tracking: " .. unit)
            end
            UIDropDownMenu_AddButton(info, level)
        end
    end)

    local fakeArenaCheckbox = CreateFrame("CheckButton", "TestMode", panel, "UICheckButtonTemplate")
    fakeArenaCheckbox:SetPoint("TOPLEFT", dropdown, "BOTTOMLEFT", 16, -10)
    fakeArenaCheckbox.text = fakeArenaCheckbox:CreateFontString(nil, "ARTWORK", "GameFontNormal")
    fakeArenaCheckbox.text:SetPoint("LEFT", fakeArenaCheckbox, "RIGHT", 0, 0)
    fakeArenaCheckbox.text:SetText("Show test targets")

    fakeArenaCheckbox:SetScript("OnClick", function(self)
        if self:GetChecked() then
            print("Displaying test targets.")
        else
            print("Hiding test targets.")
        end
    end)
  
    local spellIDBox = CreateFrame("EditBox", "SpellIDTestBox", panel, "InputBoxTemplate")
    spellIDBox:SetAutoFocus(false)
    spellIDBox:SetWidth(100)
    spellIDBox:SetHeight(20)
    spellIDBox:SetPoint("TOPLEFT", fakeArenaCheckbox, "BOTTOMLEFT", 0, -10)
    spellIDBox:SetScript("OnEnterPressed", function(self)
        local spellID = tonumber(self:GetText())
        if spellID then
            simulatedAuras.arena1[spellID] = true
            simulatedAuras.arena2[spellID] = true
            simulatedAuras.arena3[spellID] = true
            print("Applied aura with SpellID "..spellID.." to test targets.")
        end
    end)
  
    local spellIDLabel = panel:CreateFontString(nil, "ARTWORK", "GameFontNormal")
    spellIDLabel:SetPoint("LEFT", spellIDBox, "RIGHT", 5, 0)
    spellIDLabel:SetText("Enter SpellID to apply to test targets.")
  
end

InitializeOptionsPanel()