if not pcall(require, 'ernst/secrets') then
    return
end

local secrets = require('ernst/secrets')

M = {}

-- Add any additional override configuration in the following tables. They will be passed to
-- the `settings` field of the server config. You must look up that documentation yourself.
M.servers = function(util)
    local servers = {
        svelte = {},
        eslint = {},
        ols = {},
        ruff = {},
        volar = {},
        nim_langserver = {},

        jsonls = {
            settings = {
                jsonls = {
                    format = {
                        enabled = false
                    }
                },
                json = {
                    format = {
                        enabled = false
                    }
                }
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
            init_options = {
                licenceKey = secrets.intelephense_key,
            },
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
                    },
                    diagnostics = {
                        disable = {
                            "missing-fields", -- don't complain about missing fields in tables
                        }
                    },
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


        tailwindcss = {},
    }

    return servers
end

return M
