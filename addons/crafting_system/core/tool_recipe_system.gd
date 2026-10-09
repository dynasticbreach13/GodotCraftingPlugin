extends Node
class_name ToolRecipeSystem

# Tool-specific crafting systems
# Each tool has unique recipes and gameplay mechanics

var saw_recipes: Dictionary = {}
var sledgehammer_recipes: Dictionary = {}
var hammer_recipes: Dictionary = {}

signal recipe_registered(tool_id: String, recipe_id: String)

func _ready() -> void:
    _register_saw_recipes()
    _register_sledgehammer_recipes()
    _register_hammer_recipes()

func _register_saw_recipes() -> void:
    var recipes = [
        {
            "id": "cut_logs",
            "tool_required": "saw",
            "name": "Cut Logs",
            "category": "processing",
            "description": "Process raw wood into usable lumber.",
            "station": "workbench",
            "time_to_craft": 5.0,
            "output_item": "lumber",
            "output_amount": 3,
            "required_items": {"raw_wood": 2},
            "required_tool": "saw",
            "tool_durability_cost": 10
        },
        {
            "id": "salvage_architectural",
            "tool_required": "saw",
            "name": "Salvage Architectural Materials",
            "category": "salvage",
            "description": "Cut useful materials from abandoned buildings.",
            "station": "workbench",
            "time_to_craft": 8.0,
            "output_item": "metal_salvage",
            "output_amount": 2,
            "required_items": {"architectural_debris": 3},
            "required_tool": "saw",
            "tool_durability_cost": 15,
            "rarity": "uncommon"
        },
        {
            "id": "cut_planks",
            "tool_required": "saw",
            "name": "Cut Planks",
            "category": "processing",
            "description": "Transform lumber into refined building planks.",
            "station": "workbench",
            "time_to_craft": 4.0,
            "output_item": "wood_planks",
            "output_amount": 4,
            "required_items": {"lumber": 2},
            "required_tool": "saw",
            "tool_durability_cost": 8
        },
        {
            "id": "craft_wooden_frame",
            "tool_required": "saw",
            "name": "Craft Wooden Frame",
            "category": "crafting",
            "description": "Build a structural wooden frame for shelters.",
            "station": "construction_table",
            "time_to_craft": 12.0,
            "output_item": "wooden_frame",
            "output_amount": 1,
            "required_items": {"wood_planks": 5, "rope": 2, "nails": 4},
            "required_tool": "saw",
            "tool_durability_cost": 20,
            "rarity": "uncommon"
        }
    ]

    for recipe_data in recipes:
        var recipe = _build_recipe(recipe_data)
        saw_recipes[recipe.id] = recipe
        recipe_registered.emit("saw", recipe.id)

func _register_sledgehammer_recipes() -> void:
    var recipes = [
        {
            "id": "break_concrete",
            "tool_required": "sledgehammer",
            "name": "Break Concrete",
            "category": "demolition",
            "description": "Demolish concrete structures and salvage rubble.",
            "station": "demolition_site",
            "time_to_craft": 10.0,
            "output_item": "concrete_rubble",
            "output_amount": 5,
            "required_items": {"concrete_block": 2},
            "required_tool": "sledgehammer",
            "tool_durability_cost": 25
        },
        {
            "id": "destroy_architecture",
            "tool_required": "sledgehammer",
            "name": "Destroy Architecture",
            "category": "demolition",
            "description": "Break down large architectural structures.",
            "station": "demolition_site",
            "time_to_craft": 15.0,
            "output_item": "building_rubble",
            "output_amount": 8,
            "required_items": {"stone_structure": 1},
            "required_tool": "sledgehammer",
            "tool_durability_cost": 30,
            "rarity": "rare"
        },
        {
            "id": "break_foundation",
            "tool_required": "sledgehammer",
            "name": "Break Foundation",
            "category": "demolition",
            "description": "Demolish concrete foundations for materials.",
            "station": "demolition_site",
            "time_to_craft": 20.0,
            "output_item": "concrete_chunks",
            "output_amount": 12,
            "required_items": {"foundation_block": 3},
            "required_tool": "sledgehammer",
            "tool_durability_cost": 35,
            "rarity": "rare"
        },
        {
            "id": "crush_stone",
            "tool_required": "sledgehammer",
            "name": "Crush Stone",
            "category": "processing",
            "description": "Break large stones into gravel and usable pieces.",
            "station": "workbench",
            "time_to_craft": 8.0,
            "output_item": "gravel",
            "output_amount": 6,
            "required_items": {"raw_stone": 2},
            "required_tool": "sledgehammer",
            "tool_durability_cost": 12
        }
    ]

    for recipe_data in recipes:
        var recipe = _build_recipe(recipe_data)
        sledgehammer_recipes[recipe.id] = recipe
        recipe_registered.emit("sledgehammer", recipe.id)

func _register_hammer_recipes() -> void:
    var recipes = [
        {
            "id": "build_basic_structure",
            "tool_required": "hammer",
            "name": "Build Basic Structure",
            "category": "building",
            "description": "Construct a simple wooden structure from materials.",
            "station": "construction_table",
            "time_to_craft": 14.0,
            "output_item": "basic_structure",
            "output_amount": 1,
            "required_items": {"wood_planks": 6, "nails": 8, "rope": 2},
            "required_tool": "hammer",
            "tool_durability_cost": 18
        },
        {
            "id": "upgrade_structure",
            "tool_required": "hammer",
            "name": "Upgrade Structure",
            "category": "upgrade",
            "description": "Reinforce an existing structure for durability.",
            "station": "construction_table",
            "time_to_craft": 10.0,
            "output_item": "reinforced_structure",
            "output_amount": 1,
            "required_items": {"existing_structure": 1, "metal_scrap": 3, "nails": 6},
            "required_tool": "hammer",
            "tool_durability_cost": 15
        },
        {
            "id": "nail_frame",
            "tool_required": "hammer",
            "name": "Nail Frame",
            "category": "assembly",
            "description": "Assemble wooden frames with nails.",
            "station": "workbench",
            "time_to_craft": 6.0,
            "output_item": "nailed_frame",
            "output_amount": 1,
            "required_items": {"wooden_frame": 1, "nails": 12},
            "required_tool": "hammer",
            "tool_durability_cost": 10
        },
        {
            "id": "build_shelter",
            "tool_required": "hammer",
            "name": "Build Shelter",
            "category": "building",
            "description": "Construct a complete survival shelter.",
            "station": "construction_table",
            "time_to_craft": 25.0,
            "output_item": "survival_shelter",
            "output_amount": 1,
            "required_items": {"wooden_frame": 2, "cloth": 4, "nails": 16, "rope": 4},
            "required_tool": "hammer",
            "tool_durability_cost": 25,
            "rarity": "rare"
        },
        {
            "id": "build_reinforced_wall",
            "tool_required": "hammer",
            "name": "Build Reinforced Wall",
            "category": "building",
            "description": "Construct a sturdy defensive wall.",
            "station": "construction_table",
            "time_to_craft": 18.0,
            "output_item": "reinforced_wall",
            "output_amount": 1,
            "required_items": {"wood_planks": 8, "metal_scrap": 4, "nails": 20},
            "required_tool": "hammer",
            "tool_durability_cost": 20,
            "rarity": "uncommon"
        }
    ]

    for recipe_data in recipes:
        var recipe = _build_recipe(recipe_data)
        hammer_recipes[recipe.id] = recipe
        recipe_registered.emit("hammer", recipe.id)

func _build_recipe(recipe_data: Dictionary) -> CraftingRecipe:
    var recipe = CraftingRecipe.new()
    recipe.id = recipe_data.get("id", "")
    recipe.name = recipe_data.get("name", "")
    recipe.category = recipe_data.get("category", "crafting")
    recipe.description = recipe_data.get("description", "")
    recipe.station = recipe_data.get("station", "workbench")
    recipe.time_to_craft = recipe_data.get("time_to_craft", 5.0)
    recipe.output_item = recipe_data.get("output_item", "")
    recipe.output_amount = recipe_data.get("output_amount", 1)
    recipe.required_items = recipe_data.get("required_items", {})
    recipe.rarity = recipe_data.get("rarity", "common")
    return recipe

func get_recipes_for_tool(tool_id: String) -> Array:
    match tool_id:
        "saw":
            return saw_recipes.values()
        "sledgehammer":
            return sledgehammer_recipes.values()
        "hammer":
            return hammer_recipes.values()
        _:
            return []

func get_recipe_for_tool(tool_id: String, recipe_id: String) -> CraftingRecipe:
    match tool_id:
        "saw":
            return saw_recipes.get(recipe_id, null)
        "sledgehammer":
            return sledgehammer_recipes.get(recipe_id, null)
        "hammer":
            return hammer_recipes.get(recipe_id, null)
        _:
            return null

func get_all_tool_recipes() -> Dictionary:
    return {
        "saw": saw_recipes,
        "sledgehammer": sledgehammer_recipes,
        "hammer": hammer_recipes
    }
