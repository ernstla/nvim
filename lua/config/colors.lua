local autocmd = vim.api.nvim_create_autocmd
local command = vim.api.nvim_create_user_command

local function has_color_under_cursor(bufnr)
    local color_presentation = vim.lsp.document_color.color_presentation
    local _, provider_class = debug.getupvalue(color_presentation, 2)
    local _, get_hl_info_under_cursor = debug.getupvalue(color_presentation, 3)

    local provider = provider_class and provider_class.active and provider_class.active[bufnr]
    if not provider or type(get_hl_info_under_cursor) ~= 'function' then
        return false
    end

    return get_hl_info_under_cursor(provider) ~= nil
end

local function color_presentation_when_ready(bufnr, attempts)
    if vim.api.nvim_get_current_buf() ~= bufnr then
        return
    end

    if has_color_under_cursor(bufnr) then
        vim.lsp.document_color.color_presentation()
        return
    end

    if attempts <= 0 then
        vim.notify('No color information under cursor.', vim.log.levels.WARN)
        return
    end

    vim.defer_fn(function()
        color_presentation_when_ready(bufnr, attempts - 1)
    end, 50)
end

autocmd('LspAttach', {
    callback = function(ev)
        vim.lsp.document_color.enable(false, { bufnr = ev.buf })
    end,
})

command('LspColors', function()
    local filter = { bufnr = 0 }
    vim.lsp.document_color.enable(not vim.lsp.document_color.is_enabled(filter), filter)
end, {})

command('LspColorsConvert', function()
    local bufnr = vim.api.nvim_get_current_buf()
    local filter = { bufnr = bufnr }

    if not vim.lsp.document_color.is_enabled(filter) then
        vim.lsp.document_color.enable(true, filter)
    end

    color_presentation_when_ready(bufnr, 10)
end, {})
