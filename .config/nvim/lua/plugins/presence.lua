-- Discord Rich Presence
return {
  'andweeb/presence.nvim',
  opts={
    -- General options
    neovim_image_text   = "The One True Text Editor", -- Text displayed when hovered over the Neovim image
    main_image          = "neovim",                   -- Main image display (either "neovim" or "file")
    enable_line_number  = false,                      -- Displays the current line number instead of the current project

    -- Rich Presence text options
    editing_text        = "Coding :p",
    file_explorer_text  = "Coding :p",
    git_commit_text     = "Coding :p",
    plugin_manager_text = "Coding :p",
    reading_text        = "Coding :p",
    workspace_text      = "NEOVIM BABYY",
  }
}
