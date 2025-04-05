return { {
    'L3MON4D3/LuaSnip',
    version = 'v2.*',
    build = 'make install_jsregexp',
    opts = {},
    config = function(spec)
        local ls = require('luasnip')
        ls.setup(spec.opts)
        require('ernst/snippets')

        vim.keymap.set({ 'i' }, '<Tab>', function() ls.expand() end, { silent = true })
        vim.keymap.set({ 'i', 's' }, '<C-N>', function() ls.jump(1) end, { silent = true })
        vim.keymap.set({ 'i', 's' }, '<C-P>', function() ls.jump(-1) end, { silent = true })

        vim.keymap.set({ 'i', 's' }, '<C-E>', function()
            if ls.choice_active() then
                ls.change_choice(1)
            end
        end, { silent = true })
    end,
} }
