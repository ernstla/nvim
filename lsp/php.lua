if not pcall(require, 'ernst/secrets') then
    return
end

local secrets = require('ernst/secrets')

return {
    cmd = { 'intelephense', '--stdio' },
    filetypes = { 'php' },
    root_markers = { 'composer.json', '.git' },
    -- Is set also in ~/intelephense/licence.txt
    -- From 1.17 on ~/.config/intelephense/global/licence.txt
    init_options = {
        licenceKey = secrets.intelephense_key,
    },
    settings = {
        intelephense = {
            files = {
                maxSize = 5000000
            },
            format = {
                -- This does not work. See intelephense condition in lsp.lua `on_attach`
                enable = false, -- use phpcsfixer directly
            },
            diagnostics = {
                enable = true,
            },
            stubs = {
                'bcmath', 'bz2', 'calendar', 'Core', 'curl', 'date', 'dba', 'dom', 'enchant',
                'fileinfo', 'filter', 'ftp', 'gd', 'gettext', 'hash', 'iconv', 'imap', 'intl',
                'json', 'ldap', 'libxml', 'memcached', 'mbstring', 'mcrypt', 'mysql', 'mysqli',
                'openssl', 'password', 'pcntl', 'pcre', 'PDO', 'pdo_mysql', 'Phar', 'random', 'readline',
                'recode', 'Reflection', 'regex', 'session', 'SimpleXML', 'soap', 'sockets',
                'sodium', 'SPL', 'standard', 'superglobals', 'sysvsem', 'sysvshm', 'tokenizer',
                'uuid', 'xml', 'xdebug', 'xmlreader', 'xmlwriter', 'yaml', 'zip', 'zlib',
                'wordpress', 'woocommerce'
            },
        }
    }
}
