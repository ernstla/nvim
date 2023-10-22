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
    snippet('line', {
        t('error_log("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");')
    }),
    snippet('hans', {
        t('error_log("~~~~~~~~~~~ HANS ~~~~~~~~~~~~");')
    }),
    snippet('franz', {
        t('error_log("~~~~~~~~~~~ FRANZ ~~~~~~~~~~~");')
    }),
    snippet('doldi', {
        t('error_log("~~~~~~~~~~~ DOLDI ~~~~~~~~~~~");')
    }),
    snippet('fritz', {
        t('error_log("~~~~~~~~~~~ FRITZ ~~~~~~~~~~~");')
    }),
    snippet('robert', {
        t('error_log("~~~~~~~~~~~ ROBERT ~~~~~~~~~~");')
    }),
    snippet('roland', {
        t('error_log("~~~~~~~~~~~ ROLAND ~~~~~~~~~~");')
    }),
    snippet('linee', {
        t('echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\\n";')
    }),
    snippet('hanse', {
        t('echo "~~~~~~~~~~~ HANS ~~~~~~~~~~~~\\n";')
    }),
    snippet('franze', {
        t('echo "~~~~~~~~~~~ FRANZ ~~~~~~~~~~~\\n";')
    }),
    snippet('doldie', {
        t('echo "~~~~~~~~~~~ DOLDI ~~~~~~~~~~~\\n";')
    }),
    snippet('fritze', {
        t('echo "~~~~~~~~~~~ FRITZ ~~~~~~~~~~~\\n";')
    }),
    snippet('roberte', {
        t('echo "~~~~~~~~~~~ ROBERT ~~~~~~~~~~\\n";')
    }),
    snippet('rolande', {
        t('echo "~~~~~~~~~~~ ROLAND ~~~~~~~~~~\\n";')
    }),
    snippet('/', {
        t({ '/**', ' * ' }), i(1), t({ '', ' */' }),
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
    snippet('only', {
        t('/** @group only */')
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
