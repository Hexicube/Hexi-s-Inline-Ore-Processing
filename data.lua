require("technology")

nullpic = function()
    return {
        filename = "__Hexi_Inline_Ore_Processing__/graphics/null.png",
        width = 1,
        height = 1
    }
end

data:extend(
{
    {
        type = "item-group",
        name = "hexi-processing",
        order = "f",
        icon = "__base__/graphics/item-group/signals.png",
    },
    {
        type = "item-subgroup",
        name = "hexi-processing-machine",
        group = "hexi-processing",
        order = "a"
    },
    {
        type = "item-subgroup",
        name = "hexi-ore-recipes-1",
        group = "hexi-processing",
        order = "a"
    },
    {
        type = "item-subgroup",
        name = "hexi-ore-recipes-2",
        group = "hexi-processing",
        order = "a"
    },
    {
        type = "item-subgroup",
        name = "hexi-ore-recipes-3",
        group = "hexi-processing",
        order = "a"
    },
    {
        type = "item-subgroup",
        name = "hexi-ore-recipes-4",
        group = "hexi-processing",
        order = "a"
    },
    {
        type = "recipe-category",
        name = "hexi-enrichment"
    },
    {
        type = "recipe",
        name = "hexi-ore-enrichment-machine",
        enabled = false,
        energy_required = 3.5,
        ingredients = {{"electronic-circuit", 5}, {"iron-gear-wheel", 10}, {"iron-plate", 20}},
        result = "hexi-enrichment-building",
        result_count = 1
    },
    {
        type = "item",
        name = "hexi-enrichment-building",
        icon = "__Hexi_Inline_Ore_Processing__/graphics/enrichment-icon.png",
        flags = {"goes-to-quickbar"},
        subgroup = "hexi-processing-machine",
        order = "a",
        place_result = "hexi-enrichment-building",
        stack_size = 50
    },
    {
        type = "furnace",
        name = "hexi-enrichment-building",
        icon = "__Hexi_Inline_Ore_Processing__/graphics/enrichment-icon.png",
        flags = {"placeable-neutral", "placeable-player", "player-creation"},
        minable = {mining_time = 1, result = "hexi-enrichment-building"},
        max_health = 150,
        corpse = "big-remnants",
        dying_explosion = "medium-explosion",
        light = {intensity = 1, size = 10},
        resistances =
        {
            {
                type = "fire",
                percent = 80
            }
        },
        collision_box = {{-1.2, -1.2}, {1.2, 1.2}},
        selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
        module_specification =
        {
            module_slots = 4,
            module_info_icon_shift = {0, 0.8}
        },
        allowed_effects = {"consumption", "speed", "pollution"},
        crafting_categories = {"hexi-enrichment"},
        result_inventory_size = 1,
        crafting_speed = 1,
        energy_usage = "75kW",
        source_inventory_size = 1,
        energy_source =
        {
            type = "electric",
            usage_priority = "secondary-input",
            emissions = 1.5 / 75
        },
        vehicle_impact_sound = { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
        working_sound =
        {
            sound =
            {
                filename = "__base__/sound/electric-furnace.ogg",
                volume = 0.7
            },
            apparent_volume = 1.5
        },
        animation =
        {
            filename = "__Hexi_Inline_Ore_Processing__/graphics/enrichment.png",
            priority = "high",
            width = 224,
            height = 224,
            scale = 0.55,
            shift = {0, 0},
            frame_count = 25,
            line_length = 5,
            animation_speed = 0.5
        }
    },
    {
        type = "recipe-category",
        name = "hexi-crushing"
    },
    {
        type = "recipe",
        name = "hexi-ore-crushing-machine",
        enabled = false,
        energy_required = 3.5,
        ingredients = {{"electronic-circuit", 25}, {"iron-gear-wheel", 5}, {"steel-plate", 10}, {"iron-plate", 10}},
        result = "hexi-crushing-building",
        result_count = 1
    },
    {
        type = "item",
        name = "hexi-crushing-building",
        icon = "__base__/graphics/icons/electric-furnace.png",
        flags = {"goes-to-quickbar"},
        subgroup = "hexi-processing-machine",
        order = "b",
        place_result = "hexi-crushing-building",
        stack_size = 50
    },
    {
        type = "furnace",
        name = "hexi-crushing-building",
        icon = "__base__/graphics/icons/electric-furnace.png",
        flags = {"placeable-neutral", "placeable-player", "player-creation"},
        minable = {mining_time = 1, result = "hexi-crushing-building"},
        max_health = 150,
        corpse = "big-remnants",
        dying_explosion = "medium-explosion",
        light = {intensity = 1, size = 10},
        resistances =
        {
            {
                type = "fire",
                percent = 80
            }
        },
        collision_box = {{-1.7, -1.7}, {1.7, 1.7}},
        selection_box = {{-2, -2}, {2, 2}},
        module_specification =
        {
            module_slots = 4,
            module_info_icon_shift = {0, 0.8}
        },
        allowed_effects = {"consumption", "speed", "pollution"},
        crafting_categories = {"hexi-crushing"},
        result_inventory_size = 1,
        crafting_speed = 1,
        energy_usage = "125kW",
        source_inventory_size = 1,
        energy_source =
        {
            type = "electric",
            usage_priority = "secondary-input",
            emissions = 3 / 125
        },
        vehicle_impact_sound = { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
        working_sound =
        {
            sound =
            {
                filename = "__base__/sound/electric-furnace.ogg",
                volume = 0.7
            },
            apparent_volume = 1.5
        },
        animation =
        {
            filename = "__Hexi_Inline_Ore_Processing__/graphics/crusher.png",
            priority = "high",
            width = 512,
            height = 512,
            frame_count = 1,
            scale = 3 / 8,
            shift = {.85, -0.1}
        }
    },
    {
        type = "recipe-category",
        name = "hexi-cleaning"
    },
    {
        type = "recipe",
        name = "hexi-ore-cleaning-machine",
        enabled = false,
        energy_required = 3.5,
        ingredients = {{"advanced-circuit", 20}, {"electronic-circuit", 20}, {"steel-plate", 25}, {"pipe", 10}},
        result = "hexi-cleaning-building",
        result_count = 1
    },
    {
        type = "item",
        name = "hexi-cleaning-building",
        icon = "__base__/graphics/icons/electric-furnace.png",
        flags = {"goes-to-quickbar"},
        subgroup = "hexi-processing-machine",
        order = "ca",
        place_result = "hexi-cleaning-building",
        stack_size = 50
    },
    {
        type = "furnace",
        name = "hexi-cleaning-building",
        icon = "__base__/graphics/icons/electric-furnace.png",
        flags = {"placeable-neutral", "placeable-player", "player-creation"},
        minable = {mining_time = 1, result = "hexi-cleaning-building"},
        max_health = 150,
        corpse = "big-remnants",
        dying_explosion = "medium-explosion",
        light = {intensity = 1, size = 10},
        resistances =
        {
            {
                type = "fire",
                percent = 80
            }
        },
        fluid_boxes =
        {
            {
                production_type = "input",
                pipe_picture = assembler2pipepictures(),
                pipe_covers = pipecoverspictures(),
                base_area = 2.5,
                base_level = -1,
                pipe_connections = {{ type="input", position = {0, 3} }}
            },
            off_when_no_fluid_recipe = false
        },
        collision_box = {{-2.2, -2.2}, {2.2, 2.2}},
        selection_box = {{-2.5, -2.5}, {2.5, 2.5}},
        module_specification =
        {
            module_slots = 4,
            module_info_icon_shift = {0, 0.8}
        },
        allowed_effects = {"consumption", "speed", "pollution"},
        crafting_categories = {"hexi-cleaning"},
        result_inventory_size = 1,
        crafting_speed = 1,
        energy_usage = "375kW",
        source_inventory_size = 1,
        energy_source =
        {
            type = "electric",
            usage_priority = "secondary-input",
            emissions = 5 / 375
        },
        vehicle_impact_sound = { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
        working_sound =
        {
            sound =
            {
                filename = "__base__/sound/electric-furnace.ogg",
                volume = 0.7
            },
            apparent_volume = 1.5
        },
        animation =
        {
            filename = "__Hexi_Inline_Ore_Processing__/graphics/cleaning.png",
            priority = "high",
            width = 160,
            height = 160,
            frame_count = 1,
            shift = {0, 0}
        }
    },
    {
        type = "recipe-category",
        name = "hexi-cleaning-advanced"
    },
    {
        type = "recipe",
        name = "hexi-ore-cleaning-machine-advanced",
        enabled = false,
        energy_required = 3.5,
        ingredients = {{"advanced-circuit", 20}, {"processing-unit", 20}, {"concrete", 20}, {"pipe", 10}},
        result = "hexi-cleaning-building-advanced",
        result_count = 1
    },
    {
        type = "item",
        name = "hexi-cleaning-building-advanced",
        icon = "__base__/graphics/icons/electric-furnace.png",
        flags = {"goes-to-quickbar"},
        subgroup = "hexi-processing-machine",
        order = "cb",
        place_result = "hexi-cleaning-building-advanced",
        stack_size = 50
    },
    {
        type = "furnace",
        name = "hexi-cleaning-building-advanced",
        icon = "__base__/graphics/icons/electric-furnace.png",
        flags = {"placeable-neutral", "placeable-player", "player-creation"},
        minable = {mining_time = 1, result = "hexi-cleaning-building-advanced"},
        max_health = 250,
        corpse = "big-remnants",
        dying_explosion = "medium-explosion",
        light = {intensity = 1, size = 10},
        resistances =
        {
            {
                type = "fire",
                percent = 80
            }
        },
        fluid_boxes =
        {
            {
                production_type = "input",
                pipe_picture = assembler2pipepictures(),
                pipe_covers = pipecoverspictures(),
                base_area = 1,
                base_level = -1,
                pipe_connections = {{ type="input", position = {0, 3} }}
            },
            off_when_no_fluid_recipe = false
        },
        collision_box = {{-2.2, -2.2}, {2.2, 2.2}},
        selection_box = {{-2.5, -2.5}, {2.5, 2.5}},
        module_specification =
        {
            module_slots = 4,
            module_info_icon_shift = {0, 0.8}
        },
        allowed_effects = {"consumption", "speed", "pollution"},
        crafting_categories = {"hexi-cleaning-advanced"},
        result_inventory_size = 2,
        crafting_speed = 1,
        energy_usage = "800kW",
        source_inventory_size = 1,
        energy_source =
        {
            type = "electric",
            usage_priority = "secondary-input",
            emissions = 6 / 800
        },
        vehicle_impact_sound = { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
        working_sound =
        {
            sound =
            {
                filename = "__base__/sound/electric-furnace.ogg",
                volume = 0.7
            },
            apparent_volume = 1.5
        },
        animation =
        {
            filename = "__Hexi_Inline_Ore_Processing__/graphics/cleaning2.png",
            priority = "high",
            width = 160,
            height = 160,
            frame_count = 1,
            shift = {0, 0}
        }
    },
    {
        type = "recipe-category",
        name = "hexi-liquidating"
    },
    {
        type = "recipe",
        name = "hexi-ore-liquidating-machine",
        enabled = false,
        energy_required = 3.5,
        ingredients = {{"advanced-circuit", 10}, {"stone-brick", 25}, {"steel-plate", 10}},
        result = "hexi-liquidating-building",
        result_count = 1
    },
    {
        type = "item",
        name = "hexi-liquidating-building",
        icon = "__Hexi_Inline_Ore_Processing__/graphics/liquidation-icon.png",
        flags = {"goes-to-quickbar"},
        subgroup = "hexi-processing-machine",
        order = "d",
        place_result = "hexi-liquidating-building",
        stack_size = 50
    },
    {
        type = "furnace",
        name = "hexi-liquidating-building",
        icon = "__Hexi_Inline_Ore_Processing__/graphics/liquidation-icon.png",
        flags = {"placeable-neutral", "placeable-player", "player-creation"},
        minable = {mining_time = 1, result = "hexi-liquidating-building"},
        max_health = 150,
        corpse = "big-remnants",
        dying_explosion = "medium-explosion",
        light = {intensity = 1, size = 10},
        resistances =
        {
            {
                type = "fire",
                percent = 80
            }
        },
        fluid_boxes =
        {
            {
                production_type = "input",
                base_area = 2,
                base_level = -1,
                pipe_connections = {{ type="input", position = {0, 2} }}
            },
            {
                production_type = "output",
                base_area = 2,
                base_level = 1,
                pipe_connections = {{ type="output", position = {0, -2} }}
            },
            off_when_no_fluid_recipe = false
        },
        collision_box = {{-1.2, -1.2}, {1.2, 1.2}},
        selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
        module_specification =
        {
            module_slots = 4,
            module_info_icon_shift = {0, 0.8}
        },
        allowed_effects = {"consumption", "speed", "pollution"},
        crafting_categories = {"hexi-liquidating"},
        result_inventory_size = 0,
        crafting_speed = 1,
        energy_usage = "125kW",
        source_inventory_size = 1,
        energy_source =
        {
            type = "electric",
            usage_priority = "secondary-input",
            emissions = 2.5 / 125
        },
        vehicle_impact_sound = { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
        working_sound =
        {
            sound =
            {
                filename = "__base__/sound/electric-furnace.ogg",
                volume = 0.7
            },
            apparent_volume = 1.5
        },
        animation =
        {
            north =
            {
                filename = "__Hexi_Inline_Ore_Processing__/graphics/liquidation.png",
                priority = "high",
                width = 160,
                height = 160,
                frame_count = 1,
                shift = {0, 0},
                scale = 0.8,
                x = 160
            },
            south =
            {
                filename = "__Hexi_Inline_Ore_Processing__/graphics/liquidation.png",
                priority = "high",
                width = 160,
                height = 160,
                frame_count = 1,
                shift = {0, 0},
                scale = 0.8,
                x = 160
            },
            east =
            {
                filename = "__Hexi_Inline_Ore_Processing__/graphics/liquidation.png",
                priority = "high",
                width = 160,
                height = 160,
                frame_count = 1,
                shift = {0, 0},
                scale = 0.8
            },
            west =
            {
                filename = "__Hexi_Inline_Ore_Processing__/graphics/liquidation.png",
                priority = "high",
                width = 160,
                height = 160,
                frame_count = 1,
                shift = {0, 0},
                scale = 0.8
            }
        }
    },
    {
        type = "recipe-category",
        name = "hexi-crystal"
    },
    {
        type = "recipe",
        name = "hexi-ore-crystal-machine",
        enabled = false,
        energy_required = 3.5,
        ingredients = {{"processing-unit", 5}, {"advanced-circuit", 10}, {"iron-gear-wheel", 30}, {"stone-brick", 5}},
        result = "hexi-crystal-building",
        result_count = 1
    },
    {
        type = "item",
        name = "hexi-crystal-building",
        icon = "__base__/graphics/icons/electric-furnace.png",
        flags = {"goes-to-quickbar"},
        subgroup = "hexi-processing-machine",
        order = "e",
        place_result = "hexi-crystal-building",
        stack_size = 50
    },
    {
        type = "furnace",
        name = "hexi-crystal-building",
        icon = "__base__/graphics/icons/electric-furnace.png",
        flags = {"placeable-neutral", "placeable-player", "player-creation"},
        minable = {mining_time = 1, result = "hexi-crystal-building"},
        max_health = 150,
        corpse = "big-remnants",
        dying_explosion = "medium-explosion",
        light = {intensity = 1, size = 10},
        resistances =
        {
            {
                type = "fire",
                percent = 80
            }
        },
        fluid_boxes =
        {
            {
                production_type = "input",
                pipe_covers =
                {
                    north = nullpic(),
                    east = nullpic(),
                    west = nullpic(),
                    south =
                    {
                        filename = "__Hexi_Inline_Ore_Processing__/graphics/crystal_pipestuff.png",
                        priority = "extra-high",
                        width = 64,
                        height = 64,
                        scale = 0.5,
                        shift = {0.015625, -0.6578125}
                    }
                },
                base_area = 2,
                base_level = -1,
                pipe_connections = {{ type="input", position = {-0.5, 1.5}}}
            },
            off_when_no_fluid_recipe = false
        },
        collision_box = {{-0.7, -0.7}, {0.7, 0.7}},
        selection_box = {{-1, -1}, {1, 1}},
        module_specification =
        {
            module_slots = 2,
            module_info_icon_shift = {0, 0.8}
        },
        drawing_box = {{-1, -1}, {1, 1}},
        allowed_effects = {"consumption", "speed", "pollution"},
        crafting_categories = {"hexi-crystal"},
        result_inventory_size = 1,
        crafting_speed = 1,
        energy_usage = "50kW",
        source_inventory_size = 0,
        energy_source =
        {
            type = "electric",
            usage_priority = "secondary-input",
            emissions = 0.5 / 50
        },
        vehicle_impact_sound = { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
        working_sound =
        {
            sound =
            {
                filename = "__base__/sound/electric-furnace.ogg",
                volume = 0.7
            },
            apparent_volume = 1.5
        },
        animation =
        {
            north =
            {
                filename = "__Hexi_Inline_Ore_Processing__/graphics/crystal.png",
                priority = "high",
                width = 192,
                height = 224,
                scale = 0.5,
                shift = {0, 0},
                frame_count = 1
            },
            west =
            {
                filename = "__Hexi_Inline_Ore_Processing__/graphics/crystal.png",
                priority = "high",
                width = 192,
                height = 224,
                scale = 0.5,
                shift = {0, 0},
                frame_count = 1,
                x = 192
            },
            south =
            {
                filename = "__Hexi_Inline_Ore_Processing__/graphics/crystal.png",
                priority = "high",
                width = 192,
                height = 224,
                scale = 0.5,
                shift = {0, 0},
                frame_count = 1,
                x = 192,
                y = 224
            },
            east =
            {
                filename = "__Hexi_Inline_Ore_Processing__/graphics/crystal.png",
                priority = "high",
                width = 192,
                height = 224,
                scale = 0.5,
                shift = {0, 0},
                frame_count = 1,
                y = 224
            }
        }
    },
})