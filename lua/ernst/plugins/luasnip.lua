return { {
    'L3MON4D3/LuaSnip',
    version = 'v2.*',
    build = 'make install_jsregexp',
    opts = {},
    config = function(spec)
        local ls = require('luasnip')
        ls.setup(spec.opts)
        require('ernst/snippets')

        vim.keymap.set({ 'i' }, '<Tab>', function()
            if ls.expand_or_jumpable() then
                ls.expand_or_jump()
            else
                vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Tab>", true, false, true), "n", false)
            end
        end, { silent = true })
        vim.keymap.set({ 'i', 's' }, '<C-n>', function() ls.jump(1) end, { silent = true })
        vim.keymap.set({ 'i', 's' }, '<C-p>', function() ls.jump(-1) end, { silent = true })

        vim.keymap.set({ 'i', 's' }, '<C-e>', function()
            if ls.choice_active() then
                ls.change_choice(1)
            end
        end, { silent = true })
    end,
} }
