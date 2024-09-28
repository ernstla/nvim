return { {
    'nvim-tree/nvim-web-devicons',
    opts = {
        override = {
            lir_folder_icon = {
                icon = "",
                color = "#7ab6e8",
                name = "LirFolderNode"
            }
        },
        -- globally enable different highlight colors per icon (default to true)
        -- if set to false all icons will have the default icon's color
        color_icons = true,
        -- globally enable default icons (default to false)
        -- will get overriden by `get_icons` option
        default = true,
    }
} }
