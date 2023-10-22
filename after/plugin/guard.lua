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
    cmd = 'black',
    args = { '--quiet', '-' },
    stdin = true,
}):append({
    cmd = 'isort',
    args = { '--', '-' },
    stdin = true,
})

ft('vue,svelte'):fmt({
    cmd = 'prettier',
    args = { '--stdin-filepath' },
    fname = true,
    stdin = true,
})
