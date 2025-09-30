local ls = require("luasnip")

local snippet = ls.snippet
local t = ls.text_node
local i = ls.insert_node

local snippets = {
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
    snippet('line', {
        t("console.log('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~');")
    }),
    snippet('ln', {
        t("console.log('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~');")
    }),
}

local words = require('ernst/snippets/words')
local word_snippet = function(word)
    return snippet(word:match("^[%s~]*(.-)[%s~]*$"), {
        t("console.log('~~~~~~~~~~~~" .. string.upper(word) .. "~~~~~~~~~~~');")
    })
end

for _, word in ipairs(words) do
    table.insert(snippets, word_snippet(word))
end

return snippets
