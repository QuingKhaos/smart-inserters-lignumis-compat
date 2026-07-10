local khaoslib_technology = require("__khaoslib__.technology")

-- Normal difficulty
local techs = {
  ["si-unlock-offsets"] = {
    {"wood-science-pack", 1},
  },
  ["si-unlock-cross"] = {
    {"wood-science-pack", 1},
  },
  ["si-unlock-x-diagonals"] = {
    {"wood-science-pack", 1},
    {"steam-science-pack", 1},
  },
  ["si-unlock-all-diagonals"] = {
    {"automation-science-pack", 1},
  },
  ["si-unlock-range-1"] = {
    {"wood-science-pack", 1},
  },
  ["si-unlock-range-2"] = {
    {"wood-science-pack", 1},
    {"steam-science-pack", 1},
  },
  ["si-unlock-range-3"] = {
    {"automation-science-pack", 1},
  },
  ["si-unlock-range-4"] = {
    {"automation-science-pack", 1},
    {"logistic-science-pack", 1},
  },
  ["si-unlock-range-5"] = {
    {"automation-science-pack", 1},
    {"logistic-science-pack", 1},
    {"chemical-science-pack", 1},
  },
}

-- Hard difficulty
if settings.startup["si-technologies-difficulty"].value == "hard" then
  techs = {
    ["si-unlock-offsets"] = {
      {"wood-science-pack", 1},
      {"steam-science-pack", 1},
    },
    ["si-unlock-cross"] = {
      {"wood-science-pack", 1},
    },
    ["si-unlock-x-diagonals"] = {
      {"wood-science-pack", 1},
      {"steam-science-pack", 1},
    },
    ["si-unlock-all-diagonals"] = {
      {"automation-science-pack", 1},
    },
    ["si-unlock-range-1"] = {
      {"wood-science-pack", 1},
      {"steam-science-pack", 1},
    },
    ["si-unlock-range-2"] = {
      {"automation-science-pack", 1},
    },
    ["si-unlock-range-3"] = {
      {"automation-science-pack", 1},
      {"logistic-science-pack", 1},
    },
    ["si-unlock-range-4"] = {
      {"automation-science-pack", 1},
      {"logistic-science-pack", 1},
      {"chemical-science-pack", 1},
    },
    ["si-unlock-range-5"] = {
      {"automation-science-pack", 1},
      {"logistic-science-pack", 1},
      {"chemical-science-pack", 1},
      {"utility-science-pack", 1},
    },
  }
end

-- More
techs["long-inserters-1"] = {
  {"wood-science-pack", 1},
}

techs["long-inserters-2"] = {
  {"wood-science-pack", 1},
}

techs["near-inserters"] = {
  {"wood-science-pack", 1},
}

techs["more-inserters-2"] = {
  {"wood-science-pack", 1},
}

-- Update techs
for tech_name, packs in pairs(techs) do
  local tech = khaoslib_technology:load(tech_name)
    :set_science_packs(packs)
    :replace_prerequisite("automation", "burner-automation")

  for _, pack in pairs(packs) do
    tech:add_prerequisite(pack[1])
  end

  tech:commit()
end
