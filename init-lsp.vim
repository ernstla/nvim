if has('nvim')
    let g:space_before_virtual_text = 1
    let g:diagnostic_virtual_text_prefix = '⚡'
    let g:diagnostic_enable_virtual_text = 1
    " let g:diagnostic_trimmed_virtual_text = '20'
    let g:diagnostic_show_sign = 0
    let g:diagnostic_insert_delay = 1

    sign define LspDiagnosticsSignError text=❌ texthl=LspDiagnosticsSignError linehl= numhl=
    sign define LspDiagnosticsSignWarning text=⚡ texthl=LspDiagnosticsSignWarning linehl= numhl=
    sign define LspDiagnosticsSignInformation text=◎ texthl=LspDiagnosticsSignInformation linehl= numhl=
    sign define LspDiagnosticsSignHint text=○ texthl=LspDiagnosticsSignHint linehl= numhl=

	lua vim.lsp.set_log_level("debug")

lua << EOF
    local nvim_lsp = require'lspconfig'

    -- Nim
    --    nimble install nimls
	nvim_lsp.nimls.setup{
        cmd = { "nimlsp" };
        filetypes = { "nim" };
        root_dir = nvim_lsp.util.root_pattern(".git") or nvim_lsp.util.os_homedir;
	}

    -- Python
    --    pip install --user python-language-server
	nvim_lsp.pyls.setup{}

    -- Vue
    --    npm install -g vls
	nvim_lsp.vuels.setup{}

    -- Typescript
    --    npm install -g typescript typescript-language-server
    nvim_lsp.tsserver.setup{}

    -- Svelte
    --    npm install -g svelte-language-server
    nvim_lsp.svelte.setup{}

    -- PHP
    --    npm install -g intelephense
    nvim_lsp.intelephense.setup({
        init_options = { licenceKey = '005UH9RB1NL07NE'},
        settings = {
            intelephense = {
                stubs = { 
                    "bcmath",
                    "bz2",
                    "calendar",
                    "Core",
                    "curl",
                    "date",
                    "dba",
                    "dom",
                    "enchant",
                    "fileinfo",
                    "filter",
                    "ftp",
                    "gd",
                    "gettext",
                    "hash",
                    "iconv",
                    "imap",
                    "intl",
                    "json",
                    "ldap",
                    "libxml",
                    "memcached",
                    "mbstring",
                    "mcrypt",
                    "mysql",
                    "mysqli",
                    "password",
                    "pcntl",
                    "pcre",
                    "PDO",
                    "pdo_mysql",
                    "Phar",
                    "readline",
                    "recode",
                    "Reflection",
                    "regex",
                    "session",
                    "SimpleXML",
                    "soap",
                    "sockets",
                    "sodium",
                    "SPL",
                    "standard",
                    "superglobals",
                    "sysvsem",
                    "sysvshm",
                    "tokenizer",
                    "xml",
                    "xdebug",
                    "xmlreader",
                    "xmlwriter",
                    "yaml",
                    "zip",
                    "zlib",
                    "wordpress",
                    "woocommerce"
                },
                files = {
                    maxSize = 5000000;
                };
            };
        }; 
    });
EOF
endif
