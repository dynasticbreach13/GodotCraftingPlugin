extends Node
class_name CraftingSerialization

func save_inventory(path: String, inventory: Dictionary) -> void:
    var file = FileAccess.open(path, FileAccess.WRITE)
    if file == null:
        return
    file.store_var(inventory)
    file.close()

func load_inventory(path: String) -> Dictionary:
    if not FileAccess.file_exists(path):
        return {}

    var file = FileAccess.open(path, FileAccess.READ)
    if file == null:
        return {}

    var data = file.get_var()
    file.close()
    return data
