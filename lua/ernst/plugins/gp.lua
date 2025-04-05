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
                    { "<leader>ac", "<cmd>GpChatNew<cr>",        desc = "AI: New Chat",         nowait = true, remap = false },
                    { "<leader>at", "<cmd>GpChatNew tabnew<cr>", desc = "AI: New Chat tabnew",  nowait = true, remap = false },
                    { "<leader>av", "<cmd>GpChatNew vsplit<cr>", desc = "AI: New Chat vsplit",  nowait = true, remap = false },
                    { "<leader>ai", "<cmd>GpChatNew vsplit<cr>", desc = "AI: New Chat vsplit",  nowait = true, remap = false },
                    { "<leader>as", "<cmd>GpChatNew split<cr>",  desc = "AI: New Chat split",   nowait = true, remap = false },
                    { "<leader>aa", "<cmd>GpAppend<cr>",         desc = "AI: Append (after)",   nowait = true, remap = false },
                    { "<leader>ar", "<cmd>GpRewrite<cr>",        desc = "AI: Inline Rewrite",   nowait = true, remap = false },
                    { "<leader>af", "<cmd>GpChatFinder<cr>",     desc = "AI: Chat Finder",      nowait = true, remap = false },
                    { "<leader>an", "<cmd>GpNextAgent<cr>",      desc = "AI: Next Agent",       nowait = true, remap = false },
                    { "<leader>ak", "<cmd>GpStop<cr>",           desc = "AI: GpStop",           nowait = true, remap = false },
                    { "<leader>ag", "<cmd>GpChatToggle<cr>",     desc = "AI: Toggle Chat",      nowait = true, remap = false },
                    { "<leader>ax", "<cmd>GpContext<cr>",        desc = "AI: Toggle GpContext", nowait = true, remap = false },
                    { "<leader>ad", "<cmd>GpChatDelete<cr>",     desc = "AI: Delete chat",      nowait = true, remap = false },
                },
                {
                    mode = { "v" },
                    { "<leader>ac", ":<C-u>'<,'>GpChatNew<cr>",        desc = "AI: Visual Chat New",        nowait = true, remap = false },
                    { "<leader>at", ":<C-u>'<,'>GpChatNew tabnew<cr>", desc = "AI: Visual Chat New tabnew", nowait = true, remap = false },
                    { "<leader>av", ":<C-u>'<,'>GpChatNew vsplit<cr>", desc = "AI: Visual Chat New vsplit", nowait = true, remap = false },
                    { "<leader>as", ":<C-u>'<,'>GpChatNew split<cr>",  desc = "AI: Visual Chat New split",  nowait = true, remap = false },
                    { "<leader>aa", ":<C-u>'<,'>GpAppend<cr>",         desc = "AI: Visual Append (after)",  nowait = true, remap = false },
                    { "<leader>ai", ":<C-u>'<,'>GpImplement<cr>",      desc = "AI: Implement selection",    nowait = true, remap = false },
                    { "<leader>an", "<cmd>GpNextAgent<cr>",            desc = "AI: Next Agent",             nowait = true, remap = false },
                    { "<leader>ap", ":<C-u>'<,'>GpChatPaste<cr>",      desc = "AI: Visual Chat Paste",      nowait = true, remap = false },
                    { "<leader>ar", ":<C-u>'<,'>GpRewrite<cr>",        desc = "AI: Visual Rewrite",         nowait = true, remap = false },
                    { "<leader>ak", "<cmd>GpStop<cr>",                 desc = "AI: GpStop",                 nowait = true, remap = false },
                    { "<leader>ag", ":<C-u>'<,'>GpChatToggle<cr>",     desc = "AI: Visual Toggle Chat",     nowait = true, remap = false },
                    { "<leader>ax", ":<C-u>'<,'>GpContext<cr>",        desc = "AI: Visual GpContext",       nowait = true, remap = false },
                }
            }
        )
    end
} }
