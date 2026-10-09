extends Node
class_name CraftingStation

@export var station_name: String = "Workbench"
@export var station_type: String = "workbench"
@export var interaction_range: float = 3.0
@export var can_open: bool = true

var crafting_window: CraftingWindow
var recipe_db: CraftingRecipeDB
var engine: CraftingEngine
var default_inventory: Dictionary = {
    "wood": 12,
    "metal_scrap": 8,
    "rope": 5,
    "cloth": 6,
    "charcoal": 4,
    "stone": 7,
    "herbs": 3,
    "powder": 2,
    "casing": 4,
    "brick": 3,
    "glue": 2
}

signal station_opened
signal station_closed
signal station_used

func _ready() -> void:
    setup_station()
    hide_window()

func setup_station() -> void:
    recipe_db = CraftingRecipeDB.new()
    add_child(recipe_db)

    engine = CraftingEngine.new()
    add_child(engine)
    engine.set_inventory(default_inventory)

    crafting_window = CraftingWindow.new()
    crafting_window.name = "CraftingWindow"
    crafting_window.visible = false
    add_child(crafting_window)
    crafting_window.setup_inventory(default_inventory)

func open_station() -> void:
    if not can_open:
        return
    if crafting_window:
        crafting_window.visible = true
        crafting_window.set_process(true)
        station_opened.emit()
        station_used.emit()

func close_station() -> void:
    if crafting_window:
        crafting_window.visible = false
        crafting_window.set_process(false)
        station_closed.emit()

func hide_window() -> void:
    close_station()

func toggle_station() -> void:
    if crafting_window and crafting_window.visible:
        close_station()
    else:
        open_station()
