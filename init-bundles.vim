"
" Bundles
"

" bootstrap vim-plug
if has('unix')
    if empty(glob("~/.config/nvim/autoload/plug.vim"))
        silent call mkdir(expand("~/.config/nvim/autoload", 1), 'p')
        execute '!curl -fLo ~/.config/nvim/autoload/plug.vim https://raw.github.com/junegunn/vim-plug/master/plug.vim'
    endif

    call plug#begin('~/.config/nvim/bundle')
else
    "if empty(glob("~\AppData\Local\nvim\autoload\plug.vim"))
    "    silent call mkdir(expand("~\AppData\Local\nvim\autoload", 1), 'p')
    "    execute '!curl -fLo ~\AppData\Local\nvim\autoload\plug.vim https://raw.github.com/junegunn/vim-plug/master/plug.vim'
    "endif

    call plug#begin('~\AppData\Local\nvim\bundle')
endif


Plug 'Sirver/ultisnips'
Plug 'guns/xterm-color-table.vim', {'on': 'XtermColorTable'}
Plug 'jeetsukumaran/vim-filebeagle'
Plug 'jlanzarotta/bufexplorer'
Plug 'jmcantrell/vim-virtualenv'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/gv.vim'
Plug 'kana/vim-textobj-indent'
Plug 'kana/vim-textobj-line'
Plug 'kana/vim-textobj-user'
Plug 'lilydjwg/colorizer', {'on': 'ColorToggle'}
Plug 'luochen1990/rainbow'
Plug 'majutsushi/tagbar'
Plug 'mattn/emmet-vim'
Plug 'mbbill/undotree'
Plug 'mhinz/vim-signify'
Plug 'nelstrom/vim-visual-star-search'
Plug 'rhysd/git-messenger.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'troydm/zoomwintab.vim'
Plug 'wellle/targets.vim' " extend and improve text objects


" Languages
Plug 'cespare/vim-toml', {'for': 'toml'}
Plug 'lifepillar/pgsql.vim', {'for': 'sql'}
Plug 'mxw/vim-jsx', {'for': 'javascript'}
Plug 'pangloss/vim-javascript', {'for': 'javascript'}
Plug 'plasticboy/vim-markdown', {'for': 'markdown'}
Plug 'posva/vim-vue', {'for': 'vue'}
Plug 'rust-lang/rust.vim', {'for': 'rust'}
Plug 'tpope/vim-haml', {'for': 'scss'}
Plug 'evanleck/vim-svelte', {'for': 'svelte'}
Plug 'zah/nim.vim'
" Plug 'https://git.serious.selfip.org/ernst/nim.vim.git', {'for': 'nim'}

" Neovim only
if has("nvim")
    Plug 'neovim/nvim-lsp'
    Plug 'haorenW1025/diagnostic-nvim'
endif

if !exists("$VSCODE") && !exists('g:vscode')
    Plug 'w0rp/ale'
endif

if has("unix")
    Plug 'christoomey/vim-tmux-navigator'
endif

call plug#end()
