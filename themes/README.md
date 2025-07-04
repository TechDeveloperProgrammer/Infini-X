# Infini-X Themes

This directory is designated for custom visual themes and styling assets used across various components of the Infini-X project. This could include themes for desktop environments (like GTK, Qt), web applications, or even terminal color schemes.

## Purpose
- **Unified Look and Feel**: Provides a centralized location to manage and distribute consistent visual styles.
- **Custom Branding**: Allows for easy customization of the project's aesthetic.
- **Modularity**: Separates styling concerns from application logic.

## Structure
- `desktop/`: Contains themes for desktop environments (e.g., GTK, Qt).
- `hyde-themes/`: Contains themes designed to be managed by a `hyde-cli` like interface.
- `web/`: Contains themes for web applications.
- `terminal/`: Terminal color schemes.

## Example: Infini-X Dark Theme (GTK)

```
themes/
├── README.md
└── desktop/
    └── gtk/
        └── infini-x-dark/
            ├── gtk-3.0/
            │   └── gtk.css
            └── gtk-4.0/
                └── gtk.css
```

## HyDE-inspired Theming

The `hyde-themes/` directory introduces a more structured approach to theming, where each theme is a self-contained unit with its own configuration files for various components. These themes are intended to be applied using the `hyde-cli` tool, providing a unified way to manage the visual appearance of the entire Infini-X system.

## Usage
Components that support theming should be configured to look for their respective theme files within this directory. For example, a GTK application would load its theme from `themes/desktop/gtk/infini-x-dark/gtk-3.0/gtk.css`.

For `hyde-themes`, use the `hyde-cli` tool to apply them:

```bash
hyde-cli theme apply <theme_name>
```

## Further Development
- Develop actual themes for Hyprland, Waybar, GTK, Qt, and web components.
- Implement a theme switching mechanism where applicable.
- Provide clear documentation on how to create and apply new themes.
- Fully integrate `hyde-cli` with the theme application logic.