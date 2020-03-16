if has('nvim')
	lua vim.lsp.set_log_level("debug")
lua << EOF
    local nvim_lsp = require'nvim_lsp'

	nvim_lsp.nimls.setup{
        cmd = { "nimlsp" };
        filetypes = { "nim" };
        root_dir = nvim_lsp.util.root_pattern(".git") or nvim_lsp.util.os_homedir;
	}

	nvim_lsp.pyls.setup{}

	nvim_lsp.vuels.setup{}
EOF
endif
