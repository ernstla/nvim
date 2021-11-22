--
-- Telescope
--
local actions = require('telescope.actions')
require('telescope').setup {
    defaults = {
        mappings = {
            i = {
                ['<c-j>'] = actions.move_selection_next,
                ['<c-k>'] = actions.move_selection_previous,
                ['<c-s>'] = actions.select_horizontal,
                ['<esc>'] = actions.close
            },
        },
        sorting_strategy = 'ascending',
        layout_strategy = 'horizontal',
        layout_config = {
            vertical = { width = 0.5, height = 0.8, mirror = true, prompt_position = 'bottom' },
            horizontal = { width = 0.6, height = 0.6, mirror = false, prompt_position = 'top' }
        },
    },
}


--
-- nvim-cmp
--
-- https://github.com/hrsh7th/nvim-cmp/wiki/Example-mappings#ultisnips--cmp-cmdline
--
local t = function(str)
	return vim.api.nvim_replace_termcodes(str, true, true, true)
end
local cmp = require 'cmp'
cmp.setup {
    snippet = {
        expand = function(args)
            vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
        end,
    },
    mapping = {
        ['<C-p>'] = cmp.mapping.select_prev_item(),
        ['<C-n>'] = cmp.mapping.select_next_item(),
        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.close(),
        ['<CR>'] = cmp.mapping.confirm {
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
        },
        ['<Tab>'] = function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif vim.fn["UltiSnips#CanJumpForwards"]() == 1 then
                vim.fn.feedkeys(t("<esc>:call UltiSnips#JumpForwards()<CR>"))
            else
                fallback()
            end
        end,
        ['<S-Tab>'] = function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif vim.fn["UltiSnips#CanJumpBackwards"]() == 1 then
                vim.fn.feedkeys(t("<C-R>=UltiSnips#JumpBackwards()<CR>"))
            else
                fallback()
            end
        end,
    },
    sources = {
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
    },
}


--
-- indent_blankline
--
vim.g.indent_blankline_char = '┊'
vim.g.indent_blankline_filetype_exclude = { 'help', 'packer' }
vim.g.indent_blankline_buftype_exclude = { 'terminal', 'nofile' }
vim.g.indent_blankline_char_highlight = 'LineNr'
vim.g.indent_blankline_show_trailing_blankline_indent = false
vim.g.indent_blankline_show_first_indent_level = false


-- BufExplorer
vim.g.bufExploreryhowUnlisted = 0
vim.g.bufExplorerShowRelativePath = 1


-- Colorizer
vim.g.colorizer_nomap = 1
vim.g.colorizer_startup = 0


-- NERDTree
vim.g.NERDTreeIgnore = {'.pyc$', '~$', '.swp$', '.gif$', '.png$', '.jpg$', '.trc', 'PYSMELLTAGS', '__pycache__', '.*.egg-info$', '^.[[dir]]'}  -- the last one means all hidden dirs
vim.g.NERDTreeMouseMode = 2
vim.g.NERDTreeQuitOnOpen = 1
vim.g.NERDTreeChDirMode = 2
vim.g.NERDTreeShowBookmarks = 0
vim.g.NERDTreeHijackNetrw = 0
vim.g.NERDTreeShowHidden = 1
vim.g.NERDTreeWinSize = 23
vim.g.NERDTreeMinimalUI = 1
vim.g.NERDTreeDirArrows = 1

--
-- NERDCommenter
-- Add spaces after comment delimiters by default
vim.g.NERDSpaceDelims = 1
-- Use compact syntax for prettified multi-line comments
vim.g.NERDCompactSexyComs = 1
-- Align line-wise comment delimiters flush left instead of following code indentation
vim.g.NERDDefaultAlign = 'left'
-- Set a language to use its alternate delimiters by default
vim.g.NERDAltDelims_java = 1
-- Add your own custom formats or override the defaults
vim.g.NERDCustomDelimiters = { c = { left = '/**',right = '*/' } }
-- Allow commenting and inverting empty lines (useful when commenting a region)
vim.g.NERDCommentEmptyLines = 1
-- Enable trimming of trailing whitespace when uncommenting
vim.g.NERDTrimTrailingWhitespace = 1
-- Enable NERDCommenterToggle to check all selected lines is commented or not
vim.g.NERDToggleCheckAllLines = 1
vim.g.nerd_ft = ''

-- Session
vim.g.session_autosave = 'yes'
vim.g.session_autoload = 'no'

-- Tagbar
vim.g.tagbar_width = 35
vim.g.tagbar_singleclick = 1
vim.g.tagbar_usearrows = 1
vim.g.tagbar_autoshowtag = 1
vim.g.tagbar_iconchars = {'▸', '▾'}

-- UltiSnips
vim.g.UltiSnipsSnippetDirectories = {'UltiSnips', 'ultisnips'}
vim.g.UltiSnipsExpandTrigger = '<Tab>'
vim.g.UltiSnipsJumpForwardTrigger = '<Tab>'
vim.g.UltiSnipsJumpBackwardTrigger = '<S-Tab>'
vim.g.UltiSnipsListSnippets = '<c-tab>'
vim.g.UltiSnipsEditSplit = 'horizontal'
vim.g.UltiSnipsDontReverseSearchPath = '1'

-- Signify
vim.g.signify_priority = 0
vim.g.signify_disable_by_default = 0
vim.g.signify_sign_show_count = 0
vim.g.signify_vcs_list = {'git', 'hg'}
vim.g.signify_sign_add = '┃'
vim.g.signify_sign_delete = '⌥'
vim.g.signify_sign_delete_first_line = '‾'
vim.g.signify_sign_change = '∙'
vim.g.signify_sign_changedelete = vim.g.signify_sign_change

-- Emmet
vim.g.user_emmet_leader_key = '<c-e>'
