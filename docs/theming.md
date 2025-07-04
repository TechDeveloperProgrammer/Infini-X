
# Theming

This section provides a comprehensive guide to the theming capabilities within the Infini-X monorepo, focusing on how to customize the visual appearance of your system and applications.

## Overview

Infini-X offers a modular and flexible theming system, allowing you to personalize your desktop environment, web interface, and even terminal colors. Our approach is inspired by `HyDE-Project/HyDE`, aiming for a unified theming experience across different components.

## Theming Philosophy

-   **Consistency**: Maintain a consistent visual style across all Infini-X components.
-   **Modularity**: Themes are broken down into smaller, manageable units, making it easy to create, modify, and share them.
-   **Centralized Management**: Leverage `hyde-cli` for a unified way to apply and manage themes.
-   **Extensibility**: Easy to add support for new applications or desktop environments.

## The `themes/` Directory Structure

The `themes/` directory is the central repository for all visual themes:

```
themes/
├── README.md
├── desktop/                # Themes for traditional desktop environments (GTK, Qt)
│   └── gtk/
│       └── infini-x-dark/  # Example GTK theme
│           ├── gtk-3.0/
│           └── gtk-4.0/
├── hyde-themes/            # Themes managed by `hyde-cli`
│   ├── dark-catppuccin/    # Example HyDE theme
│   │   ├── hyprland/
│   │   ├── gtk/
│   │   ├── terminal/
│   │   ├── waybar/
│   │   └── theme.json
│   └── light-nord/         # Another example HyDE theme
│       ├── hyprland/
│       ├── gtk/
│       ├── waybar/
│       └── theme.json
├── terminal/               # Terminal color schemes (e.g., for Kitty)
└── web/                    # Web application themes (e.g., custom CSS for React app)
```

### `hyde-themes/`

This subdirectory is the core of our unified theming approach. Each folder within `hyde-themes/` represents a complete theme that can be applied across multiple components. A `theme.json` file within each theme defines its metadata and specifies which configuration files apply to which components.

**`theme.json` Example (`themes/hyde-themes/dark-catppuccin/theme.json`)**:

```json
{
  "name": "Dark Catppuccin",
  "author": "Infini-X Team",
  "version": "1.0.0",
  "description": "A dark theme inspired by Catppuccin Frappe for Infini-X components.",
  "components": {
    "hyprland": {
      "config_file": "hyprland/colors.conf"
    },
    "waybar": {
      "style_file": "waybar/style.css"
    },
    "gtk": {
      "gtk3_css": "gtk/gtk.css",
      "gtk4_css": "gtk/gtk.css"
    },
    "terminal": {
      "kitty_config": "terminal/kitty.conf"
    }
  }
}
```

This structure allows `hyde-cli` to read the `theme.json` and apply the specified configuration files to their correct locations (e.g., symlinking `hyprland/colors.conf` to `~/.config/hypr/colors.conf`).

## Applying Themes with `hyde-cli`

The recommended way to apply themes is using the `hyde-cli` tool:

```bash
./scripts/hyde-cli.sh theme apply <theme_name>
```

**Example**:

```bash
./scripts/hyde-cli.sh theme apply dark-catppuccin
```

This command will:
1.  Read the `theme.json` for `dark-catppuccin`.
2.  Copy or symlink the specified configuration files (e.g., `hyprland/colors.conf`, `waybar/style.css`, `gtk/gtk.css`, `terminal/kitty.conf`) to their respective system-wide or user-specific configuration directories.
3.  (Conceptually) Trigger reloads for applications like Hyprland and Waybar to apply the new theme instantly.

To list available themes:

```bash
./scripts/hyde-cli.sh theme list
```

## Manual Theming

For components not yet integrated with `hyde-cli` or for direct customization, you can manually apply themes by copying or symlinking the relevant files from the `themes/` directory to their respective configuration locations (e.g., `~/.config/gtk-3.0/`, `~/.config/kitty/`).

## Further Development

-   **Full `hyde-cli` Integration**: Implement the complete logic within `hyde-cli` to parse `theme.json` and apply all theme components robustly.
-   **Theme Creation Guide**: Provide a detailed guide on how to create new themes for Infini-X, including best practices for each component.
-   **Real-time Theme Switching**: Explore mechanisms for instant theme switching without requiring application restarts.
-   **Theme Gallery**: Develop a web-based theme gallery for browsing and installing themes.
-   **Automated Theme Testing**: Implement tests to ensure themes are applied correctly and do not break application functionality.
