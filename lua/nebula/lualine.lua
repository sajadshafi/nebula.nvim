-- lualine theme table for nebula-lilac
local M = {}

local function make(colors)
    local bg = colors.bg
    local fg = colors.fg
    local accent = colors.accent
    local dim = colors.dim
    local muted = colors.muted

    return {
        normal = {
            a = { fg = bg, bg = accent, gui = "bold" },
            b = { fg = fg, bg = muted },
            c = { fg = fg, bg = bg },
        },
        insert = {
            a = { fg = bg, bg = colors.cyan, gui = "bold" },
            b = { fg = fg, bg = muted },
            c = { fg = fg, bg = bg },
        },
        visual = {
            a = { fg = bg, bg = colors.pink, gui = "bold" },
            b = { fg = fg, bg = muted },
            c = { fg = fg, bg = bg },
        },
        replace = {
            a = { fg = bg, bg = colors.red, gui = "bold" },
            b = { fg = fg, bg = muted },
            c = { fg = fg, bg = bg },
        },
        inactive = {
            a = { fg = colors.muted, bg = bg, gui = "bold" },
            b = { fg = colors.muted, bg = bg },
            c = { fg = colors.muted, bg = bg },
        },
    }
end

M.make = make
return M
