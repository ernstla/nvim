local c = require('serious/colors')

return {
    LazyNormal                = { bg = c.none, default = true },

    MasonNormal               = { bg = c.none, default = true },

    WhichKeyNormal            = { bg = c.grey7 },

    BlinkCmpMenuBorder        = { fg = c.vermil4 },

    NvimTreeWindowPicker      = { fg = c.white, bg = c.green5 },
    NvimTreeCursorLine        = { bg = c.grey5 },
    NvimTreeFolderIcon        = { fg = c.blue5 },
    NvimTreeFolderName        = { fg = c.blue4 },
    NvimTreeEmptyFolderName   = { fg = c.blue4 },
    NvimTreeNormal            = { fg = c.text },

    GitSignsAdd               = { fg = c.green5 },
    GitSignsChange            = { fg = c.green5 },
    GitSignsDelete            = { fg = c.vermil5 },
    GitSignsChangeDelete      = { fg = c.vermil5 },

    fugitiveHeader            = { fg = c.orange4 },
    fugitiveHeading           = { fg = c.purple4 },
    fugitiveHash              = { fg = c.purple1 },
    fugitiveStagedHeading     = { fg = c.green5 },
    fugitiveStagedModifier    = { fg = c.green5 },
    fugitiveStagedSection     = { fg = c.green0 },
    fugitiveUnstagedHeading   = { fg = c.vermil5 },
    fugitiveUnstagedModifier  = { fg = c.vermil5 },
    fugitiveUnstagedSection   = { fg = c.salmon6 },
    fugitiveUntrackedHeading  = { fg = c.blue4 },
    fugitiveUntrackedModifier = { fg = c.blue4 },
    fugitiveUntrackedSection  = { fg = c.blue0 },

    TelescopeNormal           = { fg = c.text, bg = c.none },
    TelescopeBorder           = { fg = c.grey2, bg = c.none },
    TelescopeSelection        = { fg = c.red1, bg = c.grey7 },
    TelescopeResultsTitle     = { fg = c.grey1, bg = c.none },
    TelescopePromptBorder     = { fg = c.red5, bg = c.none },
    TelescopePromptTitle      = { fg = c.red3, bg = c.none },
    TelescopePromptPrefix     = { fg = c.red5, bg = c.none },
    TelescopePromptNormal     = { fg = c.text, bg = c.none },
    TelescopePreviewNormal    = { fg = c.text, bg = c.none },
    TelescopeResultsNormal    = { fg = c.text, bg = c.none },

    YankHigh                  = { fg = c.text, bg = c.green6 }, -- custom group, see autocmd.lua

    VM_Mono                   = { fg = c.white, bg = c.purple6 },
    VM_Cursor                 = { fg = c.white, bg = c.vermil6 },
    VM_Extend                 = { fg = c.white, bg = c.green7 },
    VM_Insert                 = { fg = c.white, bg = c.sea7 },

    FzfLuaBorder              = { fg = c.vermil5, bg = c.none },
}
