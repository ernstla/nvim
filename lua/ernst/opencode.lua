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
    return '@' .. vim.fn.expand(expand_arg)
end

local function is_visual_mode()
    local mode = vim.fn.mode()
    return mode == 'v' or mode == 'V' or mode == '\22'
end

local function get_ai_path_with_lines(expand_arg)
    local path = '@' .. vim.fn.expand(expand_arg)
    local start_line
    local end_line

    if is_visual_mode() then
        start_line = vim.fn.line('v')
        end_line = vim.fn.line('.')
        if start_line > end_line then
            start_line, end_line = end_line, start_line
        end
    else
        start_line = vim.fn.line('.')
        end_line = start_line
    end

    if start_line == end_line then
        return path .. ':L' .. start_line
    end

    return path .. ':L' .. start_line .. '-L' .. end_line
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

local function copy_ai_path_with_lines(expand_arg)
    local path = get_ai_path_with_lines(expand_arg)
    local was_visual = is_visual_mode()

    vim.fn.setreg('+', path)
    print('Copied: ' .. path)

    if was_visual then
        escape_visual_mode()
    end
end

local function get_current_window_id()
    local result = vim.fn.system("tmux display-message -p '#{window_id}'")
    return vim.trim(result)
end

local function get_current_pane_id()
    local result = vim.fn.system("tmux display-message -p '#{pane_id}'")
    return vim.trim(result)
end

local function get_pane_window_and_command(pane_id)
    local result = vim.fn.system(
        string.format("tmux display-message -p -t %s '#{window_id}\t#{pane_current_command}'", pane_id))
    local window_id, cmd = result:match("^(%S+)\t(%S+)")
    return window_id, cmd
end

local function is_pane_running_opencode(pane_id)
    local current_window = get_current_window_id()
    local pane_window, cmd = get_pane_window_and_command(pane_id)
    return pane_window == current_window and cmd == "opencode"
end

local function find_opencode_panes()
    local window_id = get_current_window_id()
    local result = vim.fn.system(
        string.format(
            "tmux list-panes -t %s -F '#{pane_id}\t#{pane_index}\t#{pane_current_command}\t#{pane_width}x#{pane_height}'",
            window_id))
    local panes = {}
    for line in result:gmatch("[^\n]+") do
        local pane_id, index, cmd, size = line:match("^(%S+)\t(%S+)\t(%S+)\t(%S+)$")
        if cmd == "opencode" then
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

local function send_keys_to_pane_with_lines(pane_id)
    local path = get_ai_path_with_lines('%')
    local was_visual = is_visual_mode()

    vim.fn.system(string.format("tmux send-keys -t %s '%s '", pane_id, path))
    print('Sent: ' .. path)

    if was_visual then
        escape_visual_mode()
    end
end

local function send_keys_to_pane_absolute(pane_id)
    local path = get_ai_path('%:p')
    local was_visual = is_visual_mode()

    vim.fn.system(string.format("tmux send-keys -t %s '%s '", pane_id, path))
    print('Sent: ' .. path)

    if was_visual then
        escape_visual_mode()
    end
end

local function send_keys_to_pane_with_lines_absolute(pane_id)
    local path = get_ai_path_with_lines('%:p')
    local was_visual = is_visual_mode()

    vim.fn.system(string.format("tmux send-keys -t %s '%s '", pane_id, path))
    print('Sent: ' .. path)

    if was_visual then
        escape_visual_mode()
    end
end

local function send_ai_path_to_tmux_with(sender)
    -- Check stored pane first
    if opencode_pane_id and is_pane_running_opencode(opencode_pane_id) then
        sender(opencode_pane_id)
        return
    end

    local panes = find_opencode_panes()

    if #panes == 0 then
        print("No opencode pane found")
        return
    end

    if #panes == 1 then
        opencode_pane_id = panes[1].id
        sender(opencode_pane_id)
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
            sender(opencode_pane_id)
        end
    end)
end

local function send_ai_path_to_tmux()
    send_ai_path_to_tmux_with(send_keys_to_pane)
end

local function send_ai_path_absolute_to_tmux()
    send_ai_path_to_tmux_with(send_keys_to_pane_absolute)
end

local function send_ai_path_lines_to_tmux()
    send_ai_path_to_tmux_with(send_keys_to_pane_with_lines)
end

local function send_ai_path_lines_absolute_to_tmux()
    send_ai_path_to_tmux_with(send_keys_to_pane_with_lines_absolute)
end

local function copy_ai_path_relative()
    copy_ai_path('%')
end

local function copy_ai_path_absolute()
    copy_ai_path('%:p')
end

local function copy_ai_path_lines_relative()
    copy_ai_path_with_lines('%')
end

local function copy_ai_path_lines_absolute()
    copy_ai_path_with_lines('%:p')
end

local function focus_pane(pane_id)
    vim.fn.system(string.format("tmux select-pane -t %s", pane_id))
end

local function create_opencode_pane(split_arg)
    local subdir = vim.fn.getcwd()
    local current_pane = get_current_pane_id()
    local result = vim.fn.system(
        string.format(
            "tmux split-window -t %s %s -c %s -P -F '#{pane_id}'",
            current_pane,
            split_arg,
            vim.fn.shellescape(subdir)))
    opencode_pane_id = vim.trim(result)
    vim.fn.system(string.format("tmux send-keys -t %s 'opencode' Enter", opencode_pane_id))
end

local function open_or_focus_opencode(split_arg)
    -- Check stored pane first
    if opencode_pane_id and is_pane_running_opencode(opencode_pane_id) then
        focus_pane(opencode_pane_id)
        return
    end

    local panes = find_opencode_panes()

    if #panes == 0 then
        create_opencode_pane(split_arg)
        return
    end

    if #panes == 1 then
        opencode_pane_id = panes[1].id
        focus_pane(opencode_pane_id)
        return
    end

    -- Multiple panes: show picker
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
            focus_pane(opencode_pane_id)
        end
    end)
end

local function opencode_horizontal()
    open_or_focus_opencode("-h")
end

local function opencode_vertical()
    open_or_focus_opencode("-v")
end

local function opencode_horizontal_new()
    create_opencode_pane("-h")
end

local function opencode_vertical_new()
    create_opencode_pane("-v")
end

require("which-key").add(
    { {
        mode = { "n" },
        { '<leader>oc', opencode_horizontal,     desc = 'OpenCode (horizontal split)' },
        { '<leader>oC', opencode_vertical,       desc = 'OpenCode (vertical split)' },
        { '<leader>Oc', opencode_horizontal_new, desc = 'OpenCode new (horizontal split)' },
        { '<leader>OC', opencode_vertical_new,   desc = 'OpenCode new (vertical split)' },
        { '<leader>cp', copy_relative_path,      desc = 'Copy relative file path' },
        { '<leader>cP', copy_absolute_path,      desc = 'Copy absolute file path' },
    }, {
        mode = { "n", "v" },
        { '<leader>ga', copy_ai_path_relative,             desc = 'Copy AI path (relative)' },
        { '<leader>gA', copy_ai_path_absolute,             desc = 'Copy AI path (absolute)' },
        { '<leader>gl', copy_ai_path_lines_relative,       desc = 'Copy AI path:lines (relative)' },
        { '<leader>gL', copy_ai_path_lines_absolute,       desc = 'Copy AI path:lines (absolute)' },
        { 'ga',         send_ai_path_to_tmux,                desc = 'Send AI path to tmux pane' },
        { 'gA',         send_ai_path_absolute_to_tmux,       desc = 'Send AI path (absolute) to tmux pane' },
        { 'gl',         send_ai_path_lines_to_tmux,          desc = 'Send AI path:lines to tmux pane' },
        { 'gL',         send_ai_path_lines_absolute_to_tmux, desc = 'Send AI path:lines (absolute) to tmux pane' },
    } }
)
