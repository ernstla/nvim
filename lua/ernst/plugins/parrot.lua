if not pcall(require, "ernst/secrets") then
    return
end

local secrets = require("ernst/secrets")

return { {
    "frankroeder/parrot.nvim",
    dependencies = { "ibhagwan/fzf-lua", "nvim-lua/plenary.nvim" },
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

        cmd_prefix = "Parrot",
        state_dir = secrets.ai_path .. "/persisted",
        chat_dir = secrets.ai_path .. "/chats",
        toggle_target = "split",
        style_popup_border = "rounded",
        chat_confirm_delete = false,

        -- The interactive user input appearing when can be "native" for
        -- vim.ui.input or "buffer" to query the input within a native nvim buffer
        -- (see video demonstrations below)
        user_input_ui = "buffer",
    },
    config = function(spec)
        require("parrot").setup(spec.opts)
        require("which-key").add(
            {
                {
                    { "<leader>at", "<cmd>ParrotChatNew tabnew<cr>", desc = "AI: New Chat tabnew",       nowait = true, remap = false },
                    { "<leader>av", "<cmd>ParrotChatNew vsplit<cr>", desc = "AI: New Chat vsplit",       nowait = true, remap = false },
                    { "<leader>as", "<cmd>ParrotChatNew split<cr>",  desc = "AI: New Chat split",        nowait = true, remap = false },
                    { "<leader>af", "<cmd>ParrotChatFinder<cr>",     desc = "AI: Chat Finder",           nowait = true, remap = false },
                    { "<leader>ap", "<cmd>ParrotProvider<cr>",       desc = "AI: Change Provider",       nowait = true, remap = false },
                    { "<leader>am", "<cmd>ParrotModel<cr>",          desc = "AI: Change Model",          nowait = true, remap = false },
                    { "<leader>ak", "<cmd>ParrotStop<cr>",           desc = "AI: ParrotChatStop",        nowait = true, remap = false },
                    { "<leader>ag", "<cmd>ParrotChatToggle<cr>",     desc = "AI: Toggle Chat",           nowait = true, remap = false },
                    { "<leader>ax", "<cmd>ParrotContext<cr>",        desc = "AI: Toggle ParrotContext",  nowait = true, remap = false },
                    { "<leader>ad", "<cmd>ParrotChatDelete<cr>",     desc = "AI: Delete chat",           nowait = true, remap = false },
                    { "<leader>a?", "<cmd>ParrotStatus<cr>",         desc = "AI: Show provider & model", nowait = true, remap = false },
                    { "<leader>aa", "<cmd>ParrotAppend<cr>",         desc = "AI: Append (after)",        nowait = true, remap = false },
                },
                {
                    mode = { "v" },
                    { "<leader>at", ":<C-u>'<,'>ParrotChatNew tabnew<cr>", desc = "AI: Visual Chat New tabnew", nowait = true, remap = false },
                    { "<leader>av", ":<C-u>'<,'>ParrotChatNew vsplit<cr>", desc = "AI: Visual Chat New vsplit", nowait = true, remap = false },
                    { "<leader>as", ":<C-u>'<,'>ParrotChatNew split<cr>",  desc = "AI: Visual Chat New split",  nowait = true, remap = false },
                    { "<leader>aa", ":<C-u>'<,'>ParrotAppend<cr>",         desc = "AI: Visual Append (after)",  nowait = true, remap = false },
                    { "<leader>ai", ":<C-u>'<,'>ParrotImplement<cr>",      desc = "AI: Implement selection",    nowait = true, remap = false },
                    { "<leader>ar", ":<C-u>'<,'>ParrotRewrite<cr>",        desc = "AI: Visual Rewrite",         nowait = true, remap = false },
                    { "<leader>ap", ":<C-u>'<,'>ParrotChatPaste<cr>",      desc = "AI: Visual Chat Paste",      nowait = true, remap = false },
                }
            }
        )
    end
} }
