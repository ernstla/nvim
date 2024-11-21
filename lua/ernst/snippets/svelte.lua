local ls = require("luasnip")

local snippet = ls.snippet
local rep = require("luasnip.extras").rep
local fmt = require("luasnip.extras.fmt").fmt
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
    snippet('el', {
        t('{:else}'),
    }),
    snippet('each', {
        t('{#each '),
        i(1, 'iterator'),
        t({ '}', '\t' }),
        i(0),
        t({ '', '{/each}' }),
    }),
    snippet('key', {
        t('{#key '),
        i(1, 'value'),
        t({ '}', '\t' }),
        i(0),
        t({ '', '{/key}' }),
    }),
    snippet('snippet', {
        t('{#snippet '),
        i(1, 'name'),
        t({ '()}', '\t' }),
        i(0),
        t({ '', '{/snippet}' }),
    }),
    snippet('debug', {
        t('{@debug '),
        i(0),
        t('}'),
    }),
    snippet('logr', {
        t('<pre>{JSON.stringify('),
        i(0),
        t(', null, 2)}</pre>'),
    }),
    snippet('pprint', {
        t('<pre>{JSON.stringify('),
        i(0),
        t(', null, 2)}</pre>'),
    }),
    snippet('render', {
        t('{@render '),
        i(1, 'name'),
        t('('),
        i(0),
        t(')}'),
    }),
    snippet('_', {
        t("{_('"),
        i(0),
        t("')}"),
    }),
    snippet('script', {
        t({ '<script lang="ts">', '\t' }),
        i(0),
        t({ '', '</script>' }),
    }),
    snippet('style', {
        t({ '<style lang="postcss">', '\t' }),
        i(0),
        t({ '', '</style>' }),
    }),
    snippet("imps",
        fmt("import {a} from '{b}{a}.svelte';", {
            a = i(1, "Module"),
            b = i(0)
        }, {
            repeat_duplicates = true
        })
    )
}
