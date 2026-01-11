local function copy_relative_path()
    vim.fn.setreg('+', vim.fn.expand('%'))
    print('Copied: ' .. vim.fn.expand('%'))
end
local function copy_absolute_path()
    vim.fn.setreg('+', vim.fn.expand('%:p'))
    print('Copied: ' .. vim.fn.expand('%:p'))
end

local function get_ai_path(expand_arg)
    local path = '@' .. vim.fn.expand(expand_arg)
    local mode = vim.fn.mode()

    if mode == 'v' or mode == 'V' or mode == '\22' then
        local start_line = vim.fn.line('v')
        local end_line = vim.fn.line('.')
        if start_line > end_line then
            start_line, end_line = end_line, start_line
        end
        path = path .. ':L' .. start_line .. '-L' .. end_line
    end

    return path
end

local function is_visual_mode()
    local mode = vim.fn.mode()
    return mode == 'v' or mode == 'V' or mode == '\22'
end

local function escape_visual_mode()
    vim.cmd('normal! ' .. vim.api.nvim_replace_termcodes('<Esc>', true, false, true))
end

local function copy_ai_path(expand_arg)
    local path = get_ai_path(expand_arg)
    local was_visual = is_visual_mode()

    vim.fn.setreg('+', path)
    print('Copied: ' .. path)

    if was_visual then
        escape_visual_mode()
    end
end

local function send_ai_path_to_tmux()
    local path = get_ai_path('%')
    local was_visual = is_visual_mode()

    vim.fn.system("tmux select-pane -R")
    vim.fn.system(string.format("tmux send-keys '%s '", path))
    print('Sent: ' .. path)

    if was_visual then
        escape_visual_mode()
    end
end

local function copy_ai_path_relative()
    copy_ai_path('%')
end

local function copy_ai_path_absolute()
    copy_ai_path('%:p')
end

-- Custom mapping which starts
local function opencode_in_tmux_pane()
    local subdir = vim.fn.getcwd()
    vim.fn.system("tmux split-window -h")
    vim.fn.system(string.format("tmux send-keys 'cd %s", vim.fn.shellescape(subdir)))
    vim.fn.system(string.format("tmux send-keys 'opencode' Enter"))
end

require("which-key").add(
    { {
        mode = { "n" },
        { '<leader>oc', opencode_in_tmux_pane, desc = 'Start OpenCode in tmux pane' },
        { '<leader>cp', copy_relative_path,    desc = 'Copy relative file path' },
        { '<leader>cP', copy_absolute_path,    desc = 'Copy absolute file path' },
        { '<leader>ga', copy_ai_path_relative, desc = 'Copy AI path (relative)' },
        { '<leader>gA', copy_ai_path_absolute, desc = 'Copy AI path (absolute)' },
        { 'ga',         send_ai_path_to_tmux,  desc = 'Send AI path to tmux pane' },
    }, {
        mode = { "v" },
        { '<leader>ga', copy_ai_path_relative, desc = 'Copy AI path:lines (relative)' },
        { '<leader>gA', copy_ai_path_absolute, desc = 'Copy AI path:lines (absolute)' },
        { 'ga',         send_ai_path_to_tmux,  desc = 'Send AI path:lines to tmux pane' },
    } }
)
