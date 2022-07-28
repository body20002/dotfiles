from libqtile import widget, qtile, bar, layout
from libqtile.config import Screen, Match

from theme import colors, bar_color


def updates():
    qtile.groups[-2].cmd_toscreen()
    qtile.cmd_spawn("alacritty -t 'Updating The System' -e yay -Syu")

def play_pause():
    for w in qtile.current_screen.top.widgets:
        if isinstance(w, widget.Mpris2):
            w.cmd_play_pause()

widgets = [
    widget.CurrentLayoutIcon(scale=0.75),
    widget.CurrentLayout(width=70, margin=0),
    widget.Chord(foreground=colors["primary"]),
    widget.Sep(),
    widget.GroupBox(
        highlight_method="text",
        rounded=False,
        inactive=colors["secondary"],
        this_current_screen_border=colors["primary"],
        disable_drag=True,
        spacing=0,
    ),
    widget.Sep(),
    widget.TaskList(
        width=1920 // 4 - 52,
        border=colors["primary"],
        icon_size=18,
        font_size=12,
        highlight_method="block",
        rounded=True,
        title_width_method="uniform",
        txt_floating="",
        txt_maximized="",
        txt_minimized="",
        markup_minimized="<span underline='double'>{}</span>",
    ),
    widget.Sep(),
    widget.Clock(format="%Y-%m-%d %a %I:%M %p"),
    widget.Sep(),
    widget.Mpris2(
        width=1920 // 7 + 10,
        stopped_text="No Music Playing",
        scroll=True,
        scroll_delay=1,
        scroll_clear=True,
        scroll_step=4,
        display_metadata=["xesam:title", "xesam:artist"],
    ),
    widget.TextBox(text="", width=bar.STRETCH, mouse_callbacks={"Button1": play_pause }),
    widget.Sep(),
    widget.CPU(format="CPU: {load_percent:>3,.0f}%"),
    widget.Sep(),
    widget.Memory(format="MEM: {MemPercent:>2,.0f}%"),
    widget.Sep(),
    widget.DF(visible_on_warn=False, format="SSD: {r:>2,.0f}%"),
    widget.Sep(),
    widget.NvidiaSensors(format="GPU: {temp}°C"),
    widget.Sep(),
    widget.OpenWeather(format="{location_city}: {main_temp:2,.0f}°{units_temperature}", cityid=360995),
    widget.Sep(),
    widget.KeyboardLayout(configured_keyboards=["us", "ara"], display_map={"ara": "AR"}),
    widget.Sep(),
    widget.CheckUpdates(
        no_update_string="",
        display_format=": {updates}",
        update_interval=60 * 60 * 24 * 7,  # every week
        distro="Arch_yay",
        mouse_callbacks={"Button1": updates},
    ),
    widget.Sep(),
    widget.Systray(width=100),
    # StatusNotifier(),
]

screens = [
    Screen(
        top=bar.Bar(
            widgets=widgets,
            size=24,
            background=bar_color,
        ),
    ),
]

dgroups_key_binder = None
dgroups_app_rules = []

floating_types = ["notification", "toolbar", "splash", "dialog"]

follow_mouse_focus = True
bring_front_click = False
cursor_warp = False

floating_layout = layout.Floating(  # pyright: ignore
    float_rules=[
        # Run the utility of `xprop` to see the wm class and name of an X client.
        *layout.Floating.default_float_rules,  # pyright: ignore
        Match(wm_class="confirmreset"),  # gitk
        Match(wm_class="makebranch"),  # gitk
        Match(wm_class="maketag"),  # gitk
        Match(wm_class="ssh-askpass"),  # ssh-askpass
        Match(title="branchdialog"),  # gitk
        Match(title="pinentry"),  # GPG key password entry
        Match(wm_class="Arandr"),
        Match(wm_class="Devtools"),
        Match(wm_class="gnome-calculator"),
        Match(wm_class="archlinux-logout.py"),
    ],
    fullscreen_border_width=0,
    border_width=0,
)

auto_fullscreen = True
focus_on_window_activation = "smart"
auto_minimize = True
