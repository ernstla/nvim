local ls = require("luasnip")

local snippet = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {
    snippet('log', {
        t('console.log('),
        i(0),
        t(');'),
    }),
    snippet('logs', {
        t("console.log('"),
        i(0),
        t("');"),
    }),
    snippet('imp', {
        t("import { "),
        i(1),
        t(" } from '"),
        i(0),
        t("';"),
    }),
    snippet('import', {
        t("import "),
        i(1),
        t(" from '"),
        i(0),
        t("';"),
    }),
    snippet('stack', {
        t('console.log(new Error().stack);'),
        i(0)
    }),
    snippet('trace', {
        t('console.log(new Error().stack);'),
        i(0)
    }),
}
