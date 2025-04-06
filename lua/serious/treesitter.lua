local c = require('serious/colors')

return {
    ['@keyword'] = { fg = c.blue7 },
    ['@conditional'] = { fg = c.blue4 },
    ['@tag'] = { fg = c.orange7 },
    ['@tag.delimiter'] = { fg = c.orange7 },
    ['@tag.attribute'] = { fg = c.yellow5 },
    ['@variable'] = { fg = c.text },

    ['@cssid'] = { fg = c.blue4 },
    ['@cssclass'] = { fg = c.sea3 },
    ['@property.css'] = { fg = c.rose4 },
    ['@function.css'] = { fg = c.rose3 },
    ['@tag.css'] = { fg = c.orange5 },

    ['@type.svelte'] = { fg = c.blue4 },
    ['@keyword.svelte'] = { fg = c.blue4 },
    ['@punctuation.bracket.svelte'] = { fg = c.blue4 },

    ['@variable.builtin.typescript'] = { fg = c.rose4 },
    ['@variable.builtin.javascript'] = { fg = c.rose4 },

    ['@method.vue'] = { fg = c.sea3 },
    ['@function.method.vue'] = { fg = c.rose4 },
    ['@variable.member.vue'] = { fg = c.green2 },
    ['@operator.vue'] = { fg = c.orange4 },
    ['@variable.vue'] = { fg = c.yellow3 },
    ['@punctuation.special.vue'] = { fg = c.yellow3 },
    ['@attr.directive.vue'] = { fg = c.blue4 },

    ['@property.javascript'] = { fg = c.text },
    ['@variable.javascript'] = { fg = c.text },

    ['@text.literal.markdown_inline'] = { fg = c.organge8 },
    ['@punctuation.delimiter.markdown_inline'] = { fg = c.organge8 },

    ['@propery.lua'] = { fg = c.grey0 },
    ['@punctuation.delimiter.lua'] = { fg = c.text },
    ['@punctuation.bracket.lua'] = { fg = c.sea3 },
}
