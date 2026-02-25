return { {
    'alvarosevilla95/luatab.nvim',
    dependencies = 'nvim-tree/nvim-web-devicons',
    opts = {
        -- title = function() return '' end,
        modified = function(bufnr)
            return vim.fn.getbufvar(bufnr, '&modified') == 1 and '%#TabLineModified# %*' or ''
        end,
        -- windowCount = function() return '' end,
        -- devicon = function() return '' end,
        -- separator = function() return '' end,
    },
    config = function(_, opts)
        require('luatab').setup(opts)
    end,
} }
