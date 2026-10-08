extends Node
class_name CraftingEngine

var recipe_db: CraftingRecipeDB
var inventory: Dictionary = {}

signal crafting_started(recipe_id: String)
signal crafting_completed(recipe_id: String, output_amount: int)
signal crafting_failed(recipe_id: String, reason: String)

func _ready() -> void:
    recipe_db = CraftingRecipeDB.new()
    add_child(recipe_db)

func set_inventory(data: Dictionary) -> void:
    inventory = data

func can_craft(recipe: CraftingRecipe) -> bool:
    if recipe == null:
        return false

    for key in recipe.required_items.keys():
        if not inventory.has(key):
            return false
        if inventory[key] < recipe.required_items[key]:
            return false

    return true

func try_craft(recipe_id: String) -> bool:
    var recipe = recipe_db.get_recipe(recipe_id)
    if recipe == null:
        emit_signal("crafting_failed", recipe_id, "recipe_not_found")
        return false

    if not can_craft(recipe):
        emit_signal("crafting_failed", recipe_id, "missing_resources")
        return false

    emit_signal("crafting_started", recipe_id)

    for key in recipe.required_items.keys():
        inventory[key] -= recipe.required_items[key]

    if inventory.has(recipe.output_item):
        inventory[recipe.output_item] += recipe.output_amount
    else:
        inventory[recipe.output_item] = recipe.output_amount

    emit_signal("crafting_completed", recipe_id, recipe.output_amount)
    return true
