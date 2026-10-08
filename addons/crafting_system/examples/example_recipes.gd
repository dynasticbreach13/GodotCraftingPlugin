extends Node

func _ready() -> void:
    pass

func get_example_recipes() -> Array:
    return [
        {
            "id": "bandage",
            "name": "Bandage",
            "category": "medical",
            "station": "camp_station",
            "time_to_craft": 2.0,
            "required_items": {"cloth": 2, "herbs": 1},
            "output_item": "bandage",
            "output_amount": 2
        },
        {
            "id": "water_filter",
            "name": "Water Filter",
            "category": "utility",
            "station": "camp_station",
            "time_to_craft": 4.5,
            "required_items": {"charcoal": 2, "metal_scrap": 2, "cloth": 1},
            "output_item": "water_filter",
            "output_amount": 1
        },
        {
            "id": "basic_shelter",
            "name": "Basic Shelter",
            "category": "building",
            "station": "construction_table",
            "time_to_craft": 18.0,
            "required_items": {"wood": 12, "cloth": 4, "rope": 3, "stone": 5},
            "output_item": "basic_shelter",
            "output_amount": 1
        },
        {
            "id": "scrap_axe",
            "name": "Scrap Axe",
            "category": "tool",
            "station": "workbench",
            "time_to_craft": 4.0,
            "required_items": {"wood": 2, "metal_scrap": 3, "rope": 1},
            "output_item": "scrap_axe",
            "output_amount": 1
        }
    ]
