local multiSchoolMapping = {
    astral = {"arcane", "nature"},
    chaos = {"arcane", "fire", "frost", "nature", "shadow", "holy", "physical"},
    cosmic = {"arcane", "holy", "nature", "shadow"},
    elemental = {"fire", "frost", "nature"},
    flamestrike = {"fire", "physical"},
    frostfire = {"fire", "frost"},
    froststorm = {"frost", "nature"},
    holystrike = {"holy", "physical"},
    plague = {"nature", "shadow"},
    radiant = {"fire", "holy"},
    shadowflame = {"shadow", "fire"},
    shadowfrost = {"frost", "shadow"},
    shadowstrike = {"shadow", "physical"},
    spellfrost = {"arcane", "frost"},
    twilight = {"holy", "shadow"},
    volcanic = {"fire", "nature"},
}

local simulatedAuras = {
    arena1 = {},
    arena2 = {},
    arena3 = {},
    target = {},
    focus = {},
}

local damageReductionAuras = {
    -- [spellID] = {{type = "arcane", value = 12}, {type = "nature", value = 10}},
}

local damageIncreaseAuras = {
    -- [spellID] = {{type = "shadow", value = 5}, {type = "fire", value = 7}},
}