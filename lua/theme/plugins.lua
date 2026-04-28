local c = require('theme/colors')

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

    CodeDiffLineDelete        = { fg = c.none, bg = '#310707' },
    CodeDiffCharDelete        = { fg = c.none, bg = '#531313' },
    CodeDiffLineInsert        = { fg = c.none, bg = '#182b09' },
    CodeDiffCharInsert        = { fg = c.none, bg = '#384b29' },

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

    YankHigh                  = { fg = c.text, bg = c.green6 }, -- custom group, see autocmd.lua

    VM_Mono                   = { fg = c.white, bg = c.purple6 },
    VM_Cursor                 = { fg = c.white, bg = c.vermil6 },
    VM_Extend                 = { fg = c.white, bg = c.green7 },
    VM_Insert                 = { fg = c.white, bg = c.sea7 },

    CanolaDir                 = { fg = c.blue4, bg = c.none },
    CanolaDirIcon             = { fg = c.blue3, bg = c.none },
    CanolaColumn              = { fg = c.red3, bg = c.none },
    CanolaDirHidden           = { fg = c.grey1, bg = c.none },
    CanolaHidden              = { fg = c.grey1, bg = c.none },
    CanolaLink                = { fg = c.sea3, bg = c.none },
    CanolaLinkTarget          = { fg = c.red0, bg = c.none },
    CanolaLinkArrow           = { fg = c.yellow1, bg = c.none },
    CanolaSizeBytes           = { fg = c.rose0, bg = c.none },
    CanolaSizeKilo            = { fg = c.red0, bg = c.none },
    CanolaSizeMega            = { fg = c.rose2, bg = c.none },
    CanolaSizeGiga            = { fg = c.rose1, bg = c.none },
    CanolaDate                = { fg = c.cyan1, bg = c.none },
    CanolaEmpty               = { fg = c.rose1, bg = c.none },
    CanolaExecutable          = { fg = c.rose1, bg = c.none },
    -- CanolaOwnerSelf                 owner matches current user
    -- CanolaOwnerOther                owner differs from current user
    -- CanolaGroupSelf                 group matches current user's group
    -- CanolaGroupOther                group differs from current user's group
    -- CanolaLink                      soft links
    -- CanolaLinkHidden                hidden soft links
    -- CanolaLinkArrow                 arrow separator (->)
    -- CanolaLinkArrowHidden           hidden arrow separator
    -- CanolaLinkPath                  directory prefix of link target
    -- CanolaLinkPathHidden            hidden directory prefix of target
    -- CanolaLinkTarget                target of a soft link
    -- CanolaLinkTargetHidden          target of a hidden soft link
    -- CanolaOrphanLink                orphaned soft links
    -- CanolaOrphanLinkHidden          hidden orphaned soft links
    -- CanolaOrphanLinkTarget          target of an orphaned soft link
    -- CanolaOrphanLinkTargetHidden    target of hidden orphaned soft link
    -- CanolaPermUserRead              user read (r)
    -- CanolaPermUserWrite             user write (w)
    -- CanolaPermUserExec              user execute (x)
    -- CanolaPermGroupRead             group read
    -- CanolaPermGroupWrite            group write
    -- CanolaPermGroupExec             group execute
    -- CanolaPermOtherRead             other read
    -- CanolaPermOtherWrite            other write
    -- CanolaPermOtherExec             other execute
    -- CanolaPermNone                  no permission (-)
    -- CanolaPermSpecial               special bits (setuid/setgid/sticky)
    -- CanolaExecutable                executable files
    -- CanolaExecutableHidden          hidden executable files
    -- CanolaSocket                    socket files
    -- CanolaSocketHidden              hidden socket files

    FzfLuaNormal              = { fg = c.text, bg = c.none },
    FzfLuaBorder              = { fg = c.vermil5, bg = c.none },
    FzfLuaTitle               = { fg = c.red3, bg = c.none },
    FzfLuaPreviewNormal       = { fg = c.text, bg = c.none },
    FzfLuaPreviewBorder       = { fg = c.grey2, bg = c.none },
    FzfLuaCursorLine          = { fg = c.red1, bg = c.grey7 },
    FzfLuaLivePrompt          = { fg = c.text, bg = c.none },

    FzfLuaFzfNormal           = { fg = c.text, bg = c.none },
    FzfLuaFzfBorder           = { fg = c.grey2, bg = c.none },
    FzfLuaFzfCursorLine       = { fg = c.white, bg = c.grey7 },
    FzfLuaFzfMatch            = { fg = c.red3, bg = c.none },
    FzfLuaFzfPrompt           = { fg = c.red1, bg = c.none },
    FzfLuaFzfQuery            = { fg = c.text, bg = c.none },
    FzfLuaFzfPointer          = { fg = c.vermil5, bg = c.none },
}
