local harnesses = {
    opencode = {
        id = "opencode",
        label = "opencode",
        launch_command = "opencode",
        match_commands = {
            opencode = true,
        },
        match_tokens = { "opencode" },
        external_sessions = { "oc", "opencode" },
        supports_model = true,
    },
    pi = {
        id = "pi",
        label = "pi",
        launch_command = "pi",
        match_commands = {
            pi = true,
        },
        fallback_commands = {
            node = true,
        },
        match_tokens = { "pi" },
        external_sessions = { "pi" },
        supports_model = false,
    },
    claude = {
        id = "claude",
        label = "claude code",
        launch_command = "claude",
        match_commands = {
            claude = true,
        },
        fallback_commands = {
            node = true,
        },
        match_tokens = { "claude" },
        external_sessions = { "cc", "claude" },
        supports_model = false,
    },
}

local harness_order = { "opencode", "pi", "claude" }
local current_harness_id = "opencode"
local harness_state = {}

for _, harness_id in ipairs(harness_order) do
    harness_state[harness_id] = {
        pane_id = nil,
        hidden_pane_id = nil,
        split_direction = "-h",
    }
end

local function get_harness(harness_id)
    return harnesses[harness_id or current_harness_id]
end

local function get_current_harness()
    return get_harness(current_harness_id)
end

local function get_state(harness_id)
    return harness_state[harness_id or current_harness_id]
end

local function is_supported_harness(harness_id)
    return harnesses[harness_id] ~= nil
end

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
        vim.fn.system(string.format("tmux send-keys -t %s %s", pane_id, vim.fn.shellescape(path .. " ")))
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

local function command_has_token(command, token)
    if not command or command == "" or not token or token == "" then
        return false
    end

    for part in command:gmatch("%S+") do
        if part == token then
            return true
        end

        local suffix = "/" .. token
        if part:sub(- #suffix) == suffix then
            return true
        end
    end

    return false
end

local function command_has_any_token(command, tokens)
    for _, token in ipairs(tokens or {}) do
        if command_has_token(command, token) then
            return true
        end
    end

    return false
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

local function get_pane_details(pane_id)
    local result = vim.fn.system(
        string.format(
            "tmux display-message -p -t %s '#{window_id}\t#{pane_current_command}\t#{pane_start_command}\t#{pane_tty}\t#{pane_current_path}'",
            pane_id))
    local window_id, cmd, start_command, tty, path = result:match("^(%S+)\t(%S*)\t(.-)\t(%S*)\t(.*)$")

    if not window_id then
        return nil
    end

    return {
        window_id = window_id,
        cmd = cmd,
        start_command = start_command,
        tty = tty,
        path = path,
    }
end

local function get_tty_process_args(tty)
    local tty_path = vim.trim(tty or "")
    if tty_path == "" then
        return ""
    end

    local tty_name = tty_path:gsub("^/dev/", "")
    local result = vim.fn.system(string.format("ps -t %s -o args=", vim.fn.shellescape(tty_name)))
    if vim.v.shell_error ~= 0 then
        return ""
    end

    return result
end

local function pane_matches_harness(pane, harness)
    if not pane or not harness then
        return false
    end

    if harness.match_commands[pane.cmd] then
        return true
    end

    if command_has_any_token(pane.start_command, harness.match_tokens) then
        return true
    end

    if harness.fallback_commands and harness.fallback_commands[pane.cmd] then
        return command_has_any_token(get_tty_process_args(pane.tty), harness.match_tokens)
    end

    return false
end

local function pane_is_running_harness(pane_id, harness_id)
    local pane = get_pane_details(pane_id)
    return pane_matches_harness(pane, get_harness(harness_id))
end

local function is_pane_running_harness_in_current_window(pane_id, harness_id)
    local current_window = get_current_window_id()
    local pane = get_pane_details(pane_id)
    if not pane then
        return false
    end

    return pane.window_id == current_window and pane_matches_harness(pane, get_harness(harness_id))
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

local function list_tmux_panes(target)
    local target_arg = ""
    if target and target ~= "" then
        target_arg = string.format("-t %s ", vim.fn.shellescape(target))
    end

    local result = vim.fn.system(
        string.format(
            "tmux list-panes %s-F '#{pane_id}\t#{pane_index}\t#{pane_current_command}\t#{pane_start_command}\t#{pane_width}x#{pane_height}\t#{pane_tty}\t#{pane_current_path}\t#{window_id}' 2>/dev/null",
            target_arg))

    if vim.v.shell_error ~= 0 then
        return {}
    end

    local panes = {}
    for line in result:gmatch("[^\n]+") do
        local pane_id, index, cmd, start_command, size, tty, path, window_id =
            line:match("^(%S+)\t(%S+)\t(%S*)\t(.-)\t(%S+)\t(%S*)\t(.-)\t(%S+)$")
        if pane_id then
            table.insert(panes, {
                id = pane_id,
                index = index,
                cmd = cmd,
                start_command = start_command,
                size = size,
                tty = tty,
                path = path,
                window_id = window_id,
            })
        end
    end

    return panes
end

local function find_matching_panes(panes, harness_id, path_matcher)
    local matched = {}
    local harness = get_harness(harness_id)
    local current_cwd = vim.fn.getcwd()

    for _, pane in ipairs(panes) do
        if pane_matches_harness(pane, harness) then
            local path_matches = true
            if path_matcher == "exact" then
                path_matches = pane.path == current_cwd
            elseif path_matcher == "related" then
                path_matches = paths_look_related(pane.path, current_cwd)
            end

            if path_matches then
                table.insert(matched, {
                    id = pane.id,
                    index = pane.index,
                    size = pane.size,
                })
            end
        end
    end

    return matched
end

local function find_agent_panes(harness_id)
    local window_id = get_current_window_id()
    local panes = find_matching_panes(list_tmux_panes(window_id), harness_id)
    if #panes > 0 then
        return panes
    end

    local harness = get_harness(harness_id)
    for _, session in ipairs(harness.external_sessions) do
        local external = find_matching_panes(list_tmux_panes(session), harness_id, "exact")
        if #external > 0 then
            return external
        end
    end

    return {}
end

local function find_agent_panes_in_current_window(harness_id)
    local window_id = get_current_window_id()
    return find_matching_panes(list_tmux_panes(window_id), harness_id)
end

local function find_agent_panes_in_external_session(harness_id)
    local harness = get_harness(harness_id)
    for _, session in ipairs(harness.external_sessions) do
        local panes = find_matching_panes(list_tmux_panes(session), harness_id, "related")
        if #panes > 0 then
            return panes
        end
    end

    return {}
end

local function focus_pane(pane_id)
    vim.fn.system(string.format("tmux select-pane -t %s", pane_id))
end

local function set_current_harness(harness_id, silent)
    if not is_supported_harness(harness_id) then
        print(string.format("Unknown harness: %s", harness_id))
        return false
    end

    current_harness_id = harness_id
    if not silent then
        local harness = get_current_harness()
        print(string.format("Agent harness: %s", harness.label))
    end

    return true
end

local function get_harness_label(harness_id)
    local harness = get_harness(harness_id)
    return harness and harness.label or "Agent"
end

local function select_harness()
    local items = {}
    local id_map = {}

    for _, harness_id in ipairs(harness_order) do
        local harness = get_harness(harness_id)
        local label = string.format("%s (%s)", harness.label, harness.id)
        if harness_id == current_harness_id then
            label = label .. " [current]"
        end
        table.insert(items, label)
        id_map[label] = harness_id
    end

    vim.ui.select(items, { prompt = "Select agent harness:" }, function(choice)
        if not choice then
            return
        end

        set_current_harness(id_map[choice])
    end)
end

local function send_ai_path_to_tmux_with(expand_arg, include_lines, focus_after)
    local state = get_state()

    local function sender(pane_id)
        send_ai_path_to_pane(pane_id, expand_arg, include_lines)
        if focus_after then
            focus_pane(pane_id)
        end
    end

    -- Check stored pane first
    if state.pane_id and is_pane_running_harness_in_current_window(state.pane_id, current_harness_id) then
        sender(state.pane_id)
        return
    end

    local panes = find_agent_panes(current_harness_id)

    if #panes == 0 then
        print(string.format("No %s pane found", get_harness_label(current_harness_id)))
        return
    end

    if #panes == 1 then
        state.pane_id = panes[1].id
        sender(state.pane_id)
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

    vim.ui.select(items, { prompt = string.format("Select %s pane:", get_harness_label(current_harness_id)) },
        function(choice)
            if choice then
                state.pane_id = id_map[choice]
                sender(state.pane_id)
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

local function build_harness_command(harness, model)
    local cmd = harness.launch_command
    if model then
        if harness.supports_model then
            cmd = cmd .. " --model " .. model
        else
            print(string.format("%s does not support model overrides", harness.label))
        end
    end

    return cmd
end

local function create_agent_pane(split_arg, model)
    local harness = get_current_harness()
    local state = get_state()
    local subdir = vim.fn.getcwd()
    local current_pane = get_current_pane_id()
    local result = vim.fn.system(
        string.format(
            "tmux split-window -t %s %s -c %s -P -F '#{pane_id}'",
            current_pane,
            split_arg,
            vim.fn.shellescape(subdir)))

    state.split_direction = split_arg
    state.pane_id = vim.trim(result)

    local cmd = build_harness_command(harness, model)
    vim.fn.system(string.format("tmux send-keys -t %s %s Enter", state.pane_id, vim.fn.shellescape(cmd)))
end

local function restore_hidden_agent_pane(split_arg)
    local state = get_state()
    local pane_id = nil

    if state.hidden_pane_id and pane_is_running_harness(state.hidden_pane_id, current_harness_id) then
        pane_id = state.hidden_pane_id
    end

    if not pane_id then
        local external_panes = find_agent_panes_in_external_session(current_harness_id)
        if #external_panes > 0 then
            pane_id = external_panes[1].id
        end
    end

    if not pane_id then
        return false
    end

    local current_pane = get_current_pane_id()
    vim.fn.system(string.format("tmux join-pane %s -s %s -t %s", split_arg, pane_id, current_pane))
    state.pane_id = pane_id
    state.hidden_pane_id = nil
    state.split_direction = split_arg

    return true
end

local function open_or_focus_agent(split_arg, model)
    local state = get_state()

    -- Check stored pane first
    if state.pane_id and is_pane_running_harness_in_current_window(state.pane_id, current_harness_id) then
        focus_pane(state.pane_id)
        return
    end

    if restore_hidden_agent_pane(split_arg) then
        return
    end

    local panes = find_agent_panes(current_harness_id)

    if #panes == 0 then
        create_agent_pane(split_arg, model)
        return
    end

    if #panes == 1 then
        state.pane_id = panes[1].id
        focus_pane(state.pane_id)
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

    vim.ui.select(items, { prompt = string.format("Select %s pane:", get_harness_label(current_harness_id)) },
        function(choice)
            if choice then
                state.pane_id = id_map[choice]
                focus_pane(state.pane_id)
            end
        end)
end

local function resize_panes()
    if get_column_count() > 2 then
        vim.fn.system("tmux resize-pane -t 1 -x 32%")
        vim.fn.system("tmux resize-pane -t 3 -x 31%")
    end
end

local function agent_horizontal(model)
    local state = get_state()
    state.split_direction = "-h"
    open_or_focus_agent("-h", model)
    resize_panes()
end

local function agent_vertical(model)
    local state = get_state()
    state.split_direction = "-v"
    open_or_focus_agent("-v", model)
end

local function agent_horizontal_new(model)
    local state = get_state()
    state.split_direction = "-h"
    create_agent_pane("-h", model)
    resize_panes()
end

local function agent_vertical_new(model)
    local state = get_state()
    state.split_direction = "-v"
    create_agent_pane("-v", model)
end

local function toggle_agent_pane()
    local state = get_state()
    local harness = get_current_harness()
    local local_panes = find_agent_panes_in_current_window(current_harness_id)

    if #local_panes > 0 then
        local pane_id = local_panes[1].id
        local current_pane = get_current_pane_id()
        local inferred_split = infer_split_direction(current_pane, pane_id)
        if inferred_split then
            state.split_direction = inferred_split
        end

        local hidden_session = harness.external_sessions[1] or harness.id
        vim.fn.system(string.format("tmux has-session -t %s 2>/dev/null || tmux new-session -d -s %s",
            vim.fn.shellescape(hidden_session), vim.fn.shellescape(hidden_session)))
        vim.fn.system(string.format("tmux break-pane -d -s %s -t %s:", pane_id, vim.fn.shellescape(hidden_session)))
        state.hidden_pane_id = pane_id
        state.pane_id = nil
        return
    end

    if not restore_hidden_agent_pane(state.split_direction) then
        create_agent_pane(state.split_direction)
    end
end

local function current_harness_status()
    local harness = get_current_harness()
    return string.format("  %s", harness.id)
end

if vim.fn.exists(':Harness') == 0 then
    vim.api.nvim_create_user_command('Harness', function(opts)
        local arg = vim.trim(opts.args or "")
        if arg == "" then
            print(string.format("Current agent harness: %s", get_harness_label(current_harness_id)))
            return
        end

        set_current_harness(arg)
    end, {
        nargs = '?',
        desc = 'Set or show current agent harness',
        complete = function()
            return harness_order
        end,
    })
end

require("which-key").add(
    { {
        mode = { "n" },
        -- Control Agent Harness
        { '<leader>oc',  agent_horizontal,                                                  desc = 'Agent (horizontal split)' },
        { '<leader>ooc', function() agent_horizontal("github-copilot/claude-opus-4.6") end, desc = 'OpenCode Copilot Claude Opus 4.6' },
        { '<leader>oog', function() agent_horizontal("opencode/gemini-3.1-pro") end,        desc = 'OpenCode Zen Gemini 3.1 Pro' },
        { '<leader>ook', function() agent_horizontal("opencode/kimi-k2.5") end,             desc = 'OpenCode Zen Kimi K2.5' },
        { '<leader>ooo', function() agent_horizontal("opencode/claude-opus-4-6") end,       desc = 'OpenCode Zen Claude Opus 4.6' },
        { '<leader>oos', function() agent_horizontal("opencode/claude-sonnet-4-6") end,     desc = 'OpenCode Zen Claude Sonnet 4.6' },
        { '<leader>ooz', function() agent_horizontal("zai-coding-plan/glm-5") end,          desc = 'OpenCode Z.ai GLM-5' },
        { '<leader>oC',  agent_vertical,                                                    desc = 'Agent (vertical split)' },
        { '<leader>oh',  select_harness,                                                    desc = 'Select agent harness' },
        { '<leader>ot',  toggle_agent_pane,                                                 desc = 'Toggle agent pane' },
        { '<leader>Oc',  agent_horizontal_new,                                              desc = 'Agent new (horizontal split)' },
        { '<leader>OC',  agent_vertical_new,                                                desc = 'Agent new (vertical split)' },
        -- File Paths
        { '<leader>cp',  copy_relative_path,                                                desc = 'Copy relative file path' },
        { '<leader>cP',  copy_absolute_path,                                                desc = 'Copy absolute file path' },
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

return {
    current_harness = function()
        return current_harness_id
    end,
    current_harness_label = function()
        return get_harness_label(current_harness_id)
    end,
    current_harness_status = current_harness_status,
    set_current_harness = set_current_harness,
    select_harness = select_harness,
}
