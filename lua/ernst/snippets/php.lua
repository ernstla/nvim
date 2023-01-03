local ls = require("luasnip")

local snippet = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {
    snippet('strict', {
        t({ '<?php', '', 'declare(strict_types=1);', '', '' }),
        i(0)
    }),
    snippet('php', {
        t('<?php '),
        i(0),
        t(' ?>'),
    }),
    snippet('=', {
        t('<?= '),
        i(0),
        t(' ?>'),
    }),
    snippet('_', {
        t("<?= _('"),
        i(0),
        t("') ?>"),
    }),
    snippet('construct', {
        t('public function __construct('),
        i(1),
        t({ ') {', '\t' }),
        i(0),
        t({ '', '}' }),
    }),
    snippet('log', {
        t('error_log('),
        i(0),
        t(');'),
    }),
    snippet('logs', {
        t("error_log('"),
        i(0),
        t("');"),
    }),
    snippet('logr', {
        t('error_log(print_r('),
        i(0),
        t(', true));'),
    }),
    snippet('print', {
        t('print('),
        i(0),
        t(', "\\n");'),
    }),
    snippet('ps', {
        t("print('"),
        i(0),
        t("'" .. '. "\\n");'),
    }),
    snippet('prints', {
        t("print('"),
        i(0),
        t("'" .. '. "\\n");'),
    }),
    snippet('pr', {
        t('print_r('),
        i(0),
        t(');'),
    }),
    snippet('printr', {
        t('print_r('),
        i(0),
        t(');'),
    }),
    snippet('hans', {
        t("echo '~~~~~~~~~~~ HANS ~~~~~~~~~~~~'")
    }),
    snippet('franz', {
        t("echo '~~~~~~~~~~~ FRANZ ~~~~~~~~~~~'")
    }),
    snippet('doldi', {
        t("echo '~~~~~~~~~~~ DOLDI ~~~~~~~~~~~'")
    }),
    snippet('fritz', {
        t("echo '~~~~~~~~~~~ FRITZ ~~~~~~~~~~~'")
    }),
    snippet('robert', {
        t("echo '~~~~~~~~~~~ ROBERT ~~~~~~~~~~'")
    }),
    snippet('roland', {
        t("echo '~~~~~~~~~~~ ROLAND ~~~~~~~~~~'")
    }),
}
