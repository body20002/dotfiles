from libqtile import hook, qtile

from theme import bar_color


@hook.subscribe.startup
def rename_wm():
    qtile.current_screen.top.window.window.set_property("WM_NAME", "qtile_bar", type="STRING", format=8)  # type: ignore


def _change_bar_color(color: str):
    qtile.current_screen.top.background = color
    qtile.current_screen.top.draw()  # type: ignore


def _clear_bar_color():
    _change_bar_color("#00000000")


def _restore_bar_color():
    _change_bar_color(bar_color)


@hook.subscribe.setgroup
@hook.subscribe.client_killed
def on_setgroup_and_clinet_killed(c=None):
    if hasattr(qtile, "current_screen"):
        windows = len(qtile.current_group.windows)
        if (windows == 0) or (windows == 1 and c):
            _clear_bar_color()
        else:
            _restore_bar_color()


@hook.subscribe.client_new
def on_client_new(c):
    if hasattr(qtile, "current_screen"):
        if len(qtile.current_group.windows) > 0 or c:
            _restore_bar_color()
        else:
            _clear_bar_color()

