-- build = 'make install_jsregexp',
local luasnip = require('luasnip')
luasnip.setup()
require('snippets')

vim.keymap.set({ 'i', 's' }, '<C-n>', function() luasnip.jump(1) end, { silent = true })
vim.keymap.set({ 'i', 's' }, '<C-p>', function() luasnip.jump(-1) end, { silent = true })

vim.keymap.set({ 'i', 's' }, '<C-e>', function()
    if luasnip.choice_active() then
        luasnip.change_choice(1)
    end
end, { silent = true })

vim.api.nvim_create_user_command('LuaSnipList', function()
    local ft = vim.bo.filetype
    local snippets = luasnip.get_snippets(ft)

    local lines = { "Available snippets for " .. ft .. ":" }
    for _, snip in ipairs(snippets) do
        table.insert(lines, string.format("  %s - %s", snip.trigger, snip.name or ""))
    end

    vim.api.nvim_echo({ { table.concat(lines, "\n"), "Normal" } }, true, {})
end, {})
