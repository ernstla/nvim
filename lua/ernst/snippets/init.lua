local ls = require("luasnip")

ls.add_snippets(nil, {
    all = require('ernst/snippets/all'),
    svelte = require('ernst/snippets/svelte'),
})
