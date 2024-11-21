local ls = require("luasnip")

local snippet = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {
    snippet('logr', {
        t('<pre>{{JSON.stringify('),
        i(0),
        t(', null, 2)}}</pre>'),
    }),
    snippet('pprint', {
        t('<pre>{{JSON.stringify('),
        i(0),
        t(', null, 2)}}</pre>'),
    }),
}
