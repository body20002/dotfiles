require'bufferline'.setup {}
require'nvim-tree'.setup {
    sync_root_with_cwd = true,
    reload_on_bufenter = true,
    respect_buf_cwd = true,
    disable_netrw = true,
    view = {
        adaptive_size = true,
        mappings = {list = {{key = "u", action = "dir_up"}}},
        side = "left"
    },
    renderer = {
        group_empty = true,
        indent_markers = {
            enable = true,
            icons = {corner = "└ ", edge = "│ ", item = "│ ", none = "  "}
        }
    },
    diagnostics = {
        enable = true,
        show_on_dirs = true,
        icons = {hint = "", info = "", warning = "", error = ""}
    },
    filters = {dotfiles = true},
    filesystem_watchers = {enable = true, debounce_delay = 50}
}

