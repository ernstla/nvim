local ls = require("luasnip")

local snippet = ls.snippet
local t = ls.text_node
local i = ls.insert_node

local snippets = {
    snippet('repo', {
        t({ '"repositories": [{', '\t"type": "path",', '\t"url": "../../' }),
        i(0),
        t({ '"', '}],' })
    }),
}

return snippets
