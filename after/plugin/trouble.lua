require("trouble").setup {
    mode = "document_diagnostics"
}

vim.keymap.set("n", "<leader>f", "<cmd>TroubleToggle<cr>",
    { silent = true, noremap = true }
)
