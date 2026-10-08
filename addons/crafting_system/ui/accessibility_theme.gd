extends Node
class_name AccessibilityTheme

var ui_scale: float = 1.0
var high_contrast: bool = true
var reduced_motion: bool = false
var large_text_mode: bool = true

func apply_theme(node: Control) -> void:
    if high_contrast:
        node.modulate = Color(1.0, 1.0, 1.0, 1.0)

    if large_text_mode:
        apply_large_text(node)

func apply_large_text(node: Control) -> void:
    for child in node.get_children():
        if child is Label:
            child.add_theme_font_size_override("font_size", 18)
        elif child is Button:
            child.add_theme_font_size_override("font_size", 18)

        if child is Control:
            apply_large_text(child)
