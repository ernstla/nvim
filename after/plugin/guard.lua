-- Formatter

local ft = require('guard.filetype')

ft('php'):fmt({
    cmd = 'php-cs-fixer',
    args = {
        '--no-interaction',
        '--config=.php-cs-fixer.dist.php',
        '--quiet',
        'fix',
    },
    fname = true,
    stdin = false,  -- php-cs-fixer does not support stdin/stdout
    stdout = false, -- triggers re-read file after formatting
})

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
