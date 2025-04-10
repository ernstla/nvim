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
                style = "openai",
                api_key = secrets.deepseek_key,
                url = "https://api.deepseek.com/v1/chat/completions",
                parameters = {
                    max_tokens = 2048,
                    temperature = 0.7,
                }
            }
        },
        system_prompt = {
            command =
                "Respond with only the raw code solution (no markdown, no backticks, no explanations) " ..
                "unless I say otherwise. If unsure, say 'I don't know how to do this'.",
        },
        prompts = {
            ["Translate"] =
                "Translate the provided text into English while preserving the original format " ..
                "(e.g., PO/Gettext, HTML, JSON) and maintaining all structural elements like placeholders, " ..
                "tags, or markup—only modify human-readable content.",
            ["Comment"] = "Provide a comment that explains what the snippet is doing."
        },
        cmd_prefix = "Parrot",
        state_dir = secrets.ai_path .. "/persisted",
        chat_dir = secrets.ai_path .. "/chats",
        toggle_target = "split",
        style_popup_border = "rounded",
        chat_confirm_delete = false,
        user_input_ui = "native", -- "buffer" (opens a buffer) or "native" (command line)
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
                    { "<leader>ai", "<cmd>ParrotStatus<cr>",         desc = "AI: Show provider & model", nowait = true, remap = false },
                    { "<leader>aa", "<cmd>ParrotAppend<cr>",         desc = "AI: Append (after)",        nowait = true, remap = false },
                    { "<leader>ad", "<cmd>ParrotPrepend<cr>",        desc = "AI: Prepend (davor)",       nowait = true, remap = false },
                },
                {
                    mode = { "v" },
                    { "<leader>at", ":<C-u>'<,'>ParrotChatNew tabnew<cr>",    desc = "AI: Chat new tab (paste sel)",    nowait = true, remap = false },
                    { "<leader>av", ":<C-u>'<,'>ParrotChatNew vsplit<cr>",    desc = "AI: Chat new vsplit (paste sel)", nowait = true, remap = false },
                    { "<leader>as", ":<C-u>'<,'>ParrotChatNew split<cr>",     desc = "AI: Chat new split (paste sel)",  nowait = true, remap = false },
                    { "<leader>aa", ":<C-u>'<,'>ParrotAppend<cr>",            desc = "AI: Append and use sel (after)",  nowait = true, remap = false },
                    { "<leader>ad", ":<C-u>'<,'>ParrotPrepend<cr>",           desc = "AI: Prepend and use sel (davor)", nowait = true, remap = false },
                    { "<leader>ai", ":<C-u>'<,'>ParrotImplement<cr>",         desc = "AI: Implement selection",         nowait = true, remap = false },
                    { "<leader>ar", ":<C-u>'<,'>ParrotRewrite<cr>",           desc = "AI: Rewrite selection",           nowait = true, remap = false },
                    { "<leader>ap", ":<C-u>'<,'>ParrotChatPaste<cr>",         desc = "AI: Paste to chat",               nowait = true, remap = false },
                    { "<leader>ae", ":<C-u>'<,'>ParrotRewrite Translate<cr>", desc = "AI: Translate to english",        nowait = true, remap = false },
                }
            }
        )
    end
} }
