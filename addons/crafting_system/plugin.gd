@tool
extends EditorPlugin

const PLUGIN_PATH = "res://addons/crafting_system/"

var crafting_window_script = preload("res://addons/crafting_system/ui/crafting_window.gd")

func _enter_tree() -> void:
    add_custom_type("CraftingWindow", "PanelContainer", crafting_window_script, null)
    print("Godot Crafting System plugin enabled.")

func _exit_tree() -> void:
    remove_custom_type("CraftingWindow")
    print("Godot Crafting System plugin disabled.")
