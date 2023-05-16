local ls = require("luasnip")

ls.add_snippets(nil, {
    all = require('ernst/snippets/all'),
    html = require('ernst/snippets/html'),
    php = require('ernst/snippets/php'),
    python = require('ernst/snippets/python'),
    svelte = require('ernst/snippets/svelte'),
    vue = require('ernst/snippets/vue'),
    javascript = require('ernst/snippets/javascript'),
})

ls.filetype_extend('typescript', { 'javascript' })
ls.filetype_extend('svelte', { 'javascript' })
ls.filetype_extend('vue', { 'javascript' })
