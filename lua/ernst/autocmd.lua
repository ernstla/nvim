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
        '*.json',
        '*.lua',
        '*.go',
        '*.nim',
        '*.odin',
        '*.rs',
        '*rc',
    },
    command = 'lua vim.lsp.buf.format()'
})

autocmd({ 'BufWritePre' }, {
    group = Ernst,
    pattern = {
        '*.vue',
    },
    command = 'EslintFixAll'
})

autocmd({ 'BufWritePre' }, {
    group = Ernst,
    pattern = {
        '*.py',
        '*.php',
        '*.html',
        '*.ts',
        '*.svelte',
        '*.js',
        '*.css',
        '*.scss',
    },
    callback = function(args)
        require("conform").format({ bufnr = args.buf })
    end,
})

autocmd({ 'BufRead', 'BufNewFile' }, {
    group = Ernst,
    pattern = { 'tsconfig.json', },
    command = 'set filetype=jsonc'
})

autocmd({ 'BufRead', 'BufNewFile' }, {
    group = Ernst,
    pattern = { '*.mako', },
    command = 'set filetype=mako.html'
})

autocmd({ 'BufRead', 'BufNewFile' }, {
    group = Ernst,
    pattern = { '*.msql', },
    command = 'set filetype=sql'
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

autocmd('TextYankPost', {
    group = Ernst,
    pattern = '*',
    callback = function()
        vim.highlight.on_yank({
            higroup = 'YankHigh',
            timeout = 613, -- what a prime number
        })
    end,
})

-- Quickfix window placement
autocmd({ 'QuickFixCmdPost' }, { group = Ernst, pattern = '[^l]*', command = 'botright cwindow' })
autocmd({ 'QuickFixCmdPost' }, { group = Ernst, pattern = 'l* ', command = 'botright lwindow' })

-- Report if file has changed externally
autocmd({ 'CursorHold', 'CursorHoldI', 'FocusGained', 'BufEnter' }, {
    group = Ernst, pattern = '*', command = 'checktime'
})
autocmd({ 'FileChangedShell' }, {
    group = Ernst,
    pattern = '*',
    command = 'echohl echoError | echo "WARNING: File changed on disk" | echohl'
})


-- " Navigate with +/= and - between changes and center change on screen
-- " Catch the transition to diff mode
autocmd({ 'FilterWritePre' }, {
    group = Ernst,
    pattern = '*',
    command =
    "if &diff | exe 'noremap = ]cz.' | exe 'noremap + ]cz.' | exe 'noremap - [cz.' | exe 'noremap U :diffupdate<cr>' | endif",
})
autocmd({ 'FilterWritePre' }, {
    group = Ernst,
    pattern = '*',
    command = [[if &diff |  exe 'execute "normal zR"' | endif]]
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
