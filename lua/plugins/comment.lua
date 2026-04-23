local ft = require('Comment.ft')

ft.set('ini', '; %s')

require('Comment').setup({
    pre_hook = function(ctx)
        local ok, parser = pcall(vim.treesitter.get_parser, 0)

        if not ok or parser == nil then
            return ft.get(vim.bo.filetype, ctx.ctype) or vim.bo.commentstring
        end
    end,
})

vim.keymap.set('n', '<c-_>', 'gcc', { remap = true, silent = true })
vim.keymap.set('n', '<c-/>', 'gcc', { remap = true, silent = true })
vim.keymap.set('x', '<c-_>', 'gc', { remap = true, silent = true })
vim.keymap.set('x', '<c-/>', 'gc', { remap = true, silent = true })
vim.keymap.set('x', '<m-_>', 'gb', { remap = true, silent = true })
vim.keymap.set('x', '<m-/>', 'gb', { remap = true, silent = true })
