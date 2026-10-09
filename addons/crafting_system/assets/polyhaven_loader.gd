extends Node
class_name PolyHavenAssetLoader

# PolyHaven CC0 Models - Tools & Equipment
# Direct download URLs from https://polyhaven.com/models/tools-equipment

const POLYHAVEN_BASE = "https://dl.polyhaven.com/file/ph-assets/models/free/"

var loaded_models: Dictionary = {}
var loading_queue: Array = []
var is_loading: bool = false

static var TOOL_MANIFEST = {
    "saw": {
        "name": "Hand Saw",
        "model_id": "hand_saw_01",
        "category": "cutting_tool",
        "description": "Used for cutting wood and salvaging architectural materials.",
        "scale": Vector3(1.0, 1.0, 1.0),
        "preview_rotation": Vector3(0.0, 0.0, 0.0)
    },
    "sledgehammer": {
        "name": "Sledgehammer",
        "model_id": "sledgehammer_01",
        "category": "breaking_tool",
        "description": "Heavy demolition tool for concrete and structures.",
        "scale": Vector3(1.2, 1.2, 1.2),
        "preview_rotation": Vector3(0.0, PI / 4.0, 0.0)
    },
    "hammer": {
        "name": "Claw Hammer",
        "model_id": "claw_hammer_01",
        "category": "building_tool",
        "description": "General construction and structure upgrade tool.",
        "scale": Vector3(0.9, 0.9, 0.9),
        "preview_rotation": Vector3(0.0, 0.0, 0.0)
    }
}

func _ready() -> void:
    print("PolyHaven Asset Loader initialized.")

func load_tool_model(tool_id: String) -> Node3D:
    if not TOOL_MANIFEST.has(tool_id):
        push_error("Tool ID not found: %s" % tool_id)
        return null

    if loaded_models.has(tool_id):
        return loaded_models[tool_id].duplicate()

    var tool_data = TOOL_MANIFEST[tool_id]
    var model = _create_placeholder_tool(tool_id, tool_data)
    loaded_models[tool_id] = model
    return model.duplicate()

func _create_placeholder_tool(tool_id: String, tool_data: Dictionary) -> Node3D:
    var root = Node3D.new()
    root.name = tool_data["name"]

    var mesh_instance = MeshInstance3D.new()
    var mesh = BoxMesh.new()
    mesh_instance.mesh = mesh
    root.add_child(mesh_instance)

    # Visual differentiation by tool type
    match tool_id:
        "saw":
            mesh.size = Vector3(0.1, 2.0, 0.05)
            mesh_instance.material_override = _create_material(Color.GRAY)
        "sledgehammer":
            mesh.size = Vector3(0.3, 2.2, 0.3)
            mesh_instance.material_override = _create_material(Color.DARK_GRAY)
        "hammer":
            mesh.size = Vector3(0.15, 1.8, 0.15)
            mesh_instance.material_override = _create_material(Color.GRAY)

    root.scale = tool_data["scale"]
    root.rotation = tool_data["preview_rotation"]

    return root

func _create_material(color: Color) -> StandardMaterial3D:
    var material = StandardMaterial3D.new()
    material.albedo_color = color
    material.metallic = 0.5
    material.roughness = 0.4
    return material

func get_tool_info(tool_id: String) -> Dictionary:
    if TOOL_MANIFEST.has(tool_id):
        return TOOL_MANIFEST[tool_id].duplicate()
    return {}

func get_all_tools() -> Array:
    var tools = []
    for tool_id in TOOL_MANIFEST.keys():
        tools.append(tool_id)
    return tools
