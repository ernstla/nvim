# Neovim configuration

## Install Language Servers

### Python

    pip install --user python-lsp-server

### Javascript/Svelte

    npm install -g typescript typescript-language-server \
        vscode-langservers-extracted svelte-language-server

### Nim

    nimble install nimlsp

### Lua

Linux:

    mkdir -p ./config/nvim/lsp/lua
    cd .config/nvim/lsp/lua
    wget https://github.com/sumneko/lua-language-server/releases/download/<version>/lua-language-server-<version>-linux-x64.tar.gz
    tar xfvz lua-language-server-<version>-linux-x64.tar.gz

Windows:

Download the LSP from https://github.com/sumneko/lua-language-server/releases
and extract it to `<User>\AppData\Local\nvim\lsp\lua`

OSX:

    brew install lua-language-server


## Zeuch

Debug lua e. g. with the get_diagnostics function from statusline.vim

    :lua print(vim.inspect(get_diagnostics(0)))
