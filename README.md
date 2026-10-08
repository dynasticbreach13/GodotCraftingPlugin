# GodotCraftingPlugin

A highly graphic, game-ready, animated crafting system for Godot Engine. Built for survival games, SHTF worlds, RPGs, zombie survival games, and crafting-heavy sims. Designed to be flexible, visually rich, and accessibility-conscious for players who need clearer interfaces and lower eye strain.

This project follows a philosophy of open-source modular design with custom tweaks: MIT licensed code, CC0-friendly visual assets, and a strong foundation inspired by classic software interfaces from the 90s and early 2000s.

---

## Project Vision

### Goal
Create a crafting system that feels premium and immersive, while staying practical for game production. This plugin is intended to support:

- SHTF / post-apocalypse survival games
- RPG crafting loops
- Zombie survival gameplay
- Base building and resource gathering
- Survival sim and sandbox worlds
- Accessible UI for visually impaired players

### Design Priorities
- High-quality visual presentation
- Smooth crafting animations
- Modular architecture
- Easy integration into any Godot project
- Strong UI clarity and low-eye-strain layouts
- Easy extensibility with new recipes, tools, and item progression

---

## Why This System Exists

This crafting plugin is built to serve the kind of survival game design that feels tangible and rewarding:

- Gather resources
- Turn raw materials into functional equipment
- Build shelters, utility stations, and tools
- Progress from scavenger to engineer
- Craft in a world that feels alive and industrial

The goal is not just to create a recipe system, but to create a full crafting experience that supports atmosphere, progression, and utility.

---

## Past: Foundational Inspiration

The design language of this project borrows from classic software interfaces that emphasized clarity, layered functionality, and user control.

### 90s and early 2000s foundations
- Winamp-style floating windows and collapsible panels
- Photoshop-like toolbars and isolated utility panels
- Civilization-style grid logic and inventory organization
- Classic RPG interfaces with clear text, tactical grouping, and readable layouts
- Studio/utility software workflows that prioritized focus and control

These systems taught a valuable lesson: a powerful interface can remain readable even when dense. That principle is critical for crafting systems in survival games, where players need to manage many moving parts without visual fatigue.

### Legacy software lessons applied here
- Clear divisions between inventory, recipe list, action queue, and result preview
- Isolated popup windows instead of cluttered full-screen overlays
- Logical grouping of relevant controls to reduce noise
- Strong visual hierarchy for person with low vision, reduced contrast sensitivity, or eye strain

---

## Present: What the Plugin Is Designed to Include

The current project direction supports a comprehensive crafting ecosystem with the following features:

### Core crafting features
- Crafting recipe database
- Ingredient validation
- Output item generation
- Crafting queue or progress loop
- Recipe filtering by category or materials
- Crafting station type support

### Visual and gameplay features
- 4K-ready assets and scalable UI
- Animated crafting benches, furnaces, anvils, and workstations
- Resource icons and item previews
- Seasonal or biome-specific recipe sets
- Loot-quality and rarity-based material flow

### Survival-game supporting systems
- Tools and repair systems
- Building and structure crafting
- Weapon and armor crafting
- Medicine and consumable crafting
- Ammo, traps, and defensive item creation
- Utility crafting for shelters and camps

### Accessibility-first UI choices
- Isolated pop-up windows to reduce eye clutter
- Large, readable UI elements
- High contrast and low-glare theme support
- Keyboard and controller navigation support
- Clear focus states and readable labels
- Customizable font scaling and panel size

---

## Future: Development Roadmap

### Phase 1 - Core Crafting Foundation
- Recipe manager
- Inventory integration
- Crafting engine
- Simple UI window
- Save and load support for recipe state

### Phase 2 - Visual Depth
- Animated crafting slots
- Progress bars and vibration/flash feedback
- Tool and station art
- Material textures and crafting result effects
- 4K-friendly responsive layout

### Phase 3 - Survival Systems Expansion
- Camp building recipes
- Resource processing chains
- Structure upgrades
- Repair and durability logic
- Tool progression and craftable specializations

### Phase 4 - Accessibility and UX Improvements
- Screen-reader-friendly labels and naming
- Optional reduced-motion mode
- Large-text interface mode
- Stronger contrast themes
- Pop-out crafting panel behavior

### Phase 5 - Universal Game Compatibility
- RPG integration
- Zombie survival module
- SHTF survival kit framework
- Sandbox sim support
- UE-like but Godot-native modular implementation

---

## Open Source and Licensing

### Licensing
- Core code: MIT License
- Visual assets: CC0-friendly public domain usage when possible
- Project remains open source and adjustable for custom game needs

### Originality and Remixing
This project is intentionally designed to be open and flexible. The system should be easy to:

- remix for a unique survival game
- tune to fit a specific genre
- modify for a custom art direction
- expand with player-specific quality-of-life improvements

The goal is not rigid gatekeeping, but practical modularity.

---

## Repository Structure

```text
GodotCraftingPlugin/
├── README.md
├── LICENSE
├── docs/
│   ├── architecture.md
│   ├── accessibility-guide.md
│   ├── recipe-system.md
│   └── roadmap.md
├── addons/
│   └── crafting_system/
│       ├── plugin.cfg
│       ├── plugin.gd
│       ├── core/
│       │   ├── crafting_engine.gd
│       │   ├── recipe_db.gd
│       │   ├── inventory_bridge.gd
│       │   └── serialization.gd
│       ├── ui/
│       │   ├── crafting_window.gd
│       │   ├── recipe_list.gd
│       │   ├── material_panel.gd
│       │   └── accessibility_theme.gd
│       ├── assets/
│       │   ├── tools/
│       │   ├── materials/
│       │   └── ui/
│       └── examples/
│           ├── example_recipes.gd
│           └── demo_scene.tscn
├── tests/
│   ├── crafting_engine_test.gd
│   └── recipe_db_test.gd
└── CHANGELOG.md
```

---

## Suggested Core Systems

### 1. Crafting Engine
Handles recipe validation, item generation, queue progression, and output logic.

### 2. Recipe Database
Stores all item recipes, categories, required materials, crafting times, and station requirements.

### 3. Inventory Bridge
Links material inputs and inventory slots to crafting logic.

### 4. Crafting UI
Includes a focused floating window, recipe list, ingredient panel, output preview, and crafting animation layer.

### 5. Accessibility Layer
Adds large visible states, keyboard support, reduced motion toggles, high-contrast themes, and isolated menu windows for clarity.

---

## Example Philosophy for Gameplay Feel

A good survival crafting menu should feel like a real workshop.

- Gather scrap, wood, cloth, metal, and food
- Convert them into practical gear
- Build tools and barricades
- Progress from primitive survival to organized settlement building
- Add player-driven crafting loops that make resources feel meaningful

This project aims to support that rhythm in a robust and visually rich Godot implementation.

---

## Development Notes

This system is best built as a modular plugin rather than a single monolithic script. That allows:

- clean integration into many game prototypes
- swapping out UI themes
- expanding into different game genres
- keeping logic separate from presentation
- creating custom asset packs without breaking the engine

This approach also helps maintain accessibility: you can improve the UI layer without rewriting the entire crafting logic.

---

## Contribution Direction

Contributions are welcome in areas such as:

- recipe balancing
- craftables and progression design
- accessible UI improvements
- animated crafting transitions
- survival game integration examples
- material database expansion
- Godot 4 compatibility and optimization

The project should remain welcoming, practical, and useful for both ambitious indie developers and players who value accessible design.

---

## Summary

GodotCraftingPlugin is intended to become a strong, polished, and open-source crafting framework for survival and RPG games. It blends practical game systems with strong visual identity and accessibility-focused UI design.

The core goal is to create a crafting experience that feels immersive, readable, and functional across genres such as:

- survival sim
- zombie apocalypse
- RPG progression
- SHTF and settlement building
- resource-driven sandbox play

This project is designed to honor the clarity of traditional interfaces, the energy of 90s and early 2000s software design, and the practical needs of modern Godot players.

---

## License

This project is released under the MIT License.

See [LICENSE](LICENSE) for details.

---

## Future Note

This repository is intended to evolve from a concept into a practical modular crafting plugin, with future files and systems added as the project matures. The long-term goal is a highly usable, art-forward, and accessible set of tools for Godot game developers.
