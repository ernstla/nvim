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

-- Align buffers evenly when the terminal/window is resized
vim.api.nvim_create_autocmd("VimResized", {
    callback = function()
        vim.cmd("wincmd =")
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
autocmd({ 'TermOpen', 'BufEnter', 'BufWinEnter', 'WinEnter', 'BufLeave' }, {
    group = Terminal,
    pattern = 'term://*',
    command = 'stopinsert'
})

-- Fugitive
-- Show "LOCAL" or "REMOTE" instead of //2 oder //3 in status line
autocmd("BufReadPost", {
    pattern = "fugitive://*",
    callback = function()
        local bufname = vim.api.nvim_buf_get_name(0)
        if bufname:match("%.git//2") then
            vim.b.lightline_filename = "LOCAL (our changes //2)"
            vim.opt_local.winbar = "%#DiffAdd#  LOCAL (our changes / Target)  "
        elseif bufname:match("%.git//3") then
            vim.b.lightline_filename = "REMOTE (their changes //3)"
            vim.opt_local.winbar = "%#DiffDelete#  REMOTE (incoming branch)  "
        end
    end,
})

-- Re-apply missing blink.cmp keymaps after exiting vim-visual-multi insert mode.
-- VM may not fully restore buffer-local insert mappings in some buffers.
autocmd('User', {
    group = Ernst,
    pattern = 'visual_multi_exit',
    callback = function()
        local bufnr = vim.api.nvim_get_current_buf()

        for _, mode in ipairs({ 'i', 's' }) do
            for _, mapping in ipairs(vim.api.nvim_buf_get_keymap(bufnr, mode)) do
                if mapping.desc and vim.startswith(mapping.desc, 'blink.cmp: ') then
                    pcall(vim.keymap.del, mode, mapping.lhs, { buffer = bufnr })
                end
            end
        end
    end,
})
