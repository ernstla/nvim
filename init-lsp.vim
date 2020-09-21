if has('nvim')
    let g:space_before_virtual_text = 1
    let g:diagnostic_virtual_text_prefix = '⚡'
    let g:diagnostic_enable_virtual_text = 1
    " let g:diagnostic_trimmed_virtual_text = '20'
    let g:diagnostic_show_sign = 0
    let g:diagnostic_insert_delay = 1

	lua vim.lsp.set_log_level("debug")
lua << EOF
    local nvim_lsp = require'nvim_lsp'

    -- Nim
	nvim_lsp.nimls.setup{
        cmd = { "nimlsp" };
        filetypes = { "nim" };
        root_dir = nvim_lsp.util.root_pattern(".git") or nvim_lsp.util.os_homedir;
	}

    -- Python
	nvim_lsp.pyls.setup{
        on_attach=require'diagnostic'.on_attach
    }

    -- Vue
	nvim_lsp.vuels.setup{
        on_attach=require'diagnostic'.on_attach
    }

    -- PHP
    -- nvim_lsp.intelephense.setup({
    --     init_options = { licenceKey = '005UH9RB1NL07NE'},
    --     settings = {
    --         intelephense = {
    --             stubs = { 
    --                 "bcmath",
    --                 "bz2",
    --                 "calendar",
    --                 "Core",
    --                 "curl",
    --                 "date",
    --                 "dba",
    --                 "dom",
    --                 "enchant",
    --                 "fileinfo",
    --                 "filter",
    --                 "ftp",
    --                 "gd",
    --                 "gettext",
    --                 "hash",
    --                 "iconv",
    --                 "imap",
    --                 "intl",
    --                 "json",
    --                 "ldap",
    --                 "libxml",
    --                 "memcached",
    --                 "mbstring",
    --                 "mcrypt",
    --                 "mysql",
    --                 "mysqli",
    --                 "password",
    --                 "pcntl",
    --                 "pcre",
    --                 "PDO",
    --                 "pdo_mysql",
    --                 "Phar",
    --                 "readline",
    --                 "recode",
    --                 "Reflection",
    --                 "regex",
    --                 "session",
    --                 "SimpleXML",
    --                 "soap",
    --                 "sockets",
    --                 "sodium",
    --                 "SPL",
    --                 "standard",
    --                 "superglobals",
    --                 "sysvsem",
    --                 "sysvshm",
    --                 "tokenizer",
    --                 "xml",
    --                 "xdebug",
    --                 "xmlreader",
    --                 "xmlwriter",
    --                 "yaml",
    --                 "zip",
    --                 "zlib",
    --                 "wordpress",
    --                 "woocommerce"
    --             },
    --             files = {
    --                 maxSize = 5000000;
    --             };
    --         };
    --     }; 
    -- });
EOF
endif
