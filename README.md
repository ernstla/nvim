
## Install Lanugage Servers

### Lua
    
    mkdir -p ./config/nvim/lsp/lua
    cd .config/nvim/lsp/lua
    wget https://github.com/sumneko/lua-language-server/releases/download/<version>/lua-language-server-<version>-linux-x64.tar.gz
    tar xfvz lua-language-server-<version>-linux-x64.tar.gz

Windows:

Download the LSP from https://github.com/sumneko/lua-language-server/releases
and extract it to `<User>\AppData\Local\nvim\lsp\lua`


### Zeuch

Debug lua e. g. with the get_diagnostics function from statusline.vim

    :lua print(vim.inspect(get_diagnostics(0)))
