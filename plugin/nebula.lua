-- nebula main setup and apply
local colors_mod = require("nebula.colors")
local hl = require("nebula.highlights")
local lualine_mod = require("nebula.lualine")

local M = {}

local default_opts = {
    transparent = false,
    styles = {
        comments = "italic",
        keywords = "bold",
        functions = "NONE",
        cursorline_nr = false,
    },
    dim_inactive = true,
}

local opts = {}

local function set_terminal_colors(p)
    vim.g.terminal_color_0  = p.bg
    vim.g.terminal_color_1  = p.red
    vim.g.terminal_color_2  = p.green
    vim.g.terminal_color_3  = p.yellow
    vim.g.terminal_color_4  = p.cyan
    vim.g.terminal_color_5  = p.accent
    vim.g.terminal_color_6  = p.cyan
    vim.g.terminal_color_7  = p.fg
    vim.g.terminal_color_8  = "#6B6990"
    vim.g.terminal_color_9  = p.red
    vim.g.terminal_color_10 = p.green
    vim.g.terminal_color_11 = p.yellow
    vim.g.terminal_color_12 = p.cyan
    vim.g.terminal_color_13 = p.accent
    vim.g.terminal_color_14 = p.cyan
    vim.g.terminal_color_15 = p.white_soft
end

function M.setup(user_opts)
    opts = vim.tbl_deep_extend("force", default_opts, user_opts or {})
    return M
end

function M.apply()
    local palette = vim.deepcopy(colors_mod.palette)

    -- transparency option: do not set Normal background
    if opts.transparent then
        palette.bg = nil
    end

    -- set colors_name so :hi and other scripts can query it
    -- If user invoked :colorscheme nebula or nebula, the colors/ shim will set g:colors_name; set it here as well to be safe.
    vim.g.colors_name = vim.g.colors_name or "nebula"

    -- Apply highlights
    hl.apply_core(palette, opts)
    hl.apply_syntax(palette, opts)
    hl.apply_treesitter(palette, opts)
    hl.apply_plugins(palette, opts)

    -- terminal colors should always be set from the original full palette
    set_terminal_colors(colors_mod.palette)
end

function M.lualine_theme()
    return lualine_mod.make(colors_mod.palette)
end

return M
