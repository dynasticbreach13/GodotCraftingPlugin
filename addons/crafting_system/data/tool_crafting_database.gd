extends Node
class_name ToolCraftingDatabase

# Comprehensive database of materials and outputs for each tool workflow

static var MATERIALS = {
    # Raw materials from nature
    "raw_wood": {"name": "Raw Wood", "category": "material", "rarity": "common"},
    "raw_stone": {"name": "Raw Stone", "category": "material", "rarity": "common"},
    "architectural_debris": {"name": "Architectural Debris", "category": "material", "rarity": "common"},
    "concrete_block": {"name": "Concrete Block", "category": "material", "rarity": "common"},
    "stone_structure": {"name": "Stone Structure", "category": "material", "rarity": "uncommon"},
    "foundation_block": {"name": "Foundation Block", "category": "material", "rarity": "uncommon"},

    # Processed materials (Saw outputs)
    "lumber": {"name": "Lumber", "category": "processed", "rarity": "common"},
    "wood_planks": {"name": "Wood Planks", "category": "processed", "rarity": "common"},
    "metal_salvage": {"name": "Metal Salvage", "category": "processed", "rarity": "uncommon"},

    # Demolition outputs (Sledgehammer outputs)
    "concrete_rubble": {"name": "Concrete Rubble", "category": "salvage", "rarity": "common"},
    "building_rubble": {"name": "Building Rubble", "category": "salvage", "rarity": "uncommon"},
    "concrete_chunks": {"name": "Concrete Chunks", "category": "salvage", "rarity": "uncommon"},
    "gravel": {"name": "Gravel", "category": "processed", "rarity": "common"},

    # Building components (Hammer outputs)
    "wooden_frame": {"name": "Wooden Frame", "category": "component", "rarity": "uncommon"},
    "nailed_frame": {"name": "Nailed Frame", "category": "component", "rarity": "uncommon"},
    "basic_structure": {"name": "Basic Structure", "category": "structure", "rarity": "uncommon"},
    "reinforced_structure": {"name": "Reinforced Structure", "category": "structure", "rarity": "rare"},
    "survival_shelter": {"name": "Survival Shelter", "category": "structure", "rarity": "rare"},
    "reinforced_wall": {"name": "Reinforced Wall", "category": "structure", "rarity": "rare"},

    # Existing structures for upgrades
    "existing_structure": {"name": "Existing Structure", "category": "structure", "rarity": "uncommon"},

    # Crafting supplies
    "nails": {"name": "Nails", "category": "supply", "rarity": "common"},
    "rope": {"name": "Rope", "category": "supply", "rarity": "common"},
    "metal_scrap": {"name": "Metal Scrap", "category": "supply", "rarity": "common"},
    "cloth": {"name": "Cloth", "category": "supply", "rarity": "common"}
}

static var TOOL_WORKFLOWS = {
    "saw": {
        "name": "Saw Workflow",
        "primary_function": "Cutting and Processing",
        "input_materials": ["raw_wood", "architectural_debris", "lumber"],
        "output_materials": ["lumber", "wood_planks", "metal_salvage", "wooden_frame"]
    },
    "sledgehammer": {
        "name": "Sledgehammer Workflow",
        "primary_function": "Demolition and Breaking",
        "input_materials": ["concrete_block", "stone_structure", "foundation_block", "raw_stone"],
        "output_materials": ["concrete_rubble", "building_rubble", "concrete_chunks", "gravel"]
    },
    "hammer": {
        "name": "Hammer Workflow",
        "primary_function": "Building and Assembly",
        "input_materials": ["wooden_frame", "wood_planks", "nails", "existing_structure"],
        "output_materials": ["basic_structure", "reinforced_structure", "survival_shelter", "reinforced_wall", "nailed_frame"]
    }
}

static func get_material_info(material_id: String) -> Dictionary:
    return MATERIALS.get(material_id, {})

static func get_tool_workflow(tool_id: String) -> Dictionary:
    return TOOL_WORKFLOWS.get(tool_id, {})

static func get_all_materials() -> Dictionary:
    return MATERIALS.duplicate()

static func get_all_workflows() -> Dictionary:
    return TOOL_WORKFLOWS.duplicate()
