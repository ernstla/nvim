local ls = require("luasnip")

ls.add_snippets(nil, {
    all = require('config/snippets/all'),
    html = require('config/snippets/html'),
    javascript = require('config/snippets/javascript'),
    json = require('config/snippets/json'),
    mako = require('config/snippets/mako'),
    odin = require('config/snippets/odin'),
    php = require('config/snippets/php'),
    python = require('config/snippets/python'),
    svelte = require('config/snippets/svelte'),
    vue = require('config/snippets/vue'),
})

ls.filetype_extend('mako', { 'python' })
ls.filetype_extend('typescript', { 'javascript' })
ls.filetype_extend('svelte', { 'javascript' })
ls.filetype_extend('vue', { 'javascript' })
