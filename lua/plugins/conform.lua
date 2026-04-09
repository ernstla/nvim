require('conform').setup({
    formatters = {
        -- Only use python formatters if they are present in the virtual env
        ruff_format = {
            command = (os.getenv("VIRTUAL_ENV") or "NOT/AVAILABLE") .. "/bin/ruff"
        },
        ruff_fix = {
            command = (os.getenv("VIRTUAL_ENV") or "NOT/AVAILABLE") .. "/bin/ruff"
        },
        black = {
            command = (os.getenv("VIRTUAL_ENV") or "NOT/AVAILABLE") .. "/bin/black"
        },
        isort = {
            command = (os.getenv("VIRTUAL_ENV") or "NOT/AVAILABLE") .. "/bin/isort"
        },
    },
    formatters_by_ft = {
        css = { "prettierd", "prettier", stop_after_first = true },
        scss = { "prettierd", "prettier", stop_after_first = true },
        html = { "mago_format", "php_cs_fixer", stop_after_first = true },
        javascript = { "prettierd", "prettier", stop_after_first = true },
        php = function(bufnr)
            if require("conform").get_formatter_info("mago_format", bufnr).available then
                return { "mago_format", "mago_lint" }
            else
                return { "php_cs_fixer" }
            end
        end,
        python = function(bufnr)
            if require("conform").get_formatter_info("ruff_format", bufnr).available then
                return { "ruff_format", "ruff_fix" }
            else
                return { "isort", "black" }
            end
        end,
        svelte = { "prettierd", "prettier", stop_after_first = true },
        typescript = { "prettierd", "prettier", stop_after_first = true },
        vue = { "prettierd", "prettier", stop_after_first = true },
        json = { "prettierd", "prettier", stop_after_first = true },
        jsonc = { "prettierd", "prettier", stop_after_first = true },
        nim = { "nph", "nimpretty", stop_after_first = true },
        markdown = { "prettierd", "prettier", stop_after_first = true },
    },
    format_on_save = {
        lsp_format = "fallback",
        timeout_ms = 2000,
    },
})
