local ls = require("luasnip")

local snippet = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {
    snippet('if', {
        t('{#if '),
        i(1, 'condition'),
        t({ '}', '\t' }),
        i(0),
        t({ '', '{/if}' }),
    }),
    snippet('else', {
        t('{#if '),
        i(1, 'condition'),
        t({ '}', '\t' }),
        i(2),
        t({ '', '{:else}', '\t' }),
        i(0),
        t({ '', '{/if}' }),
    }),
    snippet('each', {
        t('{#each '),
        i(1, 'condition'),
        t({ '}', '\t' }),
        i(0),
        t({ '', '{/each}' }),
    }),
    snippet('debug', {
        t('{@debug '),
        i(0),
        t('}'),
    }),
    snippet('_', {
        t("{_('"),
        i(0),
        t("')}"),
    }),
}
