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
                name = "anthropic",
                endpoint = "https://api.anthropic.com/v1/messages",
                model_endpoint = "https://api.anthropic.com/v1/models",
                api_key = secrets.anthropic_key,
                params = {
                    chat = { max_tokens = 4096 },
                    command = { max_tokens = 4096 },
                },
                topic = {
                    model = "claude-3-5-haiku-latest",
                    params = { max_tokens = 32 },
                },
                headers = function(self)
                    return {
                        ["Content-Type"] = "application/json",
                        ["x-api-key"] = self.api_key,
                        ["anthropic-version"] = "2023-06-01",
                    }
                end,
                models = {
                    "claude-sonnet-4-20250514",
                    "claude-3-7-sonnet-20250219",
                    "claude-3-5-sonnet-20241022",
                    "claude-3-5-haiku-20241022",
                },
                preprocess_payload = function(payload)
                    for _, message in ipairs(payload.messages) do
                        message.content = message.content:gsub("^%s*(.-)%s*$", "%1")
                    end
                    if payload.messages[1] and payload.messages[1].role == "system" then
                        -- remove the first message that serves as the system prompt as anthropic
                        -- expects the system prompt to be part of the API call body and not the messages
                        payload.system = payload.messages[1].content
                        table.remove(payload.messages, 1)
                    end
                    return payload
                end,
            },
            openai = {
                name = "openai",
                endpoint = "https://api.openai.com/v1/chat/completions",
                -- endpoint to query the available models online
                model_endpoint = "https://api.openai.com/v1/models",
                api_key = secrets.openai_key,
                -- OPTIONAL: Alternative methods to retrieve API key
                -- Using GPG for decryption:
                -- api_key = { "gpg", "--decrypt", vim.fn.expand("$HOME") .. "/my_api_key.txt.gpg" },
                -- Using macOS Keychain:
                -- api_key = { "/usr/bin/security", "find-generic-password", "-s my-api-key", "-w" },
                --- default model parameters used for chat and interactive commands
                params = {
                    chat = { temperature = 1.1, top_p = 1 },
                    command = { temperature = 1.1, top_p = 1 },
                },
                -- topic model parameters to summarize chats
                topic = {
                    model = "gpt-4.1-nano",
                    params = { max_completion_tokens = 64 },
                },
                --  a selection of models that parrot can remember across sessions
                --  NOTE: This will be handled more intelligently in a future version
                models = {
                    "gpt-4.1",
                    "o4-mini",
                    "gpt-4.1-mini",
                    "gpt-4.1-nano",
                },
            },
            deepseek = {
                name = 'deepseek',
                api_key = secrets.deepseek_key,
                -- model_endpoint = "https://api.deepseek.com/models",
                endpoint = "https://api.deepseek.com/v1/chat/completions",
                models = {
                    "deepseek-chat",
                    "deepseek-reasoner",
                },
                topic = {
                    model = "deepseek-chat",
                    params = { max_completion_tokens = 64 },
                },
                params = {
                    chat = { temperature = 1.1, top_p = 1 },
                    command = { temperature = 1.1, top_p = 1 },
                },
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
