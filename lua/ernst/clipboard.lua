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

-- Try to detect and configure clipboard for Linux
if vim.fn.executable('wl-copy') == 1 and vim.fn.executable('wl-paste') == 1 then
    -- Wayland
    vim.g.clipboard = {
        name = 'wl-clipboard',
        copy = {
            ['+'] = { 'wl-copy' },
            ['*'] = { 'wl-copy', '--primary' },
        },
        paste = {
            ['+'] = { 'wl-paste', '--no-newline' },
            ['*'] = { 'wl-paste', '--no-newline', '--primary' },
        },
        cache_enabled = false,
    }
elseif vim.fn.executable('xclip') == 1 then
    -- X11 with xclip
    vim.g.clipboard = {
        name = 'xclip',
        copy = {
            ['+'] = { 'xclip', '-selection', 'clipboard' },
            ['*'] = { 'xclip', '-selection', 'primary' },
        },
        paste = {
            ['+'] = { 'xclip', '-selection', 'clipboard', '-o' },
            ['*'] = { 'xclip', '-selection', 'primary', '-o' },
        },
        cache_enabled = false,
    }
elseif vim.fn.executable('xsel') == 1 then
    -- X11 with xsel
    vim.g.clipboard = {
        name = 'xsel',
        copy = {
            ['+'] = { 'xsel', '--clipboard', '--input' },
            ['*'] = { 'xsel', '--primary', '--input' },
        },
        paste = {
            ['+'] = { 'xsel', '--clipboard', '--output' },
            ['*'] = { 'xsel', '--primary', '--output' },
        },
        cache_enabled = false,
    }
end
