if vim.fn.has('wsl') == true then
    vim.g.clipboard = {
        name = "win32yank",
        copy = {
            ["+"] = "win32yank.exe -i",
            ["*"] = "win32yank.exe -i",
        },
        paste = {
            ["+"] = "win32yank.exe -o",
            ["*"] = "win32yank.exe -o",
        },
        cache_enabled = true,
    }

    vim.api.nvim_exec(
        [[
            augroup WSLYank
                autocmd!
                autocmd TextYankPost * :call system('clip.exe ',@")
            augroup end
        ]],
        false
    )
end
