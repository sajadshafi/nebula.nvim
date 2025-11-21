-- nebula main setup and apply (updated: integrations + transparent_background + enable_transparency)
local colors_mod = require("nebula.colors")
local hl = require("nebula.highlights")
local lualine_mod = require("nebula.lualine")

local M = {}

local default_opts = {
    transparent_background = false,
    styles = {
        comments = "italic",
        keywords = "bold",
        functions = "NONE",
        cursorline_nr = false,
    },
    dim_inactive = true,
    -- integrations control whether plugin-specific highlights are applied
    integrations = {
        treesitter = true,
        lualine = true,
        telescope = true,
        mason = true,
        lazy = true,
        cmp = false,
        gitsigns = true,
        nvim_tree = true,
    },
}

local opts = {}

local function set_terminal_colors(p)
    if not p then return end
    vim.g.terminal_color_0  = p.bg or "#000000"
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

-- Public helper: set commonly used groups to transparent (none)
function M.enable_transparency()
    -- groups commonly set to none by themes that support transparency
    local groups = {
        "Normal",
        "NormalFloat",
        "LineNr",
        "CursorLine",
        "SignColumn",
        "NvimTreeNormal",
        "TelescopeNormal",
        "TelescopePromptNormal",
        "StatusLine",
        "StatusLineNC",
    }

    for _, g in ipairs(groups) do
        pcall(vim.api.nvim_set_hl, 0, g, { bg = "none" })
    end

    -- Some plugins require specific commands to remove statusline guibg:
    pcall(vim.cmd, "hi StatusLine guibg=NONE")
end

-- returns whether integration is enabled (and true by default if flag not present)
local function integration_enabled(name)
    if opts.integrations == nil then return true end
    if opts.integrations[name] == nil then return true end
    return opts.integrations[name]
end

function M.apply()
    local palette = vim.deepcopy(colors_mod.palette)

    -- choose background application
    if opts.transparent_background then
        palette.bg = nil
    end

    -- set colors_name for compatibility with plugins and :colorscheme
    vim.g.colors_name = "nebula"

    -- apply core highlights always
    hl.apply_core(palette, opts)
    hl.apply_syntax(palette, opts)

    -- conditionally apply treesitter and plugin highlights
    if integration_enabled("treesitter") then
        hl.apply_treesitter(palette, opts)
    end

    if integration_enabled("telescope") or integration_enabled("mason") or integration_enabled("lazy")
        or integration_enabled("gitsigns") or integration_enabled("nvim_tree") then
        hl.apply_plugins(palette, opts) -- that function includes telescope, mason, lazy, gitsigns, nvim-tree, etc.
    end

    -- terminal colors from full palette (do not remove even if transparent)
    set_terminal_colors(colors_mod.palette)

    -- If user asked for transparent background, also clear common groups
    if opts.transparent_background then
        M.enable_transparency()
    end
end

function M.lualine_theme()
    return lualine_mod.make(colors_mod.palette)
end

return M
