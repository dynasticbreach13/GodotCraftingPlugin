extends Resource
class_name CraftingRecipe

@export var id: String = ""
@export var name: String = ""
@export var category: String = "survival"
@export var description: String = ""
@export var station: String = "workbench"
@export var time_to_craft: float = 2.0
@export var output_item: String = ""
@export var output_amount: int = 1
@export var required_items: Dictionary = {}
@export var rarity: String = "common"
@export var icon_path: String = ""
@export var tags: Array = []

func _init(p_id: String = "", p_name: String = "", p_category: String = "survival") -> void:
    id = p_id
    name = p_name
    category = p_category
