colors = {
    "primary": "#9f5252",
    "secondary": "#686868",
}

bar_color = "#28282866"

theme_layout: dict = {
    "border_width": 1,
    "margin": 4,
    "max_border_width": 2,
    "border_focus": colors["primary"],
    "border_normal": colors["secondary"],
    "border_on_single": True,
    "margin_on_single": True,
}

widget_defaults = dict(
    font="Inconsolata Nerdfont",
    fontsize=16,
    padding=2,
    margin_x=0,
    margin_y=2,
)

extension_defaults = widget_defaults.copy()

