
local cmd = vim.cmd
local fn = vim.fn
local g = vim.g
local opt = vim.opt
local home = vim.fn.getenv('HOME')

require('autocmd')
cmd('filetype plugin on')

require('bundles')

opt.autoindent = true
opt.backspace = {'indent', 'eol', 'start'} -- Backspace as expected
opt.backup = false
opt.backupcopy = 'yes'
opt.clipboard = 'unnamedplus'
opt.complete = {'.','w','b','u','t'} -- Insert-mode completion
opt.completeopt = opt.completeopt - 'preview'
opt.cursorcolumn = false
opt.cursorline = true
opt.diffopt = {'vertical', 'filler'}
opt.encoding = 'utf-8'
opt.errorbells = false
opt.expandtab = true
opt.exrc = true
opt.fileformat = 'unix'
opt.fileformats = {'unix', 'dos'}
opt.history = 1000
opt.hlsearch = false -- Don't highlight matched regexp by default
opt.ignorecase = true
opt.incsearch = true -- Search all instances
opt.joinspaces = false
opt.linebreak = true -- Word wrap if wrapping is enabled
opt.matchpairs = {'(:)', '{:}', '[:]', '<:>'}
opt.maxmempattern = 5000
opt.shiftround = true
opt.shiftwidth = 4
opt.smartcase = true -- Don't ignore case if the search term contains uppercase
opt.smartindent = true
opt.smarttab = true
opt.softtabstop = 4
opt.spell = false
opt.spelllang= 'en' -- Spell checking
opt.startofline = false -- Keep the cursor in the current column when moving between lines (if possible)
opt.tabstop = 4
opt.undodir = home .. '/.undo'
opt.undofile = true -- Persistent undo
opt.undoreload = 10000
opt.virtualedit = 'block' -- Allow block mode after end of line
opt.visualbell = true
opt.winaltkeys = 'no'
opt.winfixwidth = false
opt.wrap = false

if g.vscode then
    opt.number = false
    opt.signcolumn = 'no'
else
    opt.equalalways = false
    opt.foldcolumn = '0'
    opt.foldlevelstart = 99 -- Do not automatically fold
    opt.formatoptions = 'qrn1'
    opt.formatoptions = opt.formatoptions + 'j' -- Delete comment character when joining commented lines
    opt.hidden = true -- Avoid asking to save before hiding
    opt.lazyredraw = true
    opt.listchars = {nbsp = '·', tab = '› ', eol = '¬', trail = '·', extends = '…', precedes = '…'}
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
    opt.sessionoptions = {'blank', 'buffers', 'curdir', 'folds', 'help', 'options', 'tabpages', 'globals'}
    opt.showbreak = '╰'
    opt.showcmd = true -- Show number of selected chars/lines
    opt.showmatch = true
    opt.showtabline = 1 -- Always show tabline
    opt.sidescroll = 1
    opt.sidescrolloff = 5
    opt.splitbelow = false
    opt.splitright = true -- Open new splits to the right
    opt.swapfile = false
    opt.tags = {'./.tags','./tags'}
    opt.textwidth = 0
    opt.timeout = true
    opt.timeoutlen = 500
    opt.title = true
    opt.titlestring = '%f%( [%M]%)' -- Show file name at the title
    opt.ttimeout = true
    opt.ttimeoutlen = 50
    opt.ttyfast = true
    opt.undolevels = 2000
    opt.wildignore = {'*.o', '*.obj', '*.pyc', '*.swc', '*.DS_STORE', '*.bkp'}
    opt.wildmenu = true
    opt.wildmode = 'full'
    opt.winminheight = 0
    opt.wrapmargin = 0
    opt.writebackup = false
end

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'
-- Use ripgrep as grep program
opt.shortmess = 'aoOtI'
if fn.executable("rg") then
    opt.grepprg = 'rg --smart-case --vimgrep --no-heading'
    opt.grepformat = '%f:%l:%c:%m,%f:%l:%m'
else
    if fn.executable('ag') then
        opt.grepprg = 'ag --nogroup --nocolor --vimgrep'
        opt.grepformat = '%f:%l:%c:%m' -- file:line:column:message
    end
end


--Set colorscheme (order is important here)
opt.termguicolors = true
vim.cmd [[colorscheme serious]]


-- require('treesitter')
require('lsp')
require('plugins')
require('mappings')

if vim.fn.has('win32') == 1 then
    require('neovide')
    vim.cmd('source ' .. home .. '/AppData/Local/nvim/statusline.vim')
else
    vim.cmd('source ' .. home .. '/.config/nvim/statusline.vim')
end
