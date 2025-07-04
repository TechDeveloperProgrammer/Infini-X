
# Infini-X HyDE Themes

This directory contains themes designed to be managed and applied via a `hyde-cli` like interface, inspired by `HyDE-Project/HyDE`.

## Structure
Each subdirectory within `hyde-themes/` represents a distinct theme. A theme typically consists of:
- `theme.json`: A metadata file describing the theme (name, author, version, components it affects).
- Subdirectories for specific components (e.g., `hyprland/`, `waybar/`, `gtk/`, `terminal/`) containing their respective configuration or styling files.

## Example: `dark-catppuccin`

```
hyde-themes/
├── dark-catppuccin/
│   ├── theme.json
│   ├── hyprland/
│   │   └── colors.conf
│   ├── waybar/
│   │   └── style.css
│   └── gtk/
│       └── gtk.css
└── light-nord/
    ├── theme.json
    ├── hyprland/
    │   └── colors.conf
    └── waybar/
        └── style.css
```

## Applying Themes
Themes are conceptually applied using the `hyde-cli` tool:

```bash
hyde-cli theme apply <theme_name>
```

This command would read the `theme.json` and apply the relevant configuration files to their respective locations (e.g., symlinking `hyprland/colors.conf` to `~/.config/hypr/colors.conf`).

## Further Development
- Define a comprehensive `theme.json` schema.
- Implement the `hyde-cli theme apply` logic to correctly parse `theme.json` and apply configurations.
- Create more complete example themes.
- Develop a `hyde-ipc` like mechanism for real-time theme switching.
