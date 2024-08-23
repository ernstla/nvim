-- If this has no effect, disable copy_sync and all its sync_*
-- settings in the tmux.nvim package config
if vim.fn.has('wsl') == 1 then
    vim.g.clipboard = {
        name = 'win32yank',
        copy = {
            ['+'] = { 'win32yank.exe', '-i' },
            ['*'] = { 'win32yank.exe -i' },
        },
        paste = {
            ['+'] = { 'win32yank.exe', '-o', '--lf' },
            ['*'] = { 'win32yank.exe', '-o', '--lf' },
        },
        cache_enabled = false,
    }
end

if vim.fn.executable('pbcopy') == 1 then
    vim.g.clipboard = {
        name = 'pbcopy',
        copy = {
            ['+'] = { 'pbcopy' },
            ['*'] = { 'pbcopy' },
        },
        paste = {
            ['+'] = { 'pbpaste' },
            ['*'] = { 'pbpaste' },
        },
        cache_enabled = false,
    }
end
