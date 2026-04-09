local ls = require("luasnip")

local snippet = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {
    snippet('_', {
        t('${_(\''),
        i(0),
        t('\')}'),
    }),
    snippet('$', {
        t('${'),
        i(0),
        t('}'),
    }),
}
