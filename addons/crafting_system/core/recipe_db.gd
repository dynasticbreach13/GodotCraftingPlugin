extends Node
class_name CraftingRecipeDB

var recipes: Dictionary = {}

func _ready() -> void:
    register_default_recipes()

func register_default_recipes() -> void:
    var recipe_data = [
        {
            "id": "scrap_axe",
            "name": "Scrap Axe",
            "category": "tool",
            "description": "A rough but durable axe for chopping wood and salvage.",
            "station": "workbench",
            "time_to_craft": 4.0,
            "output_item": "scrap_axe",
            "output_amount": 1,
            "required_items": {"wood": 2, "metal_scrap": 3, "rope": 1},
            "rarity": "common"
        },
        {
            "id": "bandage",
            "name": "Bandage",
            "category": "medical",
            "description": "Basic field dressing for wounds.",
            "station": "camp_station",
            "time_to_craft": 2.0,
            "output_item": "bandage",
            "output_amount": 2,
            "required_items": {"cloth": 2, "herbs": 1},
            "rarity": "common"
        },
        {
            "id": "water_filter",
            "name": "Water Filter",
            "category": "utility",
            "description": "Filters dirty water into safe drinking water.",
            "station": "camp_station",
            "time_to_craft": 6.0,
            "output_item": "water_filter",
            "output_amount": 1,
            "required_items": {"charcoal": 2, "metal_scrap": 2, "cloth": 1},
            "rarity": "uncommon"
        },
        {
            "id": "wooden_spear",
            "name": "Wooden Spear",
            "category": "weapon",
            "description": "Primitive melee weapon for defense and hunting.",
            "station": "workbench",
            "time_to_craft": 3.5,
            "output_item": "wooden_spear",
            "output_amount": 1,
            "required_items": {"wood": 3, "stone": 1, "rope": 1},
            "rarity": "common"
        },
        {
            "id": "pistol_ammo",
            "name": "Pistol Ammo",
            "category": "ammo",
            "description": "Basic ammo for sidearms.",
            "station": "workbench",
            "time_to_craft": 2.5,
            "output_item": "pistol_ammo",
            "output_amount": 8,
            "required_items": {"metal_scrap": 2, "powder": 1, "casing": 2},
            "rarity": "common"
        },
        {
            "id": "basic_shelter",
            "name": "Basic Shelter",
            "category": "building",
            "description": "A crude survival shelter with basic protection.",
            "station": "construction_table",
            "time_to_craft": 18.0,
            "output_item": "basic_shelter",
            "output_amount": 1,
            "required_items": {"wood": 12, "cloth": 4, "rope": 3, "stone": 5},
            "rarity": "rare"
        },
        {
            "id": "repair_kit",
            "name": "Repair Kit",
            "category": "tool",
            "description": "Fixes damaged tools and gear.",
            "station": "workbench",
            "time_to_craft": 5.0,
            "output_item": "repair_kit",
            "output_amount": 1,
            "required_items": {"metal_scrap": 2, "cloth": 2, "glue": 1},
            "rarity": "uncommon"
        },
        {
            "id": "cooking_stove",
            "name": "Cooking Stove",
            "category": "utility",
            "description": "Produces heat and allows cooked meals.",
            "station": "construction_table",
            "time_to_craft": 12.0,
            "output_item": "cooking_stove",
            "output_amount": 1,
            "required_items": {"metal_scrap": 5, "brick": 4, "charcoal": 2},
            "rarity": "rare"
        }
    ]

    for recipe_entry in recipe_data:
        var recipe = CraftingRecipe.new()
        recipe.id = recipe_entry["id"]
        recipe.name = recipe_entry["name"]
        recipe.category = recipe_entry["category"]
        recipe.description = recipe_entry["description"]
        recipe.station = recipe_entry["station"]
        recipe.time_to_craft = recipe_entry["time_to_craft"]
        recipe.output_item = recipe_entry["output_item"]
        recipe.output_amount = recipe_entry["output_amount"]
        recipe.required_items = recipe_entry["required_items"]
        recipe.rarity = recipe_entry.get("rarity", "common")
        recipes[recipe.id] = recipe

func get_recipe(id: String) -> CraftingRecipe:
    return recipes.get(id, null)

func get_recipes_by_category(category: String) -> Array:
    var results: Array = []
    for recipe in recipes.values():
        if recipe.category == category:
            results.append(recipe)
    return results

func get_all_recipes() -> Array:
    return recipes.values()
