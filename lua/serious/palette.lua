local rosepine = {
    _nc = "#1f1d30",
    base = "#232136",
    surface = "#2a273f",
    overlay = "#393552",
    muted = "#6e6a86",
    subtle = "#908caa",
    text = "#e0def4",
    love = "#eb6f92",
    gold = "#f6c177",
    rose = "#ea9a97",
    pine = "#3e8fb0",
    foam = "#9ccfd8",
    iris = "#c4a7e7",
    leaf = "#95b1ac",
    highlight_low = "#2a283e",
    highlight_med = "#44415a",
    highlight_high = "#56526e",
    none = "NONE",
}

function hexToRgb(color)
    color = string.lower(color)
    return { tonumber(color:sub(2, 3), 16), tonumber(color:sub(4, 5), 16), tonumber(color:sub(6, 7), 16) }
end

function blend(foreground, background, alpha)
    alpha = type(alpha) == 'string' and (tonumber(alpha, 16) / 0xff) or alpha

    local bg = hexToRgb(background)
    local fg = hexToRgb(foreground)

    local blendChannel = function(i)
        local ret = (alpha * fg[i] + ((1 - alpha) * bg[i]))
        return math.floor(math.min(math.max(0, ret), 255) + 0.5)
    end

    return string.format('#%02x%02x%02x', blendChannel(1), blendChannel(2), blendChannel(3))
end

local palette = {
    none = 'NONE',
    bg = '#000000',
    fg = '#eceff4',
    night = {
        c0 = '#2e3440',
        c1 = '#3b4252',
        c2 = '#434c5e',
        c3 = '#4c566a',
    },
    snow = {
        c0 = '#d8dee9',
        c1 = '#e5e9f0',
        c2 = '#eceff4',
    },
    frost = {
        blue       = '#5e81ac',
        light_blue = '#81a1c1',
        sea        = '#8fbcbb',
        turquoise  = '#88c0d0',
    },
    aurora = {
        green  = '#a3be8c',
        orange = '#d08770',
        purple = '#B48EAD',
        red    = '#bf616a',
        yellow = '#ebcb8b',
    },
    blend = {
        red       = blend('#bf616a', '#2E3440', 0.1),
        yellow    = blend('#ebcb8b', '#2E3440', 0.1),
        green     = blend('#a3be8c', '#2E3440', 0.1),
        turquoise = blend('#88c0d0', '#2E3440', 0.1),
        blue      = blend('#5e81ac', '#2E3440', 0.2),
        bluec1    = blend('#5e81ac', '#2E3440', 0.3),
        comment   = blend('#616E88', '#2E3440', 0.9),
    },
    special = {
        sea = '#8EBDBC',
        light_blue = '#7AA1BE',
    },
}

return palette
