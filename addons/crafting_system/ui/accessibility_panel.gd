extends PanelContainer
class_name AccessibilityPanel

@export var high_contrast: bool = true
@export var reduce_motion: bool = false
@export var large_text_mode: bool = true

var vbox: VBoxContainer
var high_contrast_toggle: CheckBox
var motion_toggle: CheckBox
var text_size_toggle: CheckBox

signal settings_changed(high_contrast: bool, reduce_motion: bool, large_text_mode: bool)

func _ready() -> void:
    build_panel()
    apply_settings()

func build_panel() -> void:
    vbox = VBoxContainer.new()
    add_child(vbox)

    var title = Label.new()
    title.text = "Accessibility"
    title.add_theme_font_size_override("font_size", 20)
    vbox.add_child(title)

    high_contrast_toggle = CheckBox.new()
    high_contrast_toggle.text = "High Contrast"
    high_contrast_toggle.button_pressed = high_contrast
    high_contrast_toggle.toggled.connect(_on_high_contrast_toggled)
    vbox.add_child(high_contrast_toggle)

    motion_toggle = CheckBox.new()
    motion_toggle.text = "Reduce Motion"
    motion_toggle.button_pressed = reduce_motion
    motion_toggle.toggled.connect(_on_motion_toggled)
    vbox.add_child(motion_toggle)

    text_size_toggle = CheckBox.new()
    text_size_toggle.text = "Large Text"
    text_size_toggle.button_pressed = large_text_mode
    text_size_toggle.toggled.connect(_on_text_toggled)
    vbox.add_child(text_size_toggle)

func _on_high_contrast_toggled(value: bool) -> void:
    high_contrast = value
    apply_settings()
    settings_changed.emit(high_contrast, reduce_motion, large_text_mode)

func _on_motion_toggled(value: bool) -> void:
    reduce_motion = value
    apply_settings()
    settings_changed.emit(high_contrast, reduce_motion, large_text_mode)

func _on_text_toggled(value: bool) -> void:
    large_text_mode = value
    apply_settings()
    settings_changed.emit(high_contrast, reduce_motion, large_text_mode)

func apply_settings() -> void:
    var theme = AccessibilityTheme.new()
    theme.high_contrast = high_contrast
    theme.reduced_motion = reduce_motion
    theme.large_text_mode = large_text_mode
    theme.apply_theme(self)

    for child in get_children():
        if child is Control:
            theme.apply_theme(child)
