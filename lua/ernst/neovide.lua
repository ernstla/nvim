if vim.g.neovide then
    vim.o.guifont = "FiraCodeErnst Nerd Font:h14"
    vim.g.neovide_show_border = true
    vim.g.neovide_remember_window_size = true

    vim.g.neovide_cursor_trail_size = 0.8
    vim.g.neovide_cursor_animate_in_insert_mode = true
    vim.g.neovide_cursor_animate_command_line = true
    vim.g.neovide_cursor_vfx_mode = "pixiedust" -- "railgun", "torpedo"

    vim.g.neovide_padding_top = 5
    vim.g.neovide_padding_bottom = 5
    vim.g.neovide_padding_right = 10
    vim.g.neovide_padding_left = 10
end
