if has('nvim') && !has('win32')
    let g:space_before_virtual_text = 1
    let g:diagnostic_virtual_text_prefix = '⚡'
    let g:diagnostic_enable_virtual_text = 1
    " let g:diagnostic_trimmed_virtual_text = '20'
    let g:diagnostic_show_sign = 0
    let g:diagnostic_insert_delay = 1

	lua vim.lsp.set_log_level("debug")
lua << EOF
    local nvim_lsp = require'nvim_lsp'

	nvim_lsp.nimls.setup{
        cmd = { "nimlsp" };
        filetypes = { "nim" };
        root_dir = nvim_lsp.util.root_pattern(".git") or nvim_lsp.util.os_homedir;
	}

	nvim_lsp.pyls.setup{
        on_attach=require'diagnostic'.on_attach
    }

	nvim_lsp.vuels.setup{
        on_attach=require'diagnostic'.on_attach
    }
EOF
endif
