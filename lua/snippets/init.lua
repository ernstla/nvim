local ls = require("luasnip")

ls.add_snippets(nil, {
    all = require('snippets/all'),
    html = require('snippets/html'),
    javascript = require('snippets/javascript'),
    json = require('snippets/json'),
    mako = require('snippets/mako'),
    odin = require('snippets/odin'),
    php = require('snippets/php'),
    python = require('snippets/python'),
    svelte = require('snippets/svelte'),
    vue = require('snippets/vue'),
})

ls.filetype_extend('mako', { 'python' })
ls.filetype_extend('typescript', { 'javascript' })
ls.filetype_extend('svelte', { 'javascript' })
ls.filetype_extend('vue', { 'javascript' })
