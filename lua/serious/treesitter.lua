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
    ['@punctuation.bracket'] = { fg = c.text },
    ['@punctuation.delimiter'] = { fg = c.text },

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

    ['@property.javascript'] = { fg = c.text },
    ['@punctuation.special.javascript'] = { fg = c.salmon7 },
    ['@variable.builtin.javascript'] = { fg = c.rose4 },
    ['@variable.javascript'] = { fg = c.text },
    ['@constant.builtin.javascript'] = { fg = c.rose5 },

    ['@punctuation.special.typescript'] = { fg = c.salmon7 },
    ['@variable.builtin.typescript'] = { fg = c.rose4 },
    ['@constant.builtin.typescript'] = { fg = c.rose5 },
    ['@type.typescript'] = { fg = c.purple3 },

    ['@keyword.svelte'] = { fg = c.blue4 },
    ['@punctuation.bracket.svelte'] = { fg = c.blue4 },
    ['@type.svelte'] = { fg = c.blue4 },

    ['@punctuation.delimiter.markdown_inline'] = { fg = c.orange8 },
    ['@text.literal.markdown_inline'] = { fg = c.orange8 },

    ['@attr.directive.vue'] = { fg = c.blue4 },
    ['@function.method.vue'] = { fg = c.rose4 },
    ['@method.vue'] = { fg = c.sea3 },
    ['@operator.vue'] = { fg = c.orange4 },
    ['@punctuation.special.vue'] = { fg = c.yellow2 },
    ['@variable.member.vue'] = { fg = c.green2 },
    ['@variable.vue'] = { fg = c.yellow2 },

    ['@markup.heading.1.markdown'] = { fg = c.red1 },
    ['@markup.heading.2.markdown'] = { fg = c.green2 },
    ['@markup.heading.3.markdown'] = { fg = c.sea5 },
    ['@markup.heading.4.markdown'] = { fg = c.salmon5 },
    ['@markup.heading.5.markdown'] = { fg = c.purple2 },
    ['@markup.list.markdown'] = { fg = c.green2 },
    ['@markup.raw.block.markdown'] = { fg = c.purple1 },
    ['@markup.raw.markdown_inline'] = { fg = c.purple1 },
    ['@label.markdown'] = { fg = c.sea3 },
}
