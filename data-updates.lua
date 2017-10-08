function add_ore_recipes(ore_type, plate_type, image_ore, image_plate, image_folder, fluid_colour, time_mult, time_smelt, show_recipes)
    show_recipes = show_recipes or false
    
    if time_smelt > 0 then
        data:extend({
            --Smelting Recipe
            {
                type = "recipe",
                name = ore_type.."-enriched-smelting",
                category = "smelting",
                enabled = true,
                energy_required = time_smelt,
                ingredients = {{ore_type.."-enriched", 1}},
                result = plate_type,
                result_count = 1,
                main_product = "",
                icon = image_plate,
                subgroup = "hexi-ore-recipes-1",
                order = "z"
            }
        })
    end
    data:extend({
        --Enriched Item
        {
            type = "item",
            name = ore_type.."-enriched",
            icon = "__Hexi_Inline_Ore_Processing__/graphics/materials/"..image_folder.."/enriched.png",
            flags = {"goes-to-main-inventory"},
            subgroup = "hexi-ore-recipes-1",
            order = "zz",
            stack_size = 50
        },
        
        --Crushed Item
        {
            type = "item",
            name = ore_type.."-crushed",
            icon = "__Hexi_Inline_Ore_Processing__/graphics/materials/"..image_folder.."/crushed.png",
            flags = {"goes-to-main-inventory"},
            subgroup = "hexi-ore-recipes-2",
            order = "zz",
            stack_size = 50
        },
        
        --Cleaned Item
        {
            type = "item",
            name = ore_type.."-cleaned",
            icon = "__Hexi_Inline_Ore_Processing__/graphics/materials/"..image_folder.."/clean.png",
            flags = {"goes-to-main-inventory"},
            subgroup = "hexi-ore-recipes-3",
            order = "zz",
            stack_size = 50
        },
        
        --Slurry Fluid
        {
            type = "fluid",
            name = ore_type.."-slurry",
            default_temperature = 15,
            max_temperature = 15,
            heat_capacity = "10KJ",
            base_color = fluid_colour[1],
            flow_color = fluid_colour[2],
            icon = "__Hexi_Inline_Ore_Processing__/graphics/materials/"..image_folder.."/slurry.png",
            subgroup = "hexi-ore-recipes-4",
            order = "zz1",
            pressure_to_speed_ratio = 0.4,
            flow_to_energy_ratio = 0.59,
        },
        
        --Crystal Item
        {
            type = "item",
            name = ore_type.."-crystal",
            icon = image_ore,
            flags = {"goes-to-main-inventory"},
            subgroup = "hexi-ore-recipes-4",
            order = "zz2",
            stack_size = 50
        },
        
        --Tier 1 Enrichment (used on basic ore)
        {
            type = "recipe",
            name = ore_type.."-enrichment-1",
            category = "hexi-enrichment",
            enabled = true,
            energy_required = 4 * time_mult,
            ingredients = {{ore_type, 5}},
            result = ore_type.."-enriched",
            result_count = 6,
            main_product = "",
            icon = "__Hexi_Inline_Ore_Processing__/graphics/materials/"..image_folder.."/enriched.png",
            subgroup = "hexi-ore-recipes-1",
            order = "a",
            hidden = not show_recipes
        },
        
        --Crushing
        {
            type = "recipe",
            name = ore_type.."-crushing",
            category = "hexi-crushing",
            enabled = true,
            energy_required = 6 * time_mult,
            ingredients = {{ore_type, 5}},
            result = ore_type.."-crushed",
            result_count = 6,
            main_product = "",
            icon = "__Hexi_Inline_Ore_Processing__/graphics/materials/"..image_folder.."/crushed.png",
            subgroup = "hexi-ore-recipes-2",
            order = "a",
            hidden = not show_recipes
        },
        
        --Tier 2 Enrichment (used on crushed ore)
        {
            type = "recipe",
            name = ore_type.."-enrichment-2",
            category = "hexi-enrichment",
            enabled = true,
            energy_required = 4 * time_mult,
            ingredients = {{ore_type.."-crushed", 3}},
            result = ore_type.."-enriched",
            result_count = 4,
            main_product = "",
            icon = "__Hexi_Inline_Ore_Processing__/graphics/materials/"..image_folder.."/enriched.png",
            subgroup = "hexi-ore-recipes-2",
            order = "b",
            hidden = not show_recipes
        },
        
        --Cleaning
        {
            type = "recipe",
            name = ore_type.."-cleaning-1",
            category = "hexi-cleaning",
            enabled = true,
            energy_required = 2 * time_mult,
            ingredients = {{ore_type.."-crushed", 3}, {type="fluid", name="water", amount=25}},
            result = ore_type.."-cleaned",
            result_count = 3,
            main_product = "",
            icon = "__Hexi_Inline_Ore_Processing__/graphics/materials/"..image_folder.."/clean.png",
            subgroup = "hexi-ore-recipes-3",
            order = "a",
            hidden = not show_recipes
        },
        
        --Advanced Cleaning
        {
            type = "recipe",
            name = ore_type.."-cleaning-2",
            category = "hexi-cleaning-advanced",
            enabled = true,
            energy_required = 7 * time_mult,
            ingredients = {{ore_type.."-crushed", 5}, {type="fluid", name="light-oil", amount=5}},
            results =
            {
                {name=ore_type.."-cleaned", amount=6},
                {name="stone", amount=1, probability=0.50},
                {name="coal", amount=1, probability=0.05}
            },
            main_product = "",
            icon = "__Hexi_Inline_Ore_Processing__/graphics/materials/"..image_folder.."/clean_plus.png",
            subgroup = "hexi-ore-recipes-3",
            order = "b",
            hidden = not show_recipes
        },
        
        --Tier 3 Enrichment (used on cleaned ore)
        {
            type = "recipe",
            name = ore_type.."-enrichment-3",
            category = "hexi-enrichment",
            enabled = true,
            energy_required = 4 * time_mult,
            ingredients = {{ore_type.."-cleaned", 3}},
            result = ore_type.."-enriched",
            result_count = 5,
            main_product = "",
            icon = "__Hexi_Inline_Ore_Processing__/graphics/materials/"..image_folder.."/enriched.png",
            subgroup = "hexi-ore-recipes-3",
            order = "c",
            hidden = not show_recipes
        },
        
        --Liquidation
        {
            type = "recipe",
            name = ore_type.."-liquidating",
            category = "hexi-liquidating",
            enabled = true,
            energy_required = 4 * time_mult,
            ingredients = {{ore_type.."-cleaned", 3}, {type="fluid", name="sulfuric-acid", amount=1}},
            results =
            {
                {type="fluid", name=ore_type.."-slurry", amount=50}
            },
            main_product = "",
            icon = "__Hexi_Inline_Ore_Processing__/graphics/materials/"..image_folder.."/slurry.png",
            subgroup = "hexi-ore-recipes-4",
            order = "a",
            hidden = not show_recipes
        },
        
        --Crystallization
        {
            type = "recipe",
            name = ore_type.."-crystal",
            category = "hexi-crystal",
            enabled = true,
            energy_required = 2 * time_mult,
            ingredients = {{type="fluid", name=ore_type.."-slurry", amount=10}},
            result = ore_type.."-crystal",
            result_count = 1,
            main_product = "",
            icon = image_ore,
            subgroup = "hexi-ore-recipes-4",
            order = "b",
            hidden = not show_recipes
        },
        
        --Tier 4 Enrichment (used on ore crystals)
        {
            type = "recipe",
            name = ore_type.."-enrichment-4",
            category = "hexi-enrichment",
            enabled = true,
            energy_required = 8 * time_mult,
            ingredients = {{ore_type.."-crystal", 4}},
            result = ore_type.."-enriched",
            result_count = 5,
            main_product = "",
            icon = "__Hexi_Inline_Ore_Processing__/graphics/materials/"..image_folder.."/enriched.png",
            subgroup = "hexi-ore-recipes-4",
            order = "c",
            hidden = not show_recipes
        },
    })
end

add_ore_recipes("iron-ore",   "iron-plate",   "__base__/graphics/icons/iron-ore.png",   "__base__/graphics/icons/iron-plate.png",   "iron",   {{r=0.30, g=0.30, b=0.45}, {r=0.90, g=0.90, b=1.00}}, 1, 3.5, true)
add_ore_recipes("copper-ore", "copper-plate", "__base__/graphics/icons/copper-ore.png", "__base__/graphics/icons/copper-plate.png", "copper", {{r=0.40, g=0.15, b=0.00}, {r=0.70, g=0.40, b=0.10}}, 1, 3.5)