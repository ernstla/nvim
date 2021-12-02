
## Install Lanugage Servers

### Lua

Debug lua e. g. with the get_diagnostics function from statusline.vim

    :lua print(vim.inspect(get_diagnostics(0)))

See https://github.com/sumneko/lua-language-server/wiki/Build-and-Run

    sudo apt install build-essential ninja-build
    cd ~/Source
    git clone https://github.com/sumneko/lua-language-server
    cd lua-language-server
    git submodule update --init --recursive
    cd 3rd/luamake
    ./compile/install.sh
    cd ../..
    ./3rd/luamake/luamake rebuild
