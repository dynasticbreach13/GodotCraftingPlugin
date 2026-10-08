# Godot Crafting System UI Mockup Strategy

## Purpose
The UI should feel like classic productivity software from the 90s and early 2000s while remaining readable, modern, and accessible for visually impaired players.

## Design direction
- floating, isolated panels instead of cluttered full-screen overlays
- clear visual hierarchy
- strong high-contrast labels
- large text, large hit targets, and keyboard-friendly controls
- category-based left menu, details in the center, results to the right
- reduced motion optional mode

## Recommended layout

```text
┌──────────────────────────────┬────────────────────────────────────────┬──────────────────────┐
│ Recipe Categories           │ Item Details                            │ Output & Actions     │
│ - Tools                     │ Scrap Axe                               │ Result: Scrap Axe     │
│ - Weapons                  │ Workbench                               │ Materials:           │
│ - Medical                  │ wood x2                                 │ wood x2              │
│ - Utility                  │ metal_scrap x3                          │ metal_scrap x3       │
│ - Building                 │ rope x1                                 │ rope x1              │
│ - Ammo                     │ Time: 4s                                │ [Craft]              │
└──────────────────────────────┴────────────────────────────────────────┴──────────────────────┘
┌──────────────────────────────────────────────────────────────────────────────────────────────┐
│ Status / notifications / recipe queue / craft progress                                   │
│ Crafting Scrap Axe... 78%                                                                  │
│ Missing materials: 1 rope                                                                  │
└──────────────────────────────────────────────────────────────────────────────────────────────┘
```

## Accessibility rules
- Use dark charcoal backgrounds with light text and cyan/amber accents.
- Keep fonts large and readable.
- Use strong focus outlines for keyboard users.
- Keep panels isolated and visually separate to reduce eye strain.
- Provide a high-contrast mode and a reduced-motion mode.
- Ensure all text is readable without relying on color alone.

## Recommended palette
- background: #101417
- panel: #1d242b
- text: #edf4ff
- accent: #8cc7ff
- success: #7bde8c
- warning: #f4c95d
- error: #f26d6d

## Implementation notes
The plugin should expose a `CraftingWindow` node that can be placed inside any survival scene and styled at runtime with `AccessibilityTheme`.
