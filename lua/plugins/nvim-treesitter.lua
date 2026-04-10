local ensure_installed = {
    'c',
    'css',
    'go',
    'html',
    'javascript',
    'json',
    'lua',
    'markdown',
    'markdown_inline',
    'odin',
    'php',
    'python',
    'query',
    'rust',
    'scss',
    'svelte',
    'tsx',
    'typescript',
    'vim',
    'nim',
    'vimdoc',
    'yaml',
    'vue',
}

local treesitter = require('nvim-treesitter')

local function install_missing_parsers()
    local installed = treesitter.get_installed()
    local missing = vim.iter(ensure_installed)
        :filter(function(parser)
            return not vim.tbl_contains(installed, parser)
        end)
        :totable()

    if #missing == 0 then
        return
    end

    if vim.fn.executable('tree-sitter') == 1 then
        treesitter.install(missing)
        return
    end

    vim.schedule(function()
        vim.notify(
            'tree-sitter CLI not found; skipping parser installation. Install it with your system package manager, e.g. `brew install tree-sitter-cli`.',
            vim.log.levels.WARN,
            { title = 'nvim-treesitter' }
        )
    end)
end

local function with_parser(bufnr, callback)
    local lang = vim.treesitter.language.get_lang(vim.bo[bufnr].filetype)
    if not lang then
        return
    end

    local ok = vim.treesitter.language.add(lang)
    if not ok then
        return
    end

    callback(lang)
end

local function enable_treesitter(bufnr, opts)
    with_parser(bufnr, function(lang)
        if opts.highlight then
            vim.treesitter.start(bufnr, lang)
        end

        vim.wo[0][0].foldexpr = 'v:lua.vim.treesitter.foldexpr()'
        vim.wo[0][0].foldmethod = 'expr'
        vim.bo[bufnr].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
    end)
end

install_missing_parsers()

vim.api.nvim_create_autocmd('FileType', {
    pattern = {
        'c', 'css', 'go', 'json', 'lua', 'markdown', 'markdown_inline', 'odin', 'query', 'rust',
        'scss', 'svelte', 'tsx', 'typescript', 'vim', 'nim', 'vimdoc', 'yaml', 'vue',
    },
    callback = function(ev)
        enable_treesitter(ev.buf, { highlight = true })
    end,
})

-- languages without treesitter syntax highlighting
vim.api.nvim_create_autocmd('FileType', {
    pattern = { 'html', 'php', 'python', 'javascript' },
    callback = function(ev)
        enable_treesitter(ev.buf, { highlight = false })
    end,
})
