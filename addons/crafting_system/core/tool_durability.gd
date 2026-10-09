extends Node
class_name ToolDurabilityManager

# Tracks tool durability and wear
# Tools degrade with use and can be repaired

var tool_durability: Dictionary = {}
var max_durability: Dictionary = {
    "saw": 100.0,
    "sledgehammer": 150.0,
    "hammer": 120.0
}

signal tool_damaged(tool_id: String, durability_remaining: float)
signal tool_broken(tool_id: String)
signal tool_repaired(tool_id: String, durability_restored: float)

func _ready() -> void:
    _initialize_tools()

func _initialize_tools() -> void:
    for tool_id in max_durability.keys():
        tool_durability[tool_id] = max_durability[tool_id]

func damage_tool(tool_id: String, damage_amount: float) -> bool:
    if not tool_durability.has(tool_id):
        return false

    tool_durability[tool_id] -= damage_amount

    if tool_durability[tool_id] <= 0:
        tool_durability[tool_id] = 0
        tool_broken.emit(tool_id)
        return false
    else:
        tool_damaged.emit(tool_id, tool_durability[tool_id])
        return true

func get_tool_condition(tool_id: String) -> float:
    if not tool_durability.has(tool_id):
        return 0.0
    return tool_durability[tool_id] / max_durability[tool_id]

func repair_tool(tool_id: String, repair_amount: float) -> void:
    if not tool_durability.has(tool_id):
        return

    var old_durability = tool_durability[tool_id]
    tool_durability[tool_id] = min(tool_durability[tool_id] + repair_amount, max_durability[tool_id])
    var restored = tool_durability[tool_id] - old_durability
    tool_repaired.emit(tool_id, restored)

func is_tool_usable(tool_id: String) -> bool:
    return tool_durability.get(tool_id, 0) > 0

func get_tool_durability(tool_id: String) -> float:
    return tool_durability.get(tool_id, 0.0)
