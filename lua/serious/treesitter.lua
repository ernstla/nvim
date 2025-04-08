local c = require('serious/colors')

-- Set lsp semantic tokens to a lower priority than treesitter's
vim.highlight.priorities.semantic_tokens = 95 -- Or any number lower than 100, treesitter's priority level

return {
    ['@conditional'] = { fg = c.blue4 },
    ['@keyword'] = { fg = c.blue7 },
    ['@tag'] = { fg = c.orange7 },
    ['@tag.attribute'] = { fg = c.yellow5 },
    ['@tag.delimiter'] = { fg = c.orange7 },
    ['@string.regexp'] = { fg = c.red1 },
    ['@variable'] = { fg = c.text },

    ['@property.lua'] = { fg = c.sea2 },
    ['@punctuation.bracket.lua'] = { fg = c.sea3 },
    ['@punctuation.delimiter.lua'] = { fg = c.text },
    ['@variable.lua'] = { fg = c.sea2 },

    ['@cssclass'] = { fg = c.sea3 },
    ['@cssid'] = { fg = c.blue4 },
    ['@function.css'] = { fg = c.rose3 },
    ['@property.css'] = { fg = c.rose4 },
    ['@punctuation.delimiter.css'] = { fg = c.text },
    ['@string.css'] = { fg = c.orange3 },
    ['@tag.css'] = { fg = c.orange5 },

    ['@property.scss'] = { fg = c.rose4 },
    ['@punctuation.delimiter.scss'] = { fg = c.text },

    ['@property.javascript'] = { fg = c.text },
    ['@punctuation.bracket.javascript'] = { fg = c.text },
    ['@punctuation.delimiter.javascript'] = { fg = c.text },
    ['@punctuation.special.javascript'] = { fg = c.salmon7 },
    ['@variable.builtin.javascript'] = { fg = c.rose4 },
    ['@variable.javascript'] = { fg = c.text },

    ['@punctuation.bracket.typescript'] = { fg = c.text },
    ['@punctuation.delimiter.typescript'] = { fg = c.text },
    ['@punctuation.special.typescript'] = { fg = c.salmon7 },
    ['@variable.builtin.typescript'] = { fg = c.rose4 },

    ['@keyword.svelte'] = { fg = c.blue4 },
    ['@punctuation.bracket.svelte'] = { fg = c.blue4 },
    ['@type.svelte'] = { fg = c.blue4 },

    ['@punctuation.delimiter.markdown_inline'] = { fg = c.orange8 },
    ['@text.literal.markdown_inline'] = { fg = c.orange8 },

    ['@attr.directive.vue'] = { fg = c.blue4 },
    ['@function.method.vue'] = { fg = c.rose4 },
    ['@method.vue'] = { fg = c.sea3 },
    ['@operator.vue'] = { fg = c.orange4 },
    ['@punctuation.special.vue'] = { fg = c.yellow3 },
    ['@variable.member.vue'] = { fg = c.green2 },
    ['@variable.vue'] = { fg = c.yellow3 },
}
