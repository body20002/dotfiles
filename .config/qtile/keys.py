from functools import partial
import os
from pathlib import Path

from libqtile.command import lazy
from libqtile.config import Key, ScratchPad, DropDown

# from libqtile import extension
from command_set import CommandSet

from theme import colors
from groups import groups


mod = "mod4"
home_path = Path.home()
rofi_launcher = f"{home_path}/.config/rofi/bin/launcher_misc"
browser = os.environ.get("BROWSER", "firefox")
discord = "flatpak run com.discordapp.Discord"
terminal = os.environ.get("TERMINAL", "alacritty")

command_set = partial(
    CommandSet,
    dmenu_prompt="Edit >",
    dmenu_ignorecase=True,
    dmenu_lines=20,
    foreground=colors["primary"],
    selected_background=colors["primary"],
)


def launch_nvim_in_tmux(dir: Path):
    if dir.is_dir():
        return f"{terminal} -e zsh -c 'sleep .1 && cd {dir} && tmux new-session nvim {dir}'"
    else:
        return f"{terminal} -e zsh -c 'sleep .1 && tmux new-session nvim {dir}'"


def launch_nvim(dir: Path):
    if dir.is_dir():
        return f"{terminal} -e zsh -c 'sleep .1 && cd {dir} && nvim {dir}'"
    else:
        return f"{terminal} -e zsh -c 'sleep .1 && nvim {dir}'"


def other_options(dirs: Path):
    return {
        "Open Current Folder": launch_nvim(dirs),
        "Open Current Folder In TMUX": launch_nvim_in_tmux(dirs),
    }


def launch(dir: Path):
    return command_set(
        commands={
            "Neovim": launch_nvim(dir),
            "Neovim in TMUX": launch_nvim_in_tmux(dir),
            # "VSCode": f"code {dir}", # other launch options
        },
        dmenu_prompt="Open In >",
    )


edit_config_selector = command_set(
    commands={
        dirs.stem.capitalize(): command_set(
            commands={dir.stem.capitalize(): launch(dir) for dir in dirs.glob("*")} | other_options(dirs),
        )
        for dirs in (home_path / ".config").glob("*")
    },
)

edit_code_selector = command_set(
    commands={
        dirs.stem.capitalize(): command_set(
            commands={dir.stem.capitalize(): launch(dir) for dir in dirs.glob("*")} | other_options(dirs),
        )
        for dirs in (home_path / "code").glob("*")
    },
)

script_selector = command_set(
    commands={
        "Edit Code": edit_code_selector,
        "Edit Config Files": edit_config_selector,
    },
    dmenu_prompt="Script >",
)

keys = [
    # Apps
    Key([mod], "f", lazy.spawn(browser), desc="launch browser"),
    Key([mod], "d", lazy.spawn(discord), desc="launch discord"),
    Key([mod], "a", lazy.spawn(rofi_launcher), desc="app launcher"),
    Key([mod], "Return", lazy.spawn(terminal), desc="launch terminal"),
    # KeyChord(
    #     [mod],
    #     "g",
    #     [
    #         Key([mod], "s", lazy.spawn("steam"), desc="launch steam"),
    #         Key([mod], "l", lazy.spawn("lutris"), desc="launch lutris"),
    #         Key([mod], "e", lazy.spawn("heroic"), desc="launch heroic"),
    #         Key([mod], "r", lazy.spawn("rare"), desc="launch rare"),
    #     ],
    #     mode="Game Launcher",
    # ),
    # Window Movements
    Key([mod], "h", lazy.layout.left(), desc="move focus to left"),
    Key([mod], "j", lazy.layout.down(), desc="move focus down"),
    Key([mod], "k", lazy.layout.up(), desc="move focus up"),
    Key([mod], "l", lazy.layout.right(), desc="move focus to right"),
    # Window Positioning
    Key([mod, "shift"], "h", lazy.layout.shuffle_left(), desc="move window left"),
    Key([mod, "shift"], "j", lazy.layout.shuffle_down(), desc="move window down"),
    Key([mod, "shift"], "k", lazy.layout.shuffle_up(), desc="move window up"),
    Key([mod, "shift"], "l", lazy.layout.shuffle_right(), desc="move window right"),
    # Window Resizing
    Key([mod, "mod1"], "h", lazy.layout.grow_left(), desc="grow window to the left"),
    Key([mod, "mod1"], "l", lazy.layout.grow_right(), desc="grow window to the right"),
    Key([mod, "mod1"], "j", lazy.layout.grow_down(), desc="grow window down"),
    Key([mod, "mod1"], "k", lazy.layout.grow_up(), desc="grow window up"),
    Key([mod, "mod1"], "n", lazy.layout.normalize(), desc="reset all window sizes"),
    Key(
        [mod, "mod1"],
        "space",
        lazy.window.toggle_fullscreen(),
        desc="Toggle fullscreen",
    ),
    # Toggle between different layouts
    Key([mod], "bracketleft", lazy.next_layout(), desc="toggle between layouts"),
    Key([mod], "bracketright", lazy.prev_layout(), desc="toggle between layouts"),
    # Don't know what to call this part :/
    Key([mod], "q", lazy.window.kill(), desc="kill focused window"),
    Key([mod, "shift"], "r", lazy.restart(), desc="reload the config"),
    Key([mod], "x", lazy.spawn("archlinux-logout"), desc="arco logout tool"),
    Key(
        [mod],
        "space",
        lazy.widget["keyboardlayout"].next_keyboard(),
        desc="change language.",
    ),
    # Audio Control
    Key([], "XF86AudioPlay", lazy.spawn("playerctl play-pause -p spotify mpd vlc firefox"), desc="play/pause music"),
    Key([], "XF86AudioStop", lazy.spawn("playerctl -a stop"), desc="stop music"),
    Key([], "XF86AudioNext", lazy.spawn("playerctl next -p spotify mpd vlc firefox"), desc="next track"),
    Key([], "XF86AudioPrev", lazy.spawn("playerctl previous -p spotify mpd vlc firefox"), desc="previous track"),
    Key(
        [],
        "XF86AudioRaiseVolume",
        lazy.spawn("pactl set-sink-volume @DEFAULT_SINK@ +2%"),
        desc="raise volume",
    ),
    Key(
        [],
        "XF86AudioLowerVolume",
        lazy.spawn("pactl set-sink-volume @DEFAULT_SINK@ -2%"),
        desc="lower volume",
    ),
    Key(
        [],
        "XF86AudioMute",
        lazy.spawn("pactl set-sink-mute @DEFAULT_SINK@ toggle"),
        desc="mute volume",
    ),
    # Screenshot
    Key([], "Print", lazy.spawn("gnome-screenshot"), desc="take a screenshot"),
    Key(
        [mod],
        "Print",
        lazy.spawn("gnome-screenshot -i"),
        desc="interactively take a screenshot",
    ),
    # Launch Calculator
    Key([], "XF86Calculator", lazy.spawn("gnome-calculator"), desc="launch calculator"),
    # Launch nautilus
    Key([], "XF86Explorer", lazy.spawn("nautilus"), desc="launch nautilus file manager"),
    # Launch spotify
    Key(
        [],
        "XF86Tools",
        lazy.spawn("gtk-launch spotify-adblock.desktop"),
        desc="launch spotify",
    ),  # yes I use adblock sue me (don't actually do that)
    # dmenu commands
    Key([mod, "shift"], "d", lazy.run_extension(script_selector), desc="script seletor"),
    # Key([mod, "shift"], "e", lazy.run_extension(edit_code_selector), desc="edit code seletor"),
]

for i in groups:
    keys.extend(
        [
            # mod1 + [0-9] = switch to group
            Key(
                [mod],
                i.name,
                lazy.group[i.name].toscreen(),
                desc=f"Switch to group {i.name}",
            ),
            # mod1 + alt + [0-9] = switch to & move focused window to group
            Key(
                [mod, "mod1"],
                i.name,
                lazy.window.togroup(i.name, switch_group=True),
                desc=f"Switch to & move focused window to group {i.name}",
            ),
            # mod1 + shift + [0-9] = move focused window to group
            Key(
                [mod, "shift"],
                i.name,
                lazy.window.togroup(i.name),
                desc=f"move focused window to group {i.name}",
            ),
        ]
    )

groups.append(
    ScratchPad(
        "ScratchPad",
        [
            DropDown("terminal", terminal, width=0.4, height=0.5, x=0.3, y=0.2, opacity=1),
        ],
    )
)
keys.extend(
    [
        Key([mod, "shift"], "Return", lazy.group["ScratchPad"].dropdown_toggle("terminal")),
    ]
)
