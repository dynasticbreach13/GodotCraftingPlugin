# Recipe System Guide

## Core objective
The recipe system should support survival-game crafting loops that are intuitive, expandable, and readably structured.

## Recipe structure
Each recipe includes:
- id
- name
- category
- station
- description
- time_to_craft
- required_items
- output_item
- output_amount
- rarity

## Supported categories
- tool
- weapon
- medical
- utility
- building
- ammo

## Gameplay flow
1. Player opens crafting window.
2. Player selects a category or recipe.
3. System checks inventory for required materials.
4. If valid, craft starts and timer begins.
5. Items are consumed and output is added to inventory.
6. Feedback is shown in the status panel.

## Example recipe set
- Scrap Axe
- Wooden Spear
- Bandage
- Water Filter
- Basic Shelter
- Repair Kit
- Cooking Stove
- Pistol Ammo

## Best practices
- Keep recipe data in a separate data layer from UI logic.
- Keep simulation logic modular and testable.
- Use data dictionaries to define recipes cleanly.
- Support high-contrast and large-text modes through a dedicated theme object.
