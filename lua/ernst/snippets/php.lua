local ls = require("luasnip")

local snippet = ls.snippet
local t = ls.text_node
local i = ls.insert_node

local snippets = {
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
    snippet('class', {
        t('class '), i(1), t({ '', '{', '\t' }), i(0), t({ '', '}' }),
    }),
    snippet('abstract', {
        t('abstract class '), i(1), t({ '', '{', '\t' }), i(0), t({ '', '}' }),
    }),
    snippet('interface', {
        t('interface '), i(1), t({ '', '{', '\t' }), i(0), t({ '', '}' }),
    }),
    snippet('trait', {
        t('trait '), i(1), t({ '', '{', '\t' }), i(0), t({ '', '}' }),
    }),
    snippet('construct', {
        t('public function __construct('), i(1), t({ ') {', '\t' }),
        i(0), t({ '', '}' }),
    }),
    snippet('public', {
        t('public function '), i(1), t('('), i(2), t('): '), i(3),
        t({ '', '{', '\t' }), i(0), t({ '', '}' }),
    }),
    snippet('protected', {
        t('protected function '), i(1), t('('), i(2), t('): '), i(3),
        t({ '', '{', '\t' }), i(0), t({ '', '}' }),
    }),
    snippet('private', {
        t('private function '), i(1), t('('), i(2), t('): '), i(3),
        t({ '', '{', '\t' }), i(0), t({ '', '}' }),
    }),
    snippet('static', {
        t('public static function '), i(1), t('('), i(2), t('): '), i(3),
        t({ '', '{', '\t' }), i(0), t({ '', '}' }),
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
        t('echo '),
        i(0),
        t(' . PHP_EOL;'),
    }),
    snippet('echo', {
        t('echo '),
        i(0),
        t(' . PHP_EOL;'),
    }),
    snippet('es', {
        t('echo "'),
        i(0),
        t('" . PHP_EOL;'),
    }),
    snippet('echos', {
        t('echo "'),
        i(0),
        t('" . PHP_EOL;'),
    }),
    snippet('ps', {
        t("echo '"),
        i(0),
        t("'" .. ' . PHP_EOL;'),
    }),
    snippet('prints', {
        t("echo '"),
        i(0),
        t("'" .. ' . PHP_EOL;'),
    }),
    snippet('pr', {
        t('echo print_r('),
        i(0),
        t(', true) . PHP_EOL;'),
    }),
    snippet('printr', {
        t('echo print_r('),
        i(0),
        t(', true) . PHP_EOL;'),
    }),
    snippet('dump', {
        t('<?php var_dump('),
        i(0),
        t('); ?>'),
    }),
    snippet('line', {
        t('error_log("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");')
    }),
    snippet('ln', {
        t('error_log("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");')
    }),
    snippet(':foreach', {
        t('<?php foreach ('), i(1), t(' as '), i(2), t({ ') : ?>', '' }),
        t('\t'), i(0),
        t({ '', '<?php endforeach ?>' }),
    }),
    snippet('?foreach', {
        t('<?php foreach ('), i(1), t(' as '), i(2), t({ ') : ?>', '' }),
        t('\t'), i(0),
        t({ '', '<?php endforeach ?>' }),
    }),
    snippet('foreach', {
        t('foreach ('), i(1), t(' as '), i(2), t({ ') {', '' }),
        t('\t'), i(0),
        t({ '', '}' }),
    }),
    snippet(':for', {
        t('<?php for ('), i(1), t({ ') : ?>', '' }),
        t('\t'), i(0),
        t({ '', '<?php endfor ?>' }),
    }),
    snippet('?for', {
        t('<?php for ('), i(1), t({ ') : ?>', '' }),
        t('\t'), i(0),
        t({ '', '<?php endfor ?>' }),
    }),
    snippet('for', {
        t('for ('), i(1), t({ ') {', '' }),
        t('\t'), i(0),
        t({ '', '}' }),
    }),
    snippet(':if', {
        t('<?php if ('), i(1), t({ ') : ?>', '' }),
        t('\t'), i(0),
        t({ '', '<?php endif ?>' }),
    }),
    snippet('?if', {
        t('<?php if ('), i(1), t({ ') : ?>', '' }),
        t('\t'), i(0),
        t({ '', '<?php endif ?>' }),
    }),
    snippet('if', {
        t('if ('), i(1), t({ ') {', '' }),
        t('\t'), i(0),
        t({ '', '}' }),
    }),
    snippet(':else', {
        t('<?php if ('), i(1), t({ ') : ?>', '' }),
        t('\t'), i(2),
        t({ '', '<?php else: ?>', '' }),
        t('\t'), i(0),
        t({ '', '<?php endif ?>' }),
    }),
    snippet('?else', {
        t('<?php if ('), i(1), t({ ') : ?>', '' }),
        t('\t'), i(2),
        t({ '', '<?php else: ?>', '' }),
        t('\t'), i(0),
        t({ '', '<?php endif ?>' }),
    }),
    snippet('else', {
        t('if ('), i(1), t({ ') {', '' }),
        t('\t'), i(2),
        t({ '', '} else {', '' }),
        t('\t'), i(0),
        t({ '', '}' }),
    }),
    snippet('uo', {
        t("use PHPUnit\\Framework\\Attributes\\Group as G;")
    }),
    snippet('only', {
        t("#[G('only')]")
    }),
    snippet('equal', {
        t("$this->assertEquals("),
        i(0),
        t(")"),
    }),
    snippet('equals', {
        t("$this->assertEquals('"),
        i(0),
        t("')"),
    }),
    snippet('same', {
        t("$this->assertSame("),
        i(0),
        t(")"),
    }),
    snippet('sames', {
        t("$this->assertSame('"),
        i(0),
        t("')"),
    }),
    snippet('instance', {
        t("$this->assertInstanceOf("),
        i(0),
        t(")"),
    }),
}

local words = require('ernst/snippets/words')
local word_snippet = function(word)
    return snippet(word, {
        t('error_log("~~~~~~~~~~~ ' .. string.upper(word) .. ' ~~~~~~~~~~~~");')
    })
end

for _, word in ipairs(words) do
    table.insert(snippets, word_snippet(word))
end

return snippets
