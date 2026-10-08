extends Node
class_name InventoryBridge

var inventory_data: Dictionary = {}

func register_inventory(data: Dictionary) -> void:
    inventory_data = data

func get_item_count(item_id: String) -> int:
    return inventory_data.get(item_id, 0)

func consume_requirements(requirements: Dictionary) -> bool:
    for item_id in requirements.keys():
        if inventory_data.get(item_id, 0) < requirements[item_id]:
            return false

    for item_id in requirements.keys():
        var count = inventory_data.get(item_id, 0) - requirements[item_id]
        inventory_data[item_id] = count

    return true
