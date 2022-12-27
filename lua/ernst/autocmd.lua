-- To get a list of available commands
--    :help events
-- To get expanded info in callbacks see
--    :help expand
--    e. g.: `local ft = vim.fn.expand('<amatch>')`

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

local Ernst = augroup('Ernst', { clear = true })

-- No trailing whitespace
autocmd({ 'BufWritePre' }, {
    group = Ernst,
    pattern = '*',
    callback = function()
        local ft = vim.bo.filetype
        local ignore = {
            markdown = true,
        }

        if not ignore[ft] then
            vim.cmd [[%s/\s\+$//e]]
        end
    end
})

autocmd({ 'BufWritePre' }, {
    group = Ernst,
    pattern = {
        '*.html',
        '*.js',
        '*.json',
        '*.nim',
        '*.php',
        '*.py',
        '*.rs',
        '*.svelte',
        '*.ts',
        '*.lua',
    },
    command = 'LspZeroFormat'
})

autocmd({ 'BufRead', 'BufNewFile' }, {
    group = Ernst,
    pattern = { 'tsconfig.json', },
    command = 'set filetype=jsonc'
})

-- Suppose the dash is part of a keyword
autocmd({ 'FileType' }, {
    group = Ernst,
    pattern = {
        'clojure', 'css', 'html', 'less', 'lisp',
        'mako', 'php', 'scheme', 'scss', 'svelte',
        'vue',
    },
    command = 'setlocal iskeyword+=-'
})

-- Only two space indentation for some file types
autocmd({ 'FileType' }, {
    group = Ernst,
    pattern = {
        'clojure', 'hy', 'lisp', 'nim',
        'raml', 'ruby', 'scheme',
    },
    command = 'setlocal ts=2 sts=2 sw=2 expandtab'
})

-- Quickfix window placement
autocmd({ 'QuickFixCmdPost' }, { group = Ernst, pattern = '[^l]*', command = 'botright cwindow' })
autocmd({ 'QuickFixCmdPost' }, { group = Ernst, pattern = 'l* ', command = 'botright lwindow' })

-- Report if file has changed externally
autocmd({ 'CursorHold', 'CursorHoldI', 'FocusGained', 'BufEnter' }, {
    group = Ernst, pattern = '*', command = 'checktime'
})
autocmd({ 'FileChangedShell' }, {
    group = Ernst, pattern = '*',
    command = 'echohl echoError | echo "WARNING: File changed on disk" | echohl'
})

-- Neovim Terminal
local Terminal = augroup('Terminal', { clear = true })
autocmd({ 'TermOpen' }, {
    group = Terminal,
    pattern = '*',
    command = 'setlocal nonumber norelativenumber'
})
autocmd({ 'TermOpen', 'BufWinEnter', 'WinEnter' }, {
    group = Terminal,
    pattern = 'term://*',
    command = 'startinsert'
})
autocmd({ 'BufLeave' }, {
    group = Terminal,
    pattern = 'term://*',
    command = 'stopinsert'
})
