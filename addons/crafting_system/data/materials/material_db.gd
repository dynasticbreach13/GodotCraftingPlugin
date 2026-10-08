extends Node
class_name CraftingAssetCatalog

static func get_materials() -> Dictionary:
    return {
        "wood": {"name": "Wood", "rarity": "common"},
        "metal_scrap": {"name": "Metal Scrap", "rarity": "common"},
        "rope": {"name": "Rope", "rarity": "common"},
        "cloth": {"name": "Cloth", "rarity": "common"},
        "charcoal": {"name": "Charcoal", "rarity": "common"},
        "stone": {"name": "Stone", "rarity": "common"},
        "herbs": {"name": "Herbs", "rarity": "common"},
        "powder": {"name": "Powder", "rarity": "common"},
        "casing": {"name": "Casing", "rarity": "common"},
        "brick": {"name": "Brick", "rarity": "common"},
        "glue": {"name": "Glue", "rarity": "common"}
    }
