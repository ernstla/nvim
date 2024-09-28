local g = vim.g
local o = vim.o
local opt = vim.opt
local wo = vim.wo
local home = vim.fn.getenv('HOME')

-- Global plugin settings
g.user_emmet_leader_key = '<c-e>'
g.loaded_netrw = 1              -- let nvim-tree hijack directory windows (e. g. `nvim .`)
g.loaded_netrwPlugin = 1
g.VM_case_setting = 'sensitive' -- case sensitive multi cursors (vim-visual-multi)

o.autoindent = true
o.backup = false
o.backupcopy = 'yes'
o.clipboard = 'unnamedplus'
o.completeopt = 'menuone,noselect'
o.cursorcolumn = false
o.cursorline = true
o.encoding = 'utf-8'
o.equalalways = true
o.errorbells = false
o.expandtab = true
o.exrc = true
o.foldcolumn = '0'
o.foldlevelstart = 99 -- Do not automatically fold
o.formatoptions = 'qrn1'
o.grepformat = '%f:%l:%c:%m,%f:%l:%m'
o.grepprg = 'rg --smart-case --vimgrep --no-heading' -- use ripgrep
o.hidden = true                                      -- Avoid asking to save before hiding
o.history = 1000
o.hlsearch = false                                   -- Don't highlight matched regexp by default
o.ignorecase = true
o.incsearch = true                                   -- Search all instances
o.joinspaces = false
o.lazyredraw = true
o.linebreak = true -- Word wrap if wrapping is enabled
o.maxmempattern = 5000
o.modeline = true  -- Respect modeline of the file (the famous "vi:noai:sw = 3 ts=6" on the beginning of the files)
o.mouse = 'a'      -- allow mouse in console
o.number = true
o.numberwidth = 1
o.omnifunc = 'syntaxcomplete#Complete'
o.previewheight = 25
o.ruler = true
o.scroll = 5
o.scrolljump = 1
o.scrolloff = 0
o.shiftround = true
o.shiftwidth = 4
-- o.shortmess = 'filnxtToOF'
o.shortmess = 'aoOtI'
o.showbreak = '╰'
o.showcmd = true  -- Show number of selected chars/lines
o.showmatch = true
o.showtabline = 1 -- Always show tabline
o.sidescroll = 1
o.sidescrolloff = 5
o.smartcase = true -- Don't ignore case if the search term contains uppercase
o.smartindent = true
o.smarttab = true
o.softtabstop = 4
o.spell = false
o.spelllang = 'en'    -- Spell checking
o.splitbelow = false
o.splitright = true   -- Open new splits to the right
o.startofline = false -- Keep the cursor in the current column when moving between lines (if possible)
o.swapfile = false
o.tabstop = 4
o.termguicolors = true
o.textwidth = 0
o.timeout = true
o.timeoutlen = 500
o.title = true
o.titlestring = '%f%( [%M]%)' -- Show file name at the title
o.ttimeout = true
o.ttimeoutlen = 50
o.ttyfast = true
o.undodir = home .. '/.undo'
o.undofile = true -- Persistent undo
o.undolevels = 2000
o.undoreload = 10000
o.virtualedit = 'block' -- Allow block mode after end of line
o.visualbell = true
o.wildmenu = true
o.wildmode = 'full'
o.winaltkeys = 'no'
o.winfixwidth = false
o.winminheight = 0
o.wrap = false
o.wrapmargin = 0
o.writebackup = false

opt.backspace = { 'indent', 'eol', 'start' } -- Backspace as expected
opt.complete = { '.', 'w', 'b', 'u', 't' }   -- Insert-mode completion
opt.completeopt:remove({ 'preview' })
opt.diffopt = { 'vertical', 'filler' }
opt.fileformats = { 'unix', 'dos' }
opt.formatoptions:append({ 'j' }) -- Delete comment character when joining commented lines
opt.listchars = { nbsp = '·', tab = '› ', eol = '¬', trail = '·', extends = '…', precedes = '…' }
opt.matchpairs = { '(:)', '{:}', '[:]', '<:>' }
opt.path:append({ '**' }) -- Search through sub-directories when looking up a file
opt.sessionoptions = { 'blank', 'buffers', 'curdir', 'folds', 'help', 'options', 'tabpages', 'globals' }
opt.tags = { './.tags', './tags' }
opt.wildignore = { '*.o', '*.obj', '*.pyc', '*.swc', '*.DS_STORE', '*.bkp' }

wo.signcolumn = 'yes'

-- vim.cmd('source ' .. home .. '/.config/nvim/statusline.vim')
