local ls = require("luasnip")

local snippet = ls.snippet
local t = ls.text_node
local i = ls.insert_node

local pprint = {
    t('<pre>{{JSON.stringify('),
    i(0),
    t(', null, 2)}}</pre>'),
}

return {
    snippet('logr', pprint),
    snippet('pprint', pprint),
    snippet('{', {
        t('{{'),
        i(0),
        t('}}'),
    }),
    snippet('_', {
        t("{{i18n['"),
        i(0),
        t("']}}"),
    }),
}
