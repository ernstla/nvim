if vim.fn.has('nvim-0.10') == 1 then
    require("tailwind-tools").setup({
        document_color = {
            enabled = true, -- can be toggled by commands
            kind = "inline", -- "inline" | "foreground" | "background"
            inline_symbol = " ", -- only used in inline mode
            debounce = 200, -- in milliseconds, only applied in insert mode
        },
        conceal = {
            enabled = true,
            symbol = "󱏿", -- only a single character is allowed
            highlight = { -- extmark highlight options, see :h 'highlight'
                fg = "#669933",
            },
        },
    })
end
