local ls = require("luasnip")

local snippet = ls.snippet
local t = ls.text_node
local i = ls.insert_node

local echo = function()
    return {
        t('print('),
        i(0),
        t(')'),
    }
end
local pprint = function()
    return {
        t({ 'from pprint import pprint', 'pprint(', }),
        i(0),
        t(')'),
    }
end
local prints = function()
    return {
        t("print('"),
        i(0),
        t("')"),
    }
end
local line = function()
    return {
        t("print('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"),
        i(0),
        t("')"),
    }
end

local snippets = {
    snippet('pprint', pprint()),
    snippet('logr', pprint()),
    snippet('pp', {
        t('pprint('),
        i(0),
        t(')'),
    }),
    snippet('print', echo()),
    snippet('log', echo()),
    snippet('logs', prints()),
    snippet('prints', prints()),
    snippet('pdb', {
        t('import pdb; pdb.set_trace()'),
    }),
    snippet('caller', {
        t('import inspect; print(inspect.stack()[1][3])'),
    }),
    snippet('init', {
        t({ 'def __init__(self):', '\t' }),
        i(0),
    }),
    snippet('main', {
        t({ "if __name__ == '__main__':", '\t' }),
        i(0),
    }),
    snippet('line', line()),
    snippet('ln', line()),
}

local words = require('ernst/snippets/words')
local word_snippet = function(word)
    return snippet(word, {
        t("print('~~~~~~~~~~~~~" .. string.upper(word) .. "~~~~~~~~~~')")
    })
end

for _, word in ipairs(words) do
    table.insert(snippets, word_snippet(word))
end

return snippets
