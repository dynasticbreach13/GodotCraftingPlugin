extends Node3D
class_name DemoCraftingScene

var crafting_station: CraftingStation
var interaction: PlayerCraftingInteractor
var player: Node3D
var ui_root: CanvasLayer

func _ready() -> void:
    _build_demo_scene()
    _setup_player()

func _build_demo_scene() -> void:
    crafting_station = CraftingStation.new()
    crafting_station.station_name = "Camp Workbench"
    crafting_station.station_type = "workbench"
    crafting_station.name = "CampWorkbench"
    add_child(crafting_station)
    crafting_station.add_to_group("crafting_station")

    ui_root = CanvasLayer.new()
    add_child(ui_root)

    var panel = AccessibilityPanel.new()
    panel.name = "AccessibilityPanel"
    panel.custom_minimum_size = Vector2(220, 180)
    ui_root.add_child(panel)

func _setup_player() -> void:
    player = Node3D.new()
    player.name = "Player"
    add_child(player)

    interaction = PlayerCraftingInteractor.new()
    interaction.player_node = player.get_path()
    interaction.interaction_range = 3.0
    add_child(interaction)

    player.position = Vector3(0.0, 0.0, 0.0)
