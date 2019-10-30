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
    call plug#begin('~\AppData\Local\nvim\bundle')
endif


" original repos on github
Plug 'christoomey/vim-tmux-navigator'
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
Plug 'mattn/emmet-vim'
Plug 'majutsushi/tagbar'
Plug 'mbbill/undotree'
Plug 'mhinz/vim-signify'
Plug 'nelstrom/vim-visual-star-search'
Plug 'Sirver/ultisnips'
Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-fugitive'
Plug 'rhysd/git-messenger.vim'
Plug 'troydm/zoomwintab.vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'wellle/targets.vim' " extend and improve text objects


" Languages
Plug 'Glench/Vim-Jinja2-Syntax', {'for': 'html'}
Plug 'cespare/vim-toml'
Plug 'elmcast/elm-vim'
Plug 'leafgarland/typescript-vim', {'for': 'typescript'}
Plug 'lifepillar/pgsql.vim'
Plug 'mxw/vim-jsx'
Plug 'pangloss/vim-javascript'
Plug 'plasticboy/vim-markdown'
Plug 'posva/vim-vue'
Plug 'rust-lang/rust.vim'
Plug 'tpope/vim-haml'
Plug 'zah/nim.vim', {'for': 'nim'}

if !exists("$VSCODE")
    Plug 'w0rp/ale'
endif

if !exists("$VSCODE") && !has("win32")
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'marlonfan/coc-phpls', {'do': 'yarn install --frozen-lockfile'}
    Plug 'neoclide/coc-lists', {'do': 'yarn install --frozen-lockfile'}
    Plug 'neoclide/coc-json', {'do': 'yarn install --frozen-lockfile'}
    Plug 'neoclide/coc-css', {'do': 'yarn install --frozen-lockfile'}
    Plug 'neoclide/coc-emmet', {'do': 'yarn install --frozen-lockfile'}
    Plug 'neoclide/coc-html', {'do': 'yarn install --frozen-lockfile'}
    Plug 'neoclide/coc-python', {'do': 'yarn install --frozen-lockfile'}
    Plug 'neoclide/coc-rls', {'do': 'yarn install --frozen-lockfile'}
    Plug 'neoclide/coc-vetur', {'do': 'yarn install --frozen-lockfile'}
endif

call plug#end()
