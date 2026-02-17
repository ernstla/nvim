local opencode_pane_id = nil
local opencode_hidden_pane_id = nil
local opencode_split_direction = "-h"

local function copy_relative_path()
    vim.fn.setreg('+', vim.fn.expand('%'))
    print('Copied: ' .. vim.fn.expand('%'))
end
local function copy_absolute_path()
    vim.fn.setreg('+', vim.fn.expand('%:p'))
    print('Copied: ' .. vim.fn.expand('%:p'))
end

local function is_visual_mode()
    local mode = vim.fn.mode()
    return mode == 'v' or mode == 'V' or mode == '\22'
end

local function escape_visual_mode()
    vim.cmd('normal! ' .. vim.api.nvim_replace_termcodes('<Esc>', true, false, true))
end

local function format_ai_path(expand_arg, include_lines)
    local path = '@' .. vim.fn.expand(expand_arg)

    if not include_lines then
        return path
    end

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

local function with_visual_cleanup(action)
    local was_visual = is_visual_mode()
    action()

    if was_visual then
        escape_visual_mode()
    end
end

local function apply_ai_path(expand_arg, include_lines, handler)
    with_visual_cleanup(function()
        local path = format_ai_path(expand_arg, include_lines)
        handler(path)
    end)
end

local function copy_ai_path(expand_arg, include_lines)
    apply_ai_path(expand_arg, include_lines, function(path)
        vim.fn.setreg('+', path)
        print('Copied: ' .. path)
    end)
end

local function send_ai_path_to_pane(pane_id, expand_arg, include_lines)
    apply_ai_path(expand_arg, include_lines, function(path)
        vim.fn.system(string.format("tmux send-keys -t %s '%s '", pane_id, path))
        print('Sent: ' .. path)
    end)
end

local function get_current_window_id()
    local result = vim.fn.system("tmux display-message -p '#{window_id}'")
    return vim.trim(result)
end

local function get_current_pane_id()
    local result = vim.fn.system("tmux display-message -p '#{pane_id}'")
    return vim.trim(result)
end

local function get_column_count()
    local window_id = get_current_window_id()
    local result = vim.fn.system(string.format("tmux list-panes -t %s -F '#{pane_left}'", window_id))
    local columns = {}
    local count = 0

    for pane_left in result:gmatch("[^\n]+") do
        if not columns[pane_left] then
            columns[pane_left] = true
            count = count + 1
        end
    end

    return count
end

local function get_pane_window_and_command(pane_id)
    local result = vim.fn.system(
        string.format("tmux display-message -p -t %s '#{window_id}\t#{pane_current_command}'", pane_id))
    local window_id, cmd = result:match("^(%S+)\t(%S+)")
    return window_id, cmd
end

local function pane_is_running_opencode(pane_id)
    local _, cmd = get_pane_window_and_command(pane_id)
    return cmd == "opencode"
end

local function normalize_path(path)
    local trimmed = vim.trim(path or "")
    if trimmed == "" then
        return ""
    end

    local real = vim.loop.fs_realpath(trimmed)
    local normalized = real or trimmed
    return normalized:gsub("/+$", "")
end

local function paths_look_related(path_a, path_b)
    local a = normalize_path(path_a)
    local b = normalize_path(path_b)

    if a == "" or b == "" then
        return false
    end

    if a == b then
        return true
    end

    return a:sub(1, #b + 1) == (b .. "/") or b:sub(1, #a + 1) == (a .. "/")
end

local function get_pane_position(pane_id)
    local result = vim.fn.system(string.format("tmux display-message -p -t %s '#{pane_left}\t#{pane_top}'", pane_id))
    local left, top = result:match("^(%d+)\t(%d+)")
    if not left or not top then
        return nil, nil
    end

    return tonumber(left), tonumber(top)
end

local function infer_split_direction(reference_pane_id, target_pane_id)
    local ref_left, ref_top = get_pane_position(reference_pane_id)
    local target_left, target_top = get_pane_position(target_pane_id)

    if not ref_left or not target_left then
        return nil
    end

    if ref_left ~= target_left then
        return "-h"
    end

    if ref_top ~= target_top then
        return "-v"
    end

    return nil
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

    if #panes > 0 then
        return panes
    end

    -- Fallback: Check for external "opencode" session
    local result_ext = vim.fn.system(
        "tmux list-panes -t opencode -F '#{pane_id}\t#{pane_index}\t#{pane_current_command}\t#{pane_width}x#{pane_height}\t#{pane_current_path}' 2>/dev/null"
    )

    if vim.v.shell_error ~= 0 then
        return panes
    end

    local current_cwd = vim.fn.getcwd()
    for line in result_ext:gmatch("[^\n]+") do
        local pane_id, index, cmd, size, path = line:match("^(%S+)\t(%S+)\t(%S+)\t(%S+)\t(.*)$")
        if cmd == "opencode" and path == current_cwd then
            table.insert(panes, {
                id = pane_id,
                index = index,
                size = size,
            })
        end
    end

    return panes
end

local function find_opencode_panes_in_current_window()
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

local function find_opencode_panes_in_external_session()
    local result_ext = vim.fn.system(
        "tmux list-panes -t oc -F '#{pane_id}\t#{pane_index}\t#{pane_current_command}\t#{pane_width}x#{pane_height}\t#{pane_current_path}' 2>/dev/null"
    )

    if vim.v.shell_error ~= 0 then
        return {}
    end

    local panes = {}
    local current_cwd = vim.fn.getcwd()

    for line in result_ext:gmatch("[^\n]+") do
        local pane_id, index, cmd, size, path = line:match("^(%S+)\t(%S+)\t(%S+)\t(%S+)\t(.*)$")
        if cmd == "opencode" and paths_look_related(path, current_cwd) then
            table.insert(panes, {
                id = pane_id,
                index = index,
                size = size,
            })
        end
    end

    return panes
end

local function focus_pane(pane_id)
    vim.fn.system(string.format("tmux select-pane -t %s", pane_id))
end

local function send_ai_path_to_tmux_with(expand_arg, include_lines, focus_after)
    local function sender(pane_id)
        send_ai_path_to_pane(pane_id, expand_arg, include_lines)
        if focus_after then
            focus_pane(pane_id)
        end
    end

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
    send_ai_path_to_tmux_with('%', false, true)
end

local function send_ai_path_absolute_to_tmux()
    send_ai_path_to_tmux_with('%:p', false, true)
end

local function send_ai_path_lines_to_tmux()
    send_ai_path_to_tmux_with('%', true, true)
end

local function send_ai_path_lines_absolute_to_tmux()
    send_ai_path_to_tmux_with('%:p', true, true)
end

local function copy_ai_path_relative()
    copy_ai_path('%', false)
end

local function copy_ai_path_absolute()
    copy_ai_path('%:p', false)
end

local function copy_ai_path_lines_relative()
    copy_ai_path('%', true)
end

local function copy_ai_path_lines_absolute()
    copy_ai_path('%:p', true)
end

local function create_opencode_pane(split_arg, model)
    local subdir = vim.fn.getcwd()
    local current_pane = get_current_pane_id()
    local result = vim.fn.system(
        string.format(
            "tmux split-window -t %s %s -c %s -P -F '#{pane_id}'",
            current_pane,
            split_arg,
            vim.fn.shellescape(subdir)))
    opencode_split_direction = split_arg
    opencode_pane_id = vim.trim(result)
    local cmd = "opencode"
    if model then
        cmd = cmd .. " --model " .. model
    end
    vim.fn.system(string.format("tmux send-keys -t %s '%s' Enter", opencode_pane_id, cmd))
end

local function restore_hidden_opencode_pane(split_arg)
    local pane_id = nil

    if opencode_hidden_pane_id and pane_is_running_opencode(opencode_hidden_pane_id) then
        pane_id = opencode_hidden_pane_id
    end

    if not pane_id then
        local external_panes = find_opencode_panes_in_external_session()
        if #external_panes > 0 then
            pane_id = external_panes[1].id
        end
    end

    if not pane_id then
        return false
    end

    local current_pane = get_current_pane_id()
    vim.fn.system(string.format("tmux join-pane %s -s %s -t %s", split_arg, pane_id, current_pane))
    opencode_pane_id = pane_id
    opencode_hidden_pane_id = nil
    opencode_split_direction = split_arg

    return true
end

local function open_or_focus_opencode(split_arg, model)
    -- Check stored pane first
    if opencode_pane_id and is_pane_running_opencode(opencode_pane_id) then
        focus_pane(opencode_pane_id)
        return
    end

    if restore_hidden_opencode_pane(split_arg) then
        return
    end

    local panes = find_opencode_panes()

    if #panes == 0 then
        create_opencode_pane(split_arg, model)
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

local function opencode_horizontal(model)
    opencode_split_direction = "-h"
    open_or_focus_opencode("-h", model)
end

local function opencode_vertical(model)
    opencode_split_direction = "-v"
    open_or_focus_opencode("-v", model)
end

local function opencode_horizontal_new(model)
    opencode_split_direction = "-h"
    create_opencode_pane("-h", model)
end

local function opencode_vertical_new(model)
    opencode_split_direction = "-v"
    create_opencode_pane("-v", model)
end

local function toggle_opencode_pane()
    local local_panes = find_opencode_panes_in_current_window()

    if #local_panes > 0 then
        local pane_id = local_panes[1].id
        local current_pane = get_current_pane_id()
        local inferred_split = infer_split_direction(current_pane, pane_id)
        if inferred_split then
            opencode_split_direction = inferred_split
        end
        vim.fn.system("tmux has-session -t oc 2>/dev/null || tmux new-session -d -s oc")
        vim.fn.system(string.format("tmux break-pane -d -s %s -t oc:", pane_id))
        opencode_hidden_pane_id = pane_id
        opencode_pane_id = nil
        return
    end

    if not restore_hidden_opencode_pane(opencode_split_direction) then
        create_opencode_pane("-h")
    end
end

require("which-key").add(
    { {
        mode = { "n" },
        -- Control Opencode
        { '<leader>oc',  opencode_horizontal,                                                  desc = 'OpenCode (horizontal split)' },
        { '<leader>ooc', function() opencode_horizontal("github-copilot/claude-opus-4.6") end, desc = 'OpenCode Copilot Claude Opus 4.6' },
        { '<leader>ook', function() opencode_horizontal("opencode/kimi-k2.5") end,             desc = 'OpenCode Black Kimi K2.5' },
        { '<leader>ooo', function() opencode_horizontal("opencode/claude-opus-4-6") end,       desc = 'OpenCode Black Claude Opus 4.6' },
        { '<leader>ooz', function() opencode_horizontal("zai-coding-plan/glm-5") end,          desc = 'OpenCode Z.ai GLM-5' },
        { '<leader>oC',  opencode_vertical,                                                    desc = 'OpenCode (vertical split)' },
        { '<leader>ot',  toggle_opencode_pane,                                                 desc = 'Toggle OpenCode pane' },
        { '<leader>Oc',  opencode_horizontal_new,                                              desc = 'OpenCode new (horizontal split)' },
        { '<leader>OC',  opencode_vertical_new,                                                desc = 'OpenCode new (vertical split)' },
        -- File Paths
        { '<leader>cp',  copy_relative_path,                                                   desc = 'Copy relative file path' },
        { '<leader>cP',  copy_absolute_path,                                                   desc = 'Copy absolute file path' },
    }, {
        mode = { "n", "v" },
        -- File Paths
        { '<leader>ga', copy_ai_path_relative,               desc = 'Copy AI path (relative)' },
        { '<leader>gA', copy_ai_path_absolute,               desc = 'Copy AI path (absolute)' },
        { '<leader>gl', copy_ai_path_lines_relative,         desc = 'Copy AI path:lines (relative)' },
        { '<leader>gL', copy_ai_path_lines_absolute,         desc = 'Copy AI path:lines (absolute)' },
        { 'ga',         send_ai_path_to_tmux,                desc = 'Send AI path to tmux pane' },
        { 'gA',         send_ai_path_absolute_to_tmux,       desc = 'Send AI path (absolute) to tmux pane' },
        { 'gl',         send_ai_path_lines_to_tmux,          desc = 'Send AI path:lines to tmux pane' },
        { 'gL',         send_ai_path_lines_absolute_to_tmux, desc = 'Send AI path:lines (absolute) to tmux pane' },
    } }
)
