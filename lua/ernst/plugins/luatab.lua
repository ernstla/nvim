require('luatab').setup({
    -- title = function() return '' end,
    modified = function(bufnr)
        return vim.fn.getbufvar(bufnr, '&modified') == 1 and '%#TabLineModified# %*' or ''
    end,
    -- windowCount = function() return '' end,
    -- devicon = function() return '' end,
    -- separator = function() return '' end,
})
