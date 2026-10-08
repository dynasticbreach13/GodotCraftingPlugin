extends PanelContainer
class_name CraftingWindow

var recipe_db: CraftingRecipeDB
var crafting_engine: CraftingEngine
var current_recipe: CraftingRecipe
var inventory: Dictionary = {}

var root_vbox: VBoxContainer
var recipe_panel: PanelContainer
var recipe_list_container: VBoxContainer
var ingredient_panel: VBoxContainer
var output_panel: VBoxContainer
var status_panel: VBoxContainer

func _ready() -> void:
    build_ui()
    setup_systems()

func setup_inventory(data: Dictionary) -> void:
    inventory = data
    if crafting_engine:
        crafting_engine.set_inventory(inventory)

func build_ui() -> void:
    root_vbox = VBoxContainer.new()
    add_child(root_vbox)

    var title = Label.new()
    title.text = "Crafting"
    title.add_theme_font_size_override("font_size", 22)
    root_vbox.add_child(title)

    var content_row = HBoxContainer.new()
    root_vbox.add_child(content_row)

    recipe_panel = PanelContainer.new()
    recipe_panel.custom_minimum_size = Vector2(220, 320)
    content_row.add_child(recipe_panel)

    var recipe_vbox = VBoxContainer.new()
    recipe_panel.add_child(recipe_vbox)

    var recipe_label = Label.new()
    recipe_label.text = "Recipes"
    recipe_vbox.add_child(recipe_label)

    var scroll = ScrollContainer.new()
    recipe_vbox.add_child(scroll)

    recipe_list_container = VBoxContainer.new()
    scroll.add_child(recipe_list_container)

    ingredient_panel = VBoxContainer.new()
    ingredient_panel.size_flags_horizontal = Control.SIZE_EXPAND_FILL
    ingredient_panel.custom_minimum_size = Vector2(260, 180)
    content_row.add_child(ingredient_panel)

    output_panel = VBoxContainer.new()
    output_panel.size_flags_horizontal = Control.SIZE_EXPAND_FILL
    output_panel.custom_minimum_size = Vector2(220, 180)
    content_row.add_child(output_panel)

    status_panel = VBoxContainer.new()
    status_panel.custom_minimum_size = Vector2(220, 180)
    root_vbox.add_child(status_panel)

func setup_systems() -> void:
    recipe_db = CraftingRecipeDB.new()
    add_child(recipe_db)

    crafting_engine = CraftingEngine.new()
    add_child(crafting_engine)
    crafting_engine.set_inventory(inventory)

    refresh_recipe_list()

func refresh_recipe_list() -> void:
    for child in recipe_list_container.get_children():
        child.queue_free()

    for recipe in recipe_db.get_all_recipes():
        var button = Button.new()
        button.text = recipe.name
        button.pressed.connect(_on_recipe_selected.bind(recipe.id))
        recipe_list_container.add_child(button)

func _on_recipe_selected(recipe_id: String) -> void:
    current_recipe = recipe_db.get_recipe(recipe_id)
    if current_recipe == null:
        return
    show_recipe_details(current_recipe)

func show_recipe_details(recipe: CraftingRecipe) -> void:
    for child in ingredient_panel.get_children():
        child.queue_free()

    for child in output_panel.get_children():
        child.queue_free()

    var ingredients_title = Label.new()
    ingredients_title.text = "Required Materials"
    ingredient_panel.add_child(ingredients_title)

    for item_id in recipe.required_items.keys():
        var label = Label.new()
        label.text = "%s: %s" % [item_id, recipe.required_items[item_id]]
        ingredient_panel.add_child(label)

    var result_title = Label.new()
    result_title.text = "Output"
    output_panel.add_child(result_title)

    var output_label = Label.new()
    output_label.text = "%s x%s" % [recipe.output_item, recipe.output_amount]
    output_panel.add_child(output_label)

    var craft_button = Button.new()
    craft_button.text = "Craft"
    craft_button.pressed.connect(_on_craft_pressed.bind(recipe.id))
    output_panel.add_child(craft_button)

func _on_craft_pressed(recipe_id: String) -> void:
    var recipe = recipe_db.get_recipe(recipe_id)
    if recipe == null:
        return

    if crafting_engine.can_craft(recipe):
        var success = crafting_engine.try_craft(recipe_id)
        if success:
            push_status("Crafted %s" % recipe.name)
            inventory = crafting_engine.inventory
        else:
            push_status("Failed to craft %s" % recipe.name)
    else:
        push_status("Missing materials for %s" % recipe.name)

func push_status(message: String) -> void:
    var label = Label.new()
    label.text = message
    status_panel.add_child(label)

    while status_panel.get_child_count() > 6:
        var old_child = status_panel.get_child(0)
        if old_child != null:
            old_child.queue_free()
