# Neovim configuration

## Measure startup time

    nvim --startuptime startup.log

## Zeuch

Debug lua e. g. with the get_diagnostics function from statusline.vim

    :lua print(vim.inspect(get_diagnostics(0)))
