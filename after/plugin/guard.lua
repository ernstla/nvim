-- Formatter

local ft = require('guard.filetype')

local phpFixerArgs = {
    cmd = 'php-cs-fixer',
    args = {
        '--no-interaction',
        '--allow-risky=yes',
        '--config=.php-cs-fixer.dist.php',
        '--quiet',
        'fix',
    },
    fname = true,
    stdin = false,  -- php-cs-fixer does not support stdin/stdout
    stdout = false, -- triggers re-read file after formatting
}
ft('php'):fmt(phpFixerArgs)
ft('html'):fmt(phpFixerArgs)


ft('python'):fmt({
    cmd = 'ruff',
    args = { 'format', '-' },
    stdin = true,
}):append({
    cmd = 'ruff',
    args = { 'check', '-', '--fix', '--select', 'I' },
    stdin = true,
})

-- local prettier = {
--     cmd = 'prettier',
--     args = { '--stdin-filepath' },
--     fname = true,
--     stdin = true,
--     opts = {},
-- }

-- ft('css'):fmt(prettier)
-- ft('javascript'):fmt(prettier)
-- ft('svelte'):fmt(prettier)
-- ft('typescript'):fmt(prettier)
-- ft('scss'):fmt(prettier)

require('guard').setup({
    -- Choose to format on every write to a buffer
    fmt_on_save = false, -- Done via autocmd'ing GuardFmt. This setting seems to be unreliable - Ernst
    -- Use lsp if no formatter was defined for this filetype
    lsp_as_default_formatter = false,
})
