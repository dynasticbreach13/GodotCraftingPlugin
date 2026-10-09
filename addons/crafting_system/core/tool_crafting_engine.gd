extends Node
class_name ToolCraftingEngine

# Extended crafting engine that integrates tools and recipes
# Handles tool-specific crafting workflows

var recipe_db: CraftingRecipeDB
var tool_recipe_system: ToolRecipeSystem
var durability_manager: ToolDurabilityManager
var inventory: Dictionary = {}
var equipped_tool: String = ""

signal crafting_started(tool_id: String, recipe_id: String)
signal crafting_completed(tool_id: String, recipe_id: String, output_amount: int)
signal crafting_failed(tool_id: String, recipe_id: String, reason: String)
signal tool_equipped(tool_id: String)
signal tool_broke_during_crafting(tool_id: String)

func _ready() -> void:
    recipe_db = CraftingRecipeDB.new()
    add_child(recipe_db)

    tool_recipe_system = ToolRecipeSystem.new()
    add_child(tool_recipe_system)

    durability_manager = ToolDurabilityManager.new()
    add_child(durability_manager)

func set_inventory(data: Dictionary) -> void:
    inventory = data

func equip_tool(tool_id: String) -> bool:
    if inventory.get(tool_id, 0) > 0:
        equipped_tool = tool_id
        tool_equipped.emit(tool_id)
        return true
    return false

func get_equipped_tool() -> String:
    return equipped_tool

func can_craft_with_tool(tool_id: String, recipe: CraftingRecipe) -> bool:
    if recipe == null:
        return false

    if not durability_manager.is_tool_usable(tool_id):
        return false

    for key in recipe.required_items.keys():
        if not inventory.has(key):
            return false
        if inventory[key] < recipe.required_items[key]:
            return false

    return true

func try_craft_with_tool(tool_id: String, recipe_id: String) -> bool:
    var recipe = tool_recipe_system.get_recipe_for_tool(tool_id, recipe_id)
    if recipe == null:
        emit_signal("crafting_failed", tool_id, recipe_id, "recipe_not_found")
        return false

    if not can_craft_with_tool(tool_id, recipe):
        emit_signal("crafting_failed", tool_id, recipe_id, "missing_resources")
        return false

    emit_signal("crafting_started", tool_id, recipe_id)

    for key in recipe.required_items.keys():
        inventory[key] -= recipe.required_items[key]

    if inventory.has(recipe.output_item):
        inventory[recipe.output_item] += recipe.output_amount
    else:
        inventory[recipe.output_item] = recipe.output_amount

    var durability_cost = 10.0
    if durability_manager.damage_tool(tool_id, durability_cost):
        emit_signal("crafting_completed", tool_id, recipe_id, recipe.output_amount)
        return true
    else:
        tool_broke_during_crafting.emit(tool_id)
        return false

func get_available_recipes_for_tool(tool_id: String) -> Array:
    return tool_recipe_system.get_recipes_for_tool(tool_id)
