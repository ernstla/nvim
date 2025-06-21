return {
    name = "gopls",
    cmd = { "gopls" },
    filetypes = { 'go', 'gomod', 'gowork', 'gotmpl' },
    root_dir = vim.fs.dirname(vim.fs.find({ "go.mod", ".git" }, { upward = true })[1]),
    settings = {
        gopls = {
            -- Enable import completion
            completeUnimported = true,
            -- Add missing imports on completion
            importShortcut = "Both",
            -- Organize imports on save
            gofumpt = true,
            -- Enable semantic tokens
            semanticTokens = true,
            -- Experimental features
            experimentalPostfixCompletions = true,
            -- Enable more detailed completion
            usePlaceholders = true,
            -- Enable deep completion
            deepCompletion = true,
            -- Matcher for completion
            matcher = "Fuzzy",
        }
    },
    -- Auto-format and organize imports on save
    on_attach = function(client, bufnr)
        -- Enable completion triggered by <c-x><c-o>
        vim.bo[bufnr].omnifunc = "v:lua.vim.lsp.omnifunc"

        -- Auto-format and organize imports on save
        vim.api.nvim_create_autocmd("BufWritePre", {
            buffer = bufnr,
            callback = function()
                vim.lsp.buf.format({ async = false })
                -- Organize imports
                local params = vim.lsp.util.make_range_params()
                params.context = { only = { "source.organizeImports" } }
                local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, 3000)
                for _, res in pairs(result or {}) do
                    for _, r in pairs(res.result or {}) do
                        if r.edit then
                            vim.lsp.util.apply_workspace_edit(r.edit, "utf-8")
                        end
                    end
                end
            end,
        })
    end,
}
