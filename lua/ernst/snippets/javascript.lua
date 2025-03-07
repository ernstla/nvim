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
    snippet('hinna', {
        t("console.log('~~~~~~~~~~~ HINNA ~~~~~~~~~~~');")
    }),
    snippet('dinna', {
        t("console.log('~~~~~~~~~~~ DINNA ~~~~~~~~~~~');")
    }),
    snippet('danna', {
        t("console.log('~~~~~~~~~~~ DANNA ~~~~~~~~~~~');")
    }),
    snippet('daua', {
        t("console.log('~~~~~~~~~~~ DAUA ~~~~~~~~~~~~');")
    }),
    snippet('hans', {
        t("console.log('~~~~~~~~~~~ HANS ~~~~~~~~~~~~');")
    }),
    snippet('günter', {
        t("console.log('~~~~~~~~~~ GÜNTER ~~~~~~~~~~~');")
    }),
    snippet('günther', {
        t("console.log('~~~~~~~~~~ GÜNTHER ~~~~~~~~~~');")
    }),
    snippet('franz', {
        t("console.log('~~~~~~~~~~~ FRANZ ~~~~~~~~~~~');")
    }),
    snippet('doldi', {
        t("console.log('~~~~~~~~~~~ DOLDI ~~~~~~~~~~~');")
    }),
    snippet('fritz', {
        t("console.log('~~~~~~~~~~~ FRITZ ~~~~~~~~~~~');")
    }),
    snippet('robert', {
        t("console.log('~~~~~~~~~~~ ROBERT ~~~~~~~~~~');")
    }),
    snippet('roland', {
        t("console.log('~~~~~~~~~~~ ROLAND ~~~~~~~~~~');")
    }),
    snippet('line', {
        t("console.log('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~');")
    }),
    snippet('ln', {
        t("console.log('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~');")
    }),
}
