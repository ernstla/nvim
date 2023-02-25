local ls = require("luasnip")

local snippet = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {
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
    snippet('foreach', {
        t('<?php foreach ('), i(1), t(' as '), i(2), t({ ') : ?>', '' }),
        t('\t'), i(0),
        t({ '', '<?php endforeach ?>' }),
    }),
    snippet('for', {
        t('<?php for ('), i(1), t({ ') : ?>', '' }),
        t('\t'), i(0),
        t({ '', '<?php endfor ?>' }),
    }),
    snippet('if', {
        t('<?php if ('), i(1), t({ ') : ?>', '' }),
        t('\t'), i(0),
        t({ '', '<?php endif ?>' }),
    }),
    snippet('else', {
        t('<?php if ('), i(1), t({ ') : ?>', '' }),
        t('\t'), i(2),
        t({ '', '<?php else: ?>', '' }),
        t('\t'), i(0),
        t({ '', '<?php endif ?>' }),
    }),
    snippet('dump', {
        t('<?php var_dump('), i(0), t(') ?>'),
    }),
}
