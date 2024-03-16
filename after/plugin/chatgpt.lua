local secrets = require('ernst/secrets')

if not secrets then
    return
end

require('gp').setup({
    openai_api_key = secrets.openai_api_key,
})
