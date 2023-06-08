local util = require('lspconfig').util

M = {}

-- Add any additional override configuration in the following tables. They will be passed to
-- the `settings` field of the server config. You must look up that documentation yourself.
M.servers = {
    jsonls = {},
    svelte = {},
    -- volar = {},
    tsserver = {},
    eslint = {},
    stylelint_lsp = {
        filetypes = { 'css', 'less', 'postcss', 'sass', 'scss' },
        settings = {
            stylelintplus = {
                autoFixOnFormat = true,
            }
        }
    },

    pylsp = {
        cmd = { 'pylsp' },
        filetypes = { 'python' },
        root_dir = function(fname)
            local root_files = {
                'pyproject.toml',
                'setup.py',
                'setup.cfg',
                'requirements.txt',
                'Pipfile',
                '.git',
            }
            return util.root_pattern(unpack(root_files))(fname) or util.find_git_ancestor(fname)
        end,
        single_file_support = true,
        settings = {
            pylsp = {
                configurationSources = { 'flake8' },
                plugins = {
                    flake8 = {
                        enabled = true,
                        ignore = { 'E501' },
                        maxLineLength = 89
                    },
                    pycodestyle = {
                        enabled = false,
                    }
                }
            }
        }
    },

    -- phpactor = {
    --     init_options = {
    --         ["language_server_php_cs_fixer.enabled"] = true,
    --         ["language_server_psalm.enabled"] = true,
    --     }
    -- },

    intelephense = {
        init_options = { licenceKey = '005UH9RB1NL07NE' },
        settings = {
            intelephense = {
                stubs = {
                    'bcmath', 'bz2', 'calendar', 'Core', 'curl', 'date', 'dba', 'dom', 'enchant',
                    'fileinfo', 'filter', 'ftp', 'gd', 'gettext', 'hash', 'iconv', 'imap', 'intl',
                    'json', 'ldap', 'libxml', 'memcached', 'mbstring', 'mcrypt', 'mysql', 'mysqli',
                    'openssl', 'password', 'pcntl', 'pcre', 'PDO', 'pdo_mysql', 'Phar', 'readline',
                    'recode', 'Reflection', 'regex', 'session', 'SimpleXML', 'soap', 'sockets', 'sodium',
                    'SPL', 'standard', 'superglobals', 'sysvsem', 'sysvshm', 'tokenizer', 'xml', 'xdebug',
                    'xmlreader', 'xmlwriter', 'yaml', 'zip', 'zlib', 'wordpress', 'woocommerce'
                },
                files = {
                    maxSize = 5000000
                },
                format = {
                    -- This does not work. See intelephense condition in lsp.lua `on_attach`
                    enable = false, -- use phpcsfixer with ls-null
                },
                diagnostics = {
                    enable = true,
                },
            }
        }
    },

    lua_ls = {
        settings = {
            Lua = {
                workspace = { checkThirdParty = false },
                telemetry = { enable = false },
            },
        },
    },

    rust_analyzer = {
        settings = {
            ["rust-analyzer"] = {
                rustfmt = {
                    enableRangeFormatting = true
                }
            }
        }
    },

    nimls = {
        cmd = { 'nimlsp' },
        filetypes = { 'nim' },
        root_dir = util.root_pattern('.git') or util.os_homedir,
    },
}

return M
