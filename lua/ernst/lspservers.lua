local util = require('lspconfig').util

M = {}

-- Add any additional override configuration in the following tables. They will be passed to
-- the `settings` field of the server config. You must look up that documentation yourself.
M.servers = {
    jsonls = {},
    svelte = {},
    eslint = {},
    ols = {},
    ruff_lsp = {},

    ts_ls = {
        settings = {
            javascript = {
                format = {
                    enabled = false
                }
            },
            typescript = {
                format = {
                    enabled = false
                }
            },
        }
    },

    pylsp = {
        settings = {
            pylsp = {
                cmd = { 'pylsp' },
                filetypes = { 'python' },
                plugins = {
                    pycodestyle = { enabled = false },
                    pyflakes = { enabled = false },
                },
            }
        }
    },

    gopls = {
        settings = {
            gopls = {
                completeUnimported = true,
                usePlaceholders = true,
                analyses = {
                    unusedparams = true,
                },
            }
        }
    },

    intelephense = {
        init_options = { licenceKey = '005UH9RB1NL07NE' },
        settings = {
            intelephense = {
                stubs = {
                    'bcmath', 'bz2', 'calendar', 'Core', 'curl', 'date', 'dba', 'dom', 'enchant',
                    'fileinfo', 'filter', 'ftp', 'gd', 'gettext', 'hash', 'iconv', 'imap', 'intl',
                    'json', 'ldap', 'libxml', 'memcached', 'mbstring', 'mcrypt', 'mysql', 'mysqli',
                    'openssl', 'password', 'pcntl', 'pcre', 'PDO', 'pdo_mysql', 'Phar', 'readline',
                    'recode', 'Reflection', 'regex', 'session', 'SimpleXML', 'soap', 'sockets',
                    'sodium',
                    'SPL', 'standard', 'superglobals', 'sysvsem', 'sysvshm', 'tokenizer', 'xml',
                    'xdebug',
                    'xmlreader', 'xmlwriter', 'yaml', 'zip', 'zlib', 'wordpress', 'woocommerce'
                },
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
            }
        }
    },

    lua_ls = {
        settings = {
            Lua = {
                workspace = { checkThirdParty = false },
                telemetry = { enable = false },
                format = {
                    defaultConfig = {
                        indent_style = "space",
                        indent_size = 2
                    }
                }
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

    tailwindcss = {},
}

return M
