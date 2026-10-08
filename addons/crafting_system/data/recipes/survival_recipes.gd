extends Node
class_name SurvivalCraftingRecipes

const RECIPES = [
    {
        "id": "bandage",
        "name": "Bandage",
        "category": "medical",
        "station": "camp_station",
        "time_to_craft": 2.0,
        "output_item": "bandage",
        "output_amount": 2,
        "required_items": {"cloth": 2, "herbs": 1}
    },
    {
        "id": "water_filter",
        "name": "Water Filter",
        "category": "utility",
        "station": "camp_station",
        "time_to_craft": 4.5,
        "output_item": "water_filter",
        "output_amount": 1,
        "required_items": {"charcoal": 2, "metal_scrap": 2, "cloth": 1}
    },
    {
        "id": "scrap_axe",
        "name": "Scrap Axe",
        "category": "tool",
        "station": "workbench",
        "time_to_craft": 4.0,
        "output_item": "scrap_axe",
        "output_amount": 1,
        "required_items": {"wood": 2, "metal_scrap": 3, "rope": 1}
    },
    {
        "id": "wooden_spear",
        "name": "Wooden Spear",
        "category": "weapon",
        "station": "workbench",
        "time_to_craft": 3.5,
        "output_item": "wooden_spear",
        "output_amount": 1,
        "required_items": {"wood": 3, "stone": 1, "rope": 1}
    },
    {
        "id": "pistol_ammo",
        "name": "Pistol Ammo",
        "category": "ammo",
        "station": "workbench",
        "time_to_craft": 2.7,
        "output_item": "pistol_ammo",
        "output_amount": 8,
        "required_items": {"metal_scrap": 2, "powder": 1, "casing": 2}
    },
    {
        "id": "basic_shelter",
        "name": "Basic Shelter",
        "category": "building",
        "station": "construction_table",
        "time_to_craft": 18.0,
        "output_item": "basic_shelter",
        "output_amount": 1,
        "required_items": {"wood": 12, "cloth": 4, "rope": 3, "stone": 5}
    },
    {
        "id": "repair_kit",
        "name": "Repair Kit",
        "category": "tool",
        "station": "workbench",
        "time_to_craft": 5.0,
        "output_item": "repair_kit",
        "output_amount": 1,
        "required_items": {"metal_scrap": 2, "cloth": 2, "glue": 1}
    },
    {
        "id": "cooking_stove",
        "name": "Cooking Stove",
        "category": "utility",
        "station": "construction_table",
        "time_to_craft": 12.0,
        "output_item": "cooking_stove",
        "output_amount": 1,
        "required_items": {"metal_scrap": 5, "brick": 4, "charcoal": 2}
    }
]
