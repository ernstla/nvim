-- Formatter

require("conform").setup({
    formatters = {
        -- Only use python formatters if they are present in the virtual env
        ruff_format = {
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
        css = { { "prettierd", "prettier" } },
        html = { "php_cs_fixer" },
        javascript = { { "prettierd", "prettier" } },
        php = { "php_cs_fixer" },
        python = function(bufnr)
            if require("conform").get_formatter_info("ruff_format", bufnr).available then
                return { "ruff_format" }
            else
                return { "isort", "black" }
            end
        end,
        svelte = { { "prettierd", "prettier" } },
        typescript = { { "prettierd", "prettier" } },
        vue = { { "prettierd", "prettier" } },
    },
})
