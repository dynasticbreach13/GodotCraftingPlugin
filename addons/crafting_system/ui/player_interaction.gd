extends Node
class_name PlayerCraftingInteractor

@export var interaction_range: float = 3.0
@export var player_node: NodePath

var active_station: CraftingStation
var player_reference: Node

func _ready() -> void:
    if player_node:
        player_reference = get_node(player_node)
    _refresh_station()

func _process(_delta: float) -> void:
    if player_reference == null:
        return

    var nearest_station = find_nearest_station()
    active_station = nearest_station

    if nearest_station != null:
        if Input.is_action_just_pressed("ui_accept"):
            nearest_station.toggle_station()

func find_nearest_station() -> CraftingStation:
    var nearest: CraftingStation = null
    var nearest_distance: float = INF

    var stations = get_tree().get_nodes_in_group("crafting_station")
    for station in stations:
        if station is CraftingStation:
            var target = station as CraftingStation
            var distance = player_reference.global_position.distance_to(target.global_position)
            if distance <= interaction_range and distance < nearest_distance:
                nearest = target
                nearest_distance = distance

    return nearest

func _refresh_station() -> void:
    var stations = get_tree().get_nodes_in_group("crafting_station")
    if stations.size() > 0:
        active_station = stations[0] as CraftingStation
