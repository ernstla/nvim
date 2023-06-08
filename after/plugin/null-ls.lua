local null_ls = require("null-ls")

null_ls.setup({
    sources = {
        null_ls.builtins.formatting.prettier,
        null_ls.builtins.formatting.phpcsfixer,
        --null_ls.builtins.diagnostics.php,
        --null_ls.builtins.diagnostics.phpcs,
        --null_ls.builtins.diagnostics.psalm,
    },
})
