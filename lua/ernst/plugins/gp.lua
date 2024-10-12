if not pcall(require, 'ernst/secrets') then
    return
end

local secrets = require('ernst/secrets')

return { {
    'robitx/gp.nvim',
    dependencies = { 'folke/which-key.nvim' },
    opts = {
        cmd_prefix = "Gp",
        providers = {
            openai = {
                disable = false,
                -- endpoint = "https://api.openai.com/v1/chat/completions",
                secret = secrets.openai_api_key,
            },
            anthropic = {
                disable = false,
                -- endpoint = "https://api.anthropic.com/v1/messages",
                secret = secrets.anthropic_key,
            },
        },
        whisper = {
            disable = true,
        }
    },
    config = function(spec)
        require('gp').setup(spec.opts)

        -- VISUAL mode mappings
        -- s, x, v modes are handled the same way by which_key
        require("which-key").add(
            {
                {
                    { "<leader>gc", "<cmd>GpChatNew<cr>",        desc = "New Chat",         nowait = true, remap = false },
                    { "<leader>gt", "<cmd>GpChatNew tabnew<cr>", desc = "New Chat tabnew",  nowait = true, remap = false },
                    { "<leader>gv", "<cmd>GpChatNew vsplit<cr>", desc = "New Chat vsplit",  nowait = true, remap = false },
                    { "<leader>gh", "<cmd>GpChatNew split<cr>",  desc = "New Chat split",   nowait = true, remap = false },
                    { "<leader>ga", "<cmd>GpAppend<cr>",         desc = "Append (after)",   nowait = true, remap = false },
                    { "<leader>gr", "<cmd>GpRewrite<cr>",        desc = "Inline Rewrite",   nowait = true, remap = false },
                    { "<leader>gf", "<cmd>GpChatFinder<cr>",     desc = "Chat Finder",      nowait = true, remap = false },
                    { "<leader>gn", "<cmd>GpNextAgent<cr>",      desc = "Next Agent",       nowait = true, remap = false },
                    { "<leader>gk", "<cmd>GpStop<cr>",           desc = "GpStop",           nowait = true, remap = false },
                    { "<leader>gg", "<cmd>GpChatToggle<cr>",     desc = "Toggle Chat",      nowait = true, remap = false },
                    { "<leader>gx", "<cmd>GpContext<cr>",        desc = "Toggle GpContext", nowait = true, remap = false },
                    { "<leader>gd", "<cmd>GpChatDelete<cr>",     desc = "Delete chat",      nowait = true, remap = false },
                },
                {
                    mode = { "v" },
                    { "<leader>gc", ":<C-u>'<,'>GpChatNew<cr>",        desc = "Visual Chat New",        nowait = true, remap = false },
                    { "<leader>gt", ":<C-u>'<,'>GpChatNew tabnew<cr>", desc = "Visual Chat New tabnew", nowait = true, remap = false },
                    { "<leader>gv", ":<C-u>'<,'>GpChatNew vsplit<cr>", desc = "Visual Chat New vsplit", nowait = true, remap = false },
                    { "<leader>gh", ":<C-u>'<,'>GpChatNew split<cr>",  desc = "Visual Chat New split",  nowait = true, remap = false },
                    { "<leader>ga", ":<C-u>'<,'>GpAppend<cr>",         desc = "Visual Append (after)",  nowait = true, remap = false },
                    { "<leader>gi", ":<C-u>'<,'>GpImplement<cr>",      desc = "Implement selection",    nowait = true, remap = false },
                    { "<leader>gn", "<cmd>GpNextAgent<cr>",            desc = "Next Agent",             nowait = true, remap = false },
                    { "<leader>gp", ":<C-u>'<,'>GpChatPaste<cr>",      desc = "Visual Chat Paste",      nowait = true, remap = false },
                    { "<leader>gr", ":<C-u>'<,'>GpRewrite<cr>",        desc = "Visual Rewrite",         nowait = true, remap = false },
                    { "<leader>gk", "<cmd>GpStop<cr>",                 desc = "GpStop",                 nowait = true, remap = false },
                    { "<leader>gg", ":<C-u>'<,'>GpChatToggle<cr>",     desc = "Visual Toggle Chat",     nowait = true, remap = false },
                    { "<leader>gx", ":<C-u>'<,'>GpContext<cr>",        desc = "Visual GpContext",       nowait = true, remap = false },
                }
            }
        )
    end
} }
