data:extend({
    {
		type = "technology",
		name = "hexi-oretech-tier1",
		icon = "__Hexi_Inline_Ore_Processing__/graphics/tech1.png",
        icon_size = 128,
		unit =
		{
			count = 75,
			ingredients =
			{
				{"science-pack-1", 1}
			},
			time = 15
		},
		prerequisites = {"automation-2", "logistics"},
		effects = {
			{
				type = "unlock-recipe",
				recipe = "hexi-ore-enrichment-machine"
			}
        }
    },
    {
		type = "technology",
		name = "hexi-oretech-tier2",
		icon = "__Hexi_Inline_Ore_Processing__/graphics/tech2.png",
        icon_size = 128,
		unit =
		{
			count = 200,
			ingredients =
			{
				{"science-pack-1", 1},
				{"science-pack-2", 1}
			},
			time = 20
		},
		prerequisites = {"hexi-oretech-tier1", "advanced-material-processing"},
		effects = {
			{
				type = "unlock-recipe",
				recipe = "hexi-ore-crushing-machine"
			}
        }
    },
    {
		type = "technology",
		name = "hexi-oretech-tier3",
		icon = "__Hexi_Inline_Ore_Processing__/graphics/tech3.png",
        icon_size = 128,
		unit =
		{
			count = 500,
			ingredients =
			{
				{"science-pack-1", 1},
				{"science-pack-2", 1},
				{"science-pack-3", 1}
			},
			time = 30
		},
		prerequisites = {"hexi-oretech-tier2", "advanced-material-processing-2"},
		effects = {
			{
				type = "unlock-recipe",
				recipe = "hexi-ore-cleaning-machine"
			}
        }
    },
    {
		type = "technology",
		name = "hexi-oretech-tier4",
		icon = "__Hexi_Inline_Ore_Processing__/graphics/tech4.png",
        icon_size = 128,
		unit =
		{
			count = 1200,
			ingredients =
			{
				{"science-pack-1", 1},
				{"science-pack-2", 1},
				{"science-pack-3", 1},
				{"production-science-pack", 1}
			},
			time = 60
		},
		prerequisites = {"hexi-oretech-tier3", "productivity-module-3", "advanced-electronics-2"},
		effects = {
			{
				type = "unlock-recipe",
				recipe = "hexi-ore-liquidating-machine"
			},
			{
				type = "unlock-recipe",
				recipe = "hexi-ore-crystal-machine"
			}
        }
    },
    {
		type = "technology",
		name = "hexi-oretech-tier3a",
		icon = "__Hexi_Inline_Ore_Processing__/graphics/tech3.png",
        icon_size = 128,
		unit =
		{
			count = 500,
			ingredients =
			{
				{"science-pack-1", 1},
				{"science-pack-2", 1},
				{"science-pack-3", 1},
				{"production-science-pack", 1},
				{"high-tech-science-pack", 1}
			},
			time = 45
		},
		prerequisites = {"hexi-oretech-tier3", "advanced-electronics-2"},
		effects = {
			{
				type = "unlock-recipe",
				recipe = "hexi-ore-cleaning-machine-advanced"
			}
        }
    }
})