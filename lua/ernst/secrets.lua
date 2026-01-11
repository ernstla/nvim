local M = {}

local openai_key = os.getenv("NEOVIM_OPENAI_API_KEY")
if openai_key then
    M.openai_key = openai_key
end

local anthropic_key = os.getenv("NEOVIM_ANTHROPIC_API_KEY")
if anthropic_key then
    M.anthropic_key = anthropic_key
end

local deepseek_key = os.getenv("NEOVIM_DEEPSEEK_API_KEY")
if deepseek_key then
    M.deepseek_key = deepseek_key
end

local ai_path_env = os.getenv("NEOVIM_AI_PATH")
if ai_path_env then
    M.ai_path = vim.loop.fs_realpath(vim.fn.expand(ai_path_env))
end

return M
