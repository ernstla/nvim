# Neovim config

No worries, this will never be a Neovim distribution

## Zeuch

Measure startup time

    nvim --startuptime startup.log

Show all highlight groups colored (does not show up immediately)

    :so $VIMRUNTIME/syntax/hitest.vim

Debug lua e. g. 

    :lua print(vim.inspect(variable))
