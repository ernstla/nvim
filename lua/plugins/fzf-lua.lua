local fzf = require('fzf-lua')
local actions = require('fzf-lua.actions')

local file_ignore_patterns = {
    '%.JPEG',
    '%.JPG',
    '%.doc',
    '%.docx',
    '%.ico',
    '%.jfif',
    '%.jpeg',
    '%.jpg',
    '%.mp3',
    '%.mp4',
    '%.odt',
    '%.otf',
    '%.pdf',
    '%.png',
    '%.ppt',
    '%.pptx',
    '%.ttf',
    '%.wav',
    '%.webp',
    '%.woff',
    '%.woff2',
    '%.xls',
    '%.xlsx',
    '__pycache__',
    'venv',
}

local files_fd_opts = table.concat({
    '--type f',
    '--hidden',
    '--exclude .git',
    '--exclude node_modules',
    '--exclude vendor',
    '--exclude .svelte-kit',
    '--exclude build',
    '--exclude dist',
    '--color=never',
}, ' ')

local fd_bin = vim.fn.executable('fd') == 1 and 'fd' or 'fdfind'
local files_cmd_respecting = fd_bin .. ' ' .. files_fd_opts
local files_cmd_no_ignore = fd_bin .. ' ' .. files_fd_opts .. ' --no-ignore'

local grep_rg_opts = '--column --line-number --no-heading ' ..
    '--color=always ' ..
    '--colors=match:fg:red --colors=match:style:nobold ' ..
    '--colors=line:fg:green --colors=line:style:nobold ' ..
    '--colors=column:fg:yellow --colors=column:style:nobold ' ..
    '--colors=path:fg:white --colors=path:style:nobold ' ..
    '--smart-case --max-columns=4096 -e'

fzf.setup({
    fzf_colors = true,
    fzf_opts = {
        ['--no-bold'] = true,
    },
    winopts = {
        border = 'rounded',
        height = 0.8,
        width = math.min(123, math.floor(vim.o.columns * 0.9)),
        preview = {
            hidden = true,
            layout = 'flex',
            flip_columns = 150,
            horizontal = 'right:50%',
            vertical = 'down:45%',
        },
    },
    keymap = {
        builtin = {
            ['<C-j>'] = 'down',
            ['<C-k>'] = 'up',
            ['<C-f>'] = 'page-down',
            ['<C-b>'] = 'page-up',
            ['<C-d>'] = 'preview-page-down',
            ['<C-u>'] = 'preview-page-up',
        },
        fzf = {
            ['ctrl-j'] = 'down',
            ['ctrl-k'] = 'up',
            ['ctrl-f'] = 'page-down',
            ['ctrl-b'] = 'page-up',
            ['ctrl-d'] = 'preview-page-down',
            ['ctrl-u'] = 'preview-page-up',
        },
    },
    ui_select = {
        winopts = {
            width = 0.4,
            height = 0.3,
            preview = { hidden = true },
        },
    },
    files = {
        hidden = true,
        no_ignore = false,
        follow = false,
        cmd = files_cmd_respecting,
    },
    git = {
        files = {
            file_ignore_patterns = file_ignore_patterns,
        },
    },
    buffers = {
        sort_lastused = true,
        show_unloaded = true,
        actions = {
            ['ctrl-x'] = { fn = actions.buf_del, reload = true },
        },
    },
    grep = {
        no_esc = true,
        rg_opts = grep_rg_opts,
        actions = {
            ['ctrl-q'] = actions.file_sel_to_qf,
        },
        winopts = {
            preview = {
                hidden = false,
                layout = 'flex',
                flip_columns = 150,
            },
        },
    },
})

local function find_files_respecting_ignore()
    fzf.files({
        cmd = files_cmd_respecting,
        no_ignore = false,
        hidden = true,
        follow = false,
    })
end

local function find_files_no_ignore()
    fzf.files({
        cmd = files_cmd_no_ignore,
        no_ignore = true,
        hidden = true,
        follow = false,
    })
end

local function rg_opts_with(extra)
    extra = vim.trim(extra or '')
    if extra == '' then
        return grep_rg_opts
    end

    return grep_rg_opts:gsub('%s%-e$', ' ' .. extra .. ' -e')
end

local function ag_with_args(prompt, extra_args)
    fzf.live_grep({
        search = prompt,
        rg_opts = rg_opts_with(extra_args),
        winopts = {
            preview = {
                hidden = false,
                layout = 'flex',
                flip_columns = 150,
            },
        },
    })
end

local function create_user_command(name, callback, opts)
    pcall(vim.api.nvim_del_user_command, name)
    vim.api.nvim_create_user_command(name, callback, opts)
end

vim.keymap.set('n', '<c-p>', find_files_respecting_ignore, {})
vim.keymap.set('n', '<c-s-p>', fzf.buffers, {})
vim.keymap.set('n', '<f9>', fzf.buffers, {})

create_user_command('Ag', function(o) ag_with_args(o.args) end, { nargs = '*' })
create_user_command('Agi', function(o) ag_with_args(o.args, '--ignore-case') end, { nargs = '*' })
create_user_command('Ags', function(o) ag_with_args(o.args, '--case-sensitive') end, { nargs = '*' })
create_user_command('Agn', function(o) ag_with_args(o.args, '--no-ignore') end, { nargs = '*' })
create_user_command('Agni', function(o) ag_with_args(o.args, '--no-ignore --ignore-case') end, { nargs = '*' })
create_user_command('Agns', function(o) ag_with_args(o.args, '--no-ignore --case-sensitive') end, { nargs = '*' })

require('which-key').add({
    {
        mode = { 'n' },
        { '<leader>b',  fzf.buffers,          desc = 'fzf-lua: buffers' },
        { '<leader>tb', fzf.buffers,          desc = 'fzf-lua: buffers' },
        { '<leader>tf', find_files_no_ignore, desc = 'fzf-lua: find files (no ignore)' },
        { '<leader>ta', fzf.live_grep,        desc = 'fzf-lua: grep (with args)' },
        { '<leader>tl', fzf.live_grep,        desc = 'fzf-lua: ripgrep (legacy)' },
        { '<leader>th', fzf.helptags,         desc = 'fzf-lua: help tags' },
        { '<leader>tk', fzf.keymaps,          desc = 'fzf-lua: keymaps' },
        { '<leader>tq', fzf.quickfix,         desc = 'fzf-lua: quickfix list' },
        { '<leader>t:', fzf.commands,         desc = 'fzf-lua: commands' },
        { '<leader>t;', fzf.command_history,  desc = 'fzf-lua: command history' },
        {
            '<leader>m',
            function() fzf.oldfiles({ cwd_only = true }) end,
            desc = 'fzf-lua: recent files (cwd)',
        },
        {
            '<leader>r',
            function() fzf.grep({ search = vim.fn.input('ripgrep: ') }) end,
            desc = 'fzf-lua: ripgrep prompt',
        },
    },
})
