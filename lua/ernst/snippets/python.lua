local ls = require("luasnip")

local snippet = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {
    snippet('pprint', {
        t({ 'from pprint import pprint', 'pprint(', }),
        i(0),
        t(')'),
    }),
    snippet('pp', {
        t('pprint('),
        i(0),
        t(')'),
    }),
    snippet('print', {
        t('print('),
        i(0),
        t(')'),
    }),
    snippet('p', {
        t('print('),
        i(0),
        t(')'),
    }),
    snippet('ps', {
        t("print('"),
        i(0),
        t("')"),
    }),
    snippet('prints', {
        t("print('"),
        i(0),
        t("')"),
    }),
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
        t({ "if __main__ == '__main__':", '\t' }),
        i(0),
    }),
    snippet('hans', {
        t("print('~~~~~~~~~~~ HANS ~~~~~~~~~~~~')")
    }),
    snippet('franz', {
        t("print('~~~~~~~~~~~ FRANZ ~~~~~~~~~~~')")
    }),
    snippet('doldi', {
        t("print('~~~~~~~~~~~ DOLDI ~~~~~~~~~~~')")
    }),
    snippet('fritz', {
        t("print('~~~~~~~~~~~ FRITZ ~~~~~~~~~~~')")
    }),
    snippet('robert', {
        t("print('~~~~~~~~~~~ ROBERT ~~~~~~~~~~')")
    }),
    snippet('roland', {
        t("print('~~~~~~~~~~~ ROLAND ~~~~~~~~~~')")
    }),
}
