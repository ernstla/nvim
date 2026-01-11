local opencode_pane_id = nil

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

local function is_pane_running_opencode(pane_id)
    local result = vim.fn.system(
        string.format("tmux list-panes -F '#{pane_id} #{pane_current_command}' | grep '^%s '", pane_id))
    return result:match("opencode") ~= nil
end

local function find_opencode_panes()
    local result = vim.fn.system(
        "tmux list-panes -F '#{pane_id}\t#{pane_index}\t#{pane_current_command}\t#{pane_width}x#{pane_height}'")
    local panes = {}
    for line in result:gmatch("[^\n]+") do
        local pane_id, index, cmd, size = line:match("^(%S+)\t(%S+)\t(%S+)\t(%S+)$")
        if cmd and cmd:match("opencode") then
            table.insert(panes, {
                id = pane_id,
                index = index,
                size = size,
            })
        end
    end
    return panes
end

local function send_keys_to_pane(pane_id)
    local path = get_ai_path('%')
    local was_visual = is_visual_mode()

    vim.fn.system(string.format("tmux send-keys -t %s '%s '", pane_id, path))
    print('Sent: ' .. path)

    if was_visual then
        escape_visual_mode()
    end
end

local function send_ai_path_to_tmux()
    -- Check stored pane first
    if opencode_pane_id and is_pane_running_opencode(opencode_pane_id) then
        send_keys_to_pane(opencode_pane_id)
        return
    end

    local panes = find_opencode_panes()

    if #panes == 0 then
        print("No opencode pane found")
        return
    end

    if #panes == 1 then
        opencode_pane_id = panes[1].id
        send_keys_to_pane(opencode_pane_id)
        return
    end

    -- Multiple panes: show picker
    local was_visual = is_visual_mode()
    if was_visual then
        escape_visual_mode()
    end

    local items = {}
    local id_map = {}
    for _, pane in ipairs(panes) do
        local label = string.format("Pane %s (%s) [%s]", pane.index, pane.id, pane.size)
        table.insert(items, label)
        id_map[label] = pane.id
    end

    vim.ui.select(items, { prompt = "Select opencode pane:" }, function(choice)
        if choice then
            opencode_pane_id = id_map[choice]
            send_keys_to_pane(opencode_pane_id)
        end
    end)
end

local function copy_ai_path_relative()
    copy_ai_path('%')
end

local function copy_ai_path_absolute()
    copy_ai_path('%:p')
end

local function opencode_in_tmux_pane(split_arg)
    local subdir = vim.fn.getcwd()
    local result = vim.fn.system("tmux split-window " .. split_arg .. " -P -F '#{pane_id}'")
    opencode_pane_id = vim.trim(result)
    vim.fn.system(string.format("tmux send-keys -t %s 'cd %s", opencode_pane_id, vim.fn.shellescape(subdir)))
    vim.fn.system(string.format("tmux send-keys -t %s 'opencode' Enter", opencode_pane_id))
end

local function opencode_horizontal()
    opencode_in_tmux_pane("-h")
end

local function opencode_vertical()
    opencode_in_tmux_pane("-v")
end

require("which-key").add(
    { {
        mode = { "n" },
        { '<leader>oc', opencode_horizontal,   desc = 'Start OpenCode (horizontal split)' },
        { '<leader>oC', opencode_vertical,     desc = 'Start OpenCode (vertical split)' },
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
