-- Formatter

return { {
    'stevearc/conform.nvim',
    opts = {
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
            html = { "php_cs_fixer" },
            javascript = { "prettierd", "prettier", stop_after_first = true },
            php = { "php_cs_fixer" },
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
        },
    }
} }
