local ls = require('luasnip')
local fmt = require('luasnip/extras/fmt').fmt
local r = require('luasnip/extras').rep
local snippet = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local c = ls.choice_node

return {
    snippet('fmt', { t('import "core:fmt"') }),
    snippet('strings', { t('import "core:strings"') }),
    snippet('os', { t('import "core:os"') }),
    snippet('map', {
        i(1, 'name'),
        t({ ' := make(map[' }),
        i(2, 'string'),
        t({ ']' }),
        i(3, 'string'),
        t({ ')', 'defer delete(' }),
        r(1),
        t({ ')', '' }),
        i(0)
    }),
    snippet('proc', {
        i(1, 'name'),
        t({ ' :: proc(' }),
        i(2),
        t({ ') ' }),
        c(3, {
            fmt('-> {} ', { i(1, 'type') }),
            fmt('-> ({}) ', { i(1, 'type') }),
            t(''),
        }),
        t({ '{', '' }),
        c(4, {
            { t({ '\treturn ' }), i(1) },
            { t({ '\t' }),        i(1) },
        }),
        t({ '', '}' }),
    }),
    snippet('struct', {
        i(1, 'Name'),
        t({ ' :: struct {', '\t' }),
        i(2, 'field'),
        t(': '),
        i(3, 'type'),
        t({ ',', '}' }),
    }),
    snippet('enum', {
        i(1, 'Name'),
        t({ ' :: enum {', '\t' }),
        i(2, 'Value'),
        t({ ',', '}' }),
    }),
    snippet('union', {
        i(1, 'Name'),
        t({ ' :: union {', '\t' }),
        i(2, 'type'),
        t({ ',', '}' }),
    }),
    snippet('if', {
        t('if '),
        i(1),
        t({ ' {', '\t' }),
        i(2),
        t({ '', '}' }),
    }),
    snippet('else', {
        t('if '),
        i(1),
        t({ ' {', '\t' }),
        i(2),
        t({ '', '} else {', '\t' }),
        i(3),
        t({ '', '}' }),
    }),
    snippet('elif', {
        t('if '),
        i(1),
        t({ ' {', '\t' }),
        i(2),
        t({ '', '} else if ' }),
        i(3),
        t({ ' {', '\t' }),
        i(4),
        t({ '', '} else {', '\t' }),
        i(5),
        t({ '', '}' }),
    }),
    snippet('for', {
        t('for '),
        i(1),
        t({ ' {', '\t' }),
        i(2),
        t({ '', '}' }),
    }),
    snippet('fori', {
        t('for i := 0; i < '),
        i(1),
        t({ '; i += 1 {', '\t' }),
        i(2),
        t({ '', '}' }),
    }),
    snippet('each', {
        t('for '),
        i(1),
        t(' in '),
        i(2),
        t({ ' {', '\t' }),
        i(3),
        t({ '', '}' }),
    }),
    snippet('switch', {
        t('switch '),
        i(1),
        t({ ' {', 'case ' }),
        i(2),
        t({ ':', '\t' }),
        i(3),
        t({ '', 'case:', '\t' }),
        i(4),
        t({ '', '}' }),
    }),
    snippet('file', {
        t({ 'f, err := os.open("' }),
        i(1),
        t({ '")', '' }),
        t({ 'if err != os.ERROR_NONE {', '\t' }),
        i(2),
        t({ '', '}', 'defer os.close(f)' })
    }),
    snippet('log', {
        t({ 'fmt.println(' }),
        i(0),
        t({ ')' }),
    }),
    snippet('logs', {
        t({ 'fmt.println("' }),
        i(0),
        t({ '")' }),
    }),
}
