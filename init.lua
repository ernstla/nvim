-- Install packer
local install_path = vim.fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
local is_bootstrap = false
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    is_bootstrap = true
    vim.fn.system { 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path }
    vim.cmd [[packadd packer.nvim]]
end

-- Settings required before packer is loaded
vim.g.user_emmet_leader_key = '<c-e>'

require("ernst/packer").setup(is_bootstrap)

-- When we are bootstrapping a configuration, it doesn't
-- make sense to execute the rest of the init.lua.
if is_bootstrap then
    -- remove 'after' from runtimepath as the plugin setups would crash
    vim.cmd('set rtp-=' .. vim.fn.stdpath('config') .. '/after')

    print '=================================='
    print '    Plugins are being installed'
    print '    Wait until Packer completes,'
    print '       then restart nvim'
    print '=================================='
    return
end

local g = vim.g
local opt = vim.opt
local wo = vim.wo
local home = vim.fn.getenv('HOME')

-- let nvim-tree hijack directory windows (e. g. `nvim .`)
g.loaded_netrw = 1
g.loaded_netrwPlugin = 1

require("ernst")

opt.autoindent = true
opt.backspace = { 'indent', 'eol', 'start' } -- Backspace as expected
opt.backup = false
opt.backupcopy = 'yes'
opt.clipboard = 'unnamedplus'
opt.complete = { '.', 'w', 'b', 'u', 't' } -- Insert-mode completion
opt.completeopt = 'menuone,noselect'
opt.completeopt = opt.completeopt - 'preview'
opt.cursorcolumn = false
opt.cursorline = true
opt.diffopt = { 'vertical', 'filler' }
opt.encoding = 'utf-8'
opt.equalalways = true
opt.errorbells = false
opt.expandtab = true
opt.exrc = true
opt.fileformat = 'unix'
opt.fileformats = { 'unix', 'dos' }
opt.foldcolumn = '0'
opt.foldlevelstart = 99 -- Do not automatically fold
opt.formatoptions = 'qrn1'
opt.formatoptions = opt.formatoptions + 'j' -- Delete comment character when joining commented lines
opt.grepformat = '%f:%l:%c:%m,%f:%l:%m'
opt.grepprg = 'rg --smart-case --vimgrep --no-heading' -- use ripgrep
opt.hidden = true -- Avoid asking to save before hiding
opt.history = 1000
opt.hlsearch = false -- Don't highlight matched regexp by default
opt.ignorecase = true
opt.incsearch = true -- Search all instances
opt.joinspaces = false
opt.lazyredraw = true
opt.linebreak = true -- Word wrap if wrapping is enabled
opt.listchars = { nbsp = '·', tab = '› ', eol = '¬', trail = '·', extends = '…', precedes = '…' }
opt.matchpairs = { '(:)', '{:}', '[:]', '<:>' }
opt.maxmempattern = 5000
opt.modeline = true -- Respect modeline of the file (the famous "vi:noai:sw = 3 ts=6" on the beginning of the files)
opt.mouse = 'a' -- allow mouse in console
opt.number = true
opt.numberwidth = 1
opt.path = opt.path + '**' -- Search through sub-directories when looking up a file
opt.previewheight = 25
opt.ruler = true
opt.scroll = 5
opt.scrolljump = 1
opt.scrolloff = 0
opt.sessionoptions = { 'blank', 'buffers', 'curdir', 'folds', 'help', 'options', 'tabpages', 'globals' }
opt.shiftround = true
opt.shiftwidth = 4
opt.shortmess = 'aoOtI'
opt.showbreak = '╰'
opt.showcmd = true -- Show number of selected chars/lines
opt.showmatch = true
opt.showtabline = 1 -- Always show tabline
opt.sidescroll = 1
opt.sidescrolloff = 5
opt.smartcase = true -- Don't ignore case if the search term contains uppercase
opt.smartindent = true
opt.smarttab = true
opt.softtabstop = 4
opt.spell = false
opt.spelllang = 'en' -- Spell checking
opt.splitbelow = false
opt.splitright = true -- Open new splits to the right
opt.startofline = false -- Keep the cursor in the current column when moving between lines (if possible)
opt.swapfile = false
opt.tabstop = 4
opt.tags = { './.tags', './tags' }
opt.termguicolors = true
opt.textwidth = 0
opt.timeout = true
opt.timeoutlen = 500
opt.title = true
opt.titlestring = '%f%( [%M]%)' -- Show file name at the title
opt.ttimeout = true
opt.ttimeoutlen = 50
opt.ttyfast = true
opt.undodir = home .. '/.undo'
opt.undofile = true -- Persistent undo
opt.undolevels = 2000
opt.undoreload = 10000
opt.virtualedit = 'block' -- Allow block mode after end of line
opt.visualbell = true
opt.wildignore = { '*.o', '*.obj', '*.pyc', '*.swc', '*.DS_STORE', '*.bkp' }
opt.wildmenu = true
opt.wildmode = 'full'
opt.winaltkeys = 'no'
opt.winfixwidth = false
opt.winminheight = 0
opt.wrap = false
opt.wrapmargin = 0
opt.writebackup = false

wo.signcolumn = 'yes'
