from libqtile.config import Click, Drag
from libqtile.command import lazy

from floating_window_snapping import move_snap_window
from groups import groups as groups
from hooks import *
from keys import keys as keys, mod
from theme import *
from widgets_and_screens import *


mouse = [
    Drag([mod], "Button1", move_snap_window(snap_dist=30), start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(), start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front()),
]


wmname = "LG3D"
