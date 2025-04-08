if not pcall(require, 'ernst/secrets') then
    return
end

local secrets = require('ernst/secrets')

return { {
    "frankroeder/parrot.nvim",
    dependencies = { 'ibhagwan/fzf-lua', 'nvim-lua/plenary.nvim' },
    opts = {
        providers = {
            anthropic = {
                api_key = secrets.anthropic_key,
            },
            openai = {
                api_key = secrets.openai_key,
            },
            deepseek = {
                name = "deepseek",
                style = "openai",
                models = { "deepseek-chat" },
                api_key = secrets.deepseek_key,
                url = "https://api.deepseek.com/v1/chat/completions",
                parameters = {
                    max_tokens = 2048,
                    temperature = 0.7,
                }
            }
        },
        cmd_prefix = 'Prt',
        -- The directory to store persisted state information like the -- current provider and the selected models
        -- state_dir = secrets.ai_path .. "/persisted",
        -- The directory to store the chats (searched with PrtChatFinder)
        -- chat_dir = secrets.ai_path .. "/chats",
    },
    config = function(spec)
        require('parrot').setup(spec.opts)

        -- VISUAL mode mappings
        -- s, x, v modes are handled the same way by which_key
        require("which-key").add(
            {
                {
                    { "<leader>ac", "<cmd>PrtChatNew<cr>",        desc = "AI: New Chat",          nowait = true, remap = false },
                    { "<leader>at", "<cmd>PrtChatNew tabnew<cr>", desc = "AI: New Chat tabnew",   nowait = true, remap = false },
                    { "<leader>av", "<cmd>PrtChatNew vsplit<cr>", desc = "AI: New Chat vsplit",   nowait = true, remap = false },
                    { "<leader>ai", "<cmd>PrtChatNew vsplit<cr>", desc = "AI: New Chat vsplit",   nowait = true, remap = false },
                    { "<leader>as", "<cmd>PrtChatNew split<cr>",  desc = "AI: New Chat split",    nowait = true, remap = false },
                    { "<leader>aa", "<cmd>PrtAppend<cr>",         desc = "AI: Append (after)",    nowait = true, remap = false },
                    { "<leader>ar", "<cmd>PrtRewrite<cr>",        desc = "AI: Inline Rewrite",    nowait = true, remap = false },
                    { "<leader>af", "<cmd>PrtChatFinder<cr>",     desc = "AI: Chat Finder",       nowait = true, remap = false },
                    { "<leader>an", "<cmd>PrtNextAgent<cr>",      desc = "AI: Next Agent",        nowait = true, remap = false },
                    { "<leader>ak", "<cmd>PrtStop<cr>",           desc = "AI: PrtChatStop",       nowait = true, remap = false },
                    { "<leader>ag", "<cmd>PrtChatToggle<cr>",     desc = "AI: Toggle Chat",       nowait = true, remap = false },
                    { "<leader>ax", "<cmd>PrtContext<cr>",        desc = "AI: Toggle PrtContext", nowait = true, remap = false },
                    { "<leader>ad", "<cmd>PrtChatDelete<cr>",     desc = "AI: Delete chat",       nowait = true, remap = false },
                },
                {
                    mode = { "v" },
                    { "<leader>ac", ":<C-u>'<,'>PrtChatNew<cr>",        desc = "AI: Visual Chat New",        nowait = true, remap = false },
                    { "<leader>at", ":<C-u>'<,'>PrtChatNew tabnew<cr>", desc = "AI: Visual Chat New tabnew", nowait = true, remap = false },
                    { "<leader>av", ":<C-u>'<,'>PrtChatNew vsplit<cr>", desc = "AI: Visual Chat New vsplit", nowait = true, remap = false },
                    { "<leader>as", ":<C-u>'<,'>PrtChatNew split<cr>",  desc = "AI: Visual Chat New split",  nowait = true, remap = false },
                    { "<leader>aa", ":<C-u>'<,'>PrtAppend<cr>",         desc = "AI: Visual Append (after)",  nowait = true, remap = false },
                    { "<leader>ai", ":<C-u>'<,'>PrtImplement<cr>",      desc = "AI: Implement selection",    nowait = true, remap = false },
                    { "<leader>an", "<cmd>PrtNextAgent<cr>",            desc = "AI: Next Agent",             nowait = true, remap = false },
                    { "<leader>ap", ":<C-u>'<,'>PrtChatPaste<cr>",      desc = "AI: Visual Chat Paste",      nowait = true, remap = false },
                    { "<leader>ar", ":<C-u>'<,'>PrtRewrite<cr>",        desc = "AI: Visual Rewrite",         nowait = true, remap = false },
                    { "<leader>ak", "<cmd>PrtStop<cr>",                 desc = "AI: PrtChatStop",            nowait = true, remap = false },
                    { "<leader>ag", ":<C-u>'<,'>PrtChatToggle<cr>",     desc = "AI: Visual Toggle Chat",     nowait = true, remap = false },
                    { "<leader>ax", ":<C-u>'<,'>PrtContext<cr>",        desc = "AI: Visual PrtContext",      nowait = true, remap = false },
                }
            }
        )
    end
} }
