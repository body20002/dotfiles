from libqtile import layout
from libqtile.config import Group

from theme import theme_layout

layouts: list = [
    layout.Columns(**theme_layout),  # type: ignore
    layout.Max(**theme_layout),  # type: ignore
    layout.Floating(**theme_layout),  # type: ignore
]

# workspaces_names_and_settings = [
#     ["DEV", "columns", layouts],  # 1
#     ["SYS", "columns", layouts],  # 2
#     [
#         "MUSIC",
#         "max",
#         layouts,
#     ],  # 3
#     ["WWW", "columns", layouts],  # 4
#     ["GAMES", "columns", layouts],  # 5
#     ["STUDY", "columns", layouts],  # 6
#     ["W", "columns", layouts],  # 7
#     ["X", "columns", layouts],  # 8
#     ["Y", "columns", layouts],  # 9
#     ["Z", "columns", layouts],  # 0
# ]

# from pprint import pprint
# pprint({w[0]: {"layout": w[1], "layouts": [], "matches": [], "spawn": []} for w in workspaces_names_and_settings})


workspaces_names_and_settings = {
    "DEV": {"layout": "columns", "layouts": layouts, "matches": [], "spawn": []},
    "SYS": {"layout": "columns", "layouts": layouts, "matches": [], "spawn": []},
    "MUSIC": {"layout": "max", "layouts": layouts, "matches": [], "spawn": []},
    "WWW": {"layout": "columns", "layouts": layouts, "matches": [], "spawn": []},
    "GAMES": {"layout": "columns", "layouts": layouts, "matches": [], "spawn": []},
    "STUDY": {"layout": "columns", "layouts": layouts, "matches": [], "spawn": []},
    "W": {"layout": "columns", "layouts": layouts, "matches": [], "spawn": []},
    "X": {"layout": "columns", "layouts": layouts, "matches": [], "spawn": []},
    "Y": {"layout": "columns", "layouts": layouts, "matches": [], "spawn": []},
    "Z": {"layout": "columns", "layouts": layouts, "matches": [], "spawn": []},
}


groups = [
    Group(
        **workspaces_names_and_settings[workspace],
        name=str(idx % len(workspaces_names_and_settings)),
        label=workspace,
    )
    for idx, workspace in enumerate(workspaces_names_and_settings, start=1)
]

del workspaces_names_and_settings  # we dont need you anymore
