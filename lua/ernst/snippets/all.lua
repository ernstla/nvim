local ls = require("luasnip")

local snippet = ls.snippet
local fn = ls.function_node

local date = function() return { os.date('%Y-%m-%d') } end

return {
    snippet({
        trig = "date",
        namr = "Date",
        dscr = "Date in the form of YYYY-MM-DD",
    }, {
        fn(date, {}),
    }),
}
