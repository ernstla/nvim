require('early-retirement').setup({
    retirementAgeMins = 120,
    minimumBufferNum = 13,

    ignoredFiletypes = {},
    ignoreFilenamePattern = "",
    ignoreAltFile = true,
    ignoreUnsavedChangesBufs = true,

    -- Ignore non-empty buftypes, for example terminal buffers
    ignoreSpecialBuftypes = true,

    -- Ignore visible buffers. Buffers that are open in a window or in a tab
    -- are considered visible by vim. ("a" in `:buffers`)
    ignoreVisibleBufs = true,

    -- ignore unloaded buffers. Session-management plugin often add buffers
    -- to the buffer list without loading them.
    ignoreUnloadedBufs = false,

    -- Show notification on closing. Works with plugins like nvim-notify.
    notificationOnAutoClose = false,

    -- When a file is deleted, for example via an external program, delete the
    -- associated buffer as well. Requires Neovim >= 0.10.
    -- (This feature is independent from the automatic closing)
    deleteBufferWhenFileDeleted = false,
})
