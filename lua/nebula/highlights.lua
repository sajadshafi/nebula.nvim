-- Highlight generation split out for clarity and testing.
local M = {}

local function set_hl(group, opts)
    vim.api.nvim_set_hl(0, group, opts)
end

function M.apply_core(palette, opts)
    -- core UI
    set_hl("Normal", { fg = palette.fg, bg = palette.bg })
    set_hl("CursorLine", { bg = palette.bg_soft })
    set_hl("ColorColumn", { bg = palette.bg_soft })
    set_hl("LineNr", { fg = "#7B7F9A", bg = palette.bg })
    set_hl("CursorLineNr", { fg = palette.accent, bg = palette.bg, bold = opts.styles and opts.styles.cursorline_nr })
    set_hl("Visual", { bg = "#3B3355" })
    set_hl("Search", { bg = palette.yellow, fg = palette.bg })
    set_hl("IncSearch", { bg = palette.orange, fg = palette.bg, bold = true })
    set_hl("Pmenu", { bg = palette.bg_soft, fg = palette.fg })
    set_hl("PmenuSel", { bg = palette.accent, fg = palette.bg })
    set_hl("FloatBorder", { fg = palette.border, bg = palette.bg })
    set_hl("NormalFloat", { bg = palette.bg, fg = palette.fg })
    set_hl("VertSplit", { fg = palette.border })
    set_hl("StatusLine", { bg = palette.bg_dark, fg = palette.fg })
    set_hl("StatusLineNC", { bg = palette.bg, fg = "#8F8F9E" })
    set_hl("TabLine", { bg = palette.bg_dark, fg = "#8F8F9E" })
    set_hl("TabLineSel", { bg = palette.accent, fg = palette.bg })
end

function M.apply_syntax(palette, opts)
    -- basic syntax groups
    set_hl("Comment", { fg = palette.muted, italic = opts.styles.comments == "italic" })
    set_hl("Constant", { fg = palette.orange })
    set_hl("String", { fg = palette.yellow })
    set_hl("Identifier", { fg = palette.pink })
    set_hl("Function", { fg = palette.accent, bold = opts.styles.functions == "bold" })
    set_hl("Statement", { fg = palette.red, bold = opts.styles.keywords == "bold" })
    set_hl("Type", { fg = palette.cyan })
    set_hl("Special", { fg = palette.dim })
end

function M.apply_treesitter(palette, opts)
    set_hl("@comment", { fg = palette.muted, italic = opts.styles.comments == "italic" })
    set_hl("@constant", { fg = palette.orange })
    set_hl("@string", { fg = palette.yellow })
    set_hl("@function", { fg = palette.accent })
    set_hl("@type", { fg = palette.cyan })
    set_hl("@keyword", { fg = palette.red, bold = opts.styles.keywords == "bold" })
    set_hl("@variable", { fg = palette.fg })
    set_hl("@parameter", { fg = palette.muted })
end

function M.apply_plugins(palette, opts)
    -- Telescope
    set_hl("TelescopeNormal", { bg = palette.bg, fg = palette.fg })
    set_hl("TelescopeBorder", { fg = palette.border, bg = palette.bg })
    set_hl("TelescopePromptNormal", { bg = "#222233", fg = palette.fg })
    set_hl("TelescopePromptBorder", { fg = palette.accent })
    set_hl("TelescopePromptTitle", { fg = palette.bg, bg = palette.accent })
    set_hl("TelescopePreviewTitle", { fg = palette.bg, bg = palette.white_soft })
    set_hl("TelescopeResultsTitle", { fg = palette.bg, bg = "#2B2D3F" })
    set_hl("TelescopeSelection", { fg = palette.white_soft, bg = palette.accent })

    -- Mason
    set_hl("MasonNormal", { bg = palette.bg, fg = palette.fg })
    set_hl("MasonHighlight", { fg = palette.accent })
    set_hl("MasonHeading", { fg = palette.accent, bold = true })

    -- Lazy (plugin manager)
    set_hl("LazyNormal", { bg = palette.bg, fg = palette.fg })
    set_hl("LazyH1", { fg = palette.accent, bold = true })
    set_hl("LazyH2", { fg = palette.dim })

    -- nvim-tree (simple integration)
    set_hl("NvimTreeNormal", { bg = palette.bg, fg = palette.fg })
    set_hl("NvimTreeRootFolder", { fg = palette.accent, bold = true })
    set_hl("NvimTreeFolderName", { fg = palette.dim })
    set_hl("NvimTreeGitDeleted", { fg = palette.red })
    set_hl("NvimTreeGitRenamed", { fg = palette.yellow })
    set_hl("NvimTreeGitNew", { fg = palette.green })

    -- Git signs
    set_hl("GitSignsAdd", { fg = palette.green })
    set_hl("GitSignsChange", { fg = palette.yellow })
    set_hl("GitSignsDelete", { fg = palette.red })

    -- Diagnostics / LSP
    set_hl("DiagnosticError", { fg = palette.red })
    set_hl("DiagnosticWarn", { fg = palette.orange })
    set_hl("DiagnosticInfo", { fg = palette.cyan })
    set_hl("DiagnosticHint", { fg = palette.green })
    set_hl("LspReferenceText", { bg = "#2F2B4A" })
    set_hl("LspReferenceRead", { bg = "#2F2B4A" })
    set_hl("LspReferenceWrite", { bg = "#2F2B4A" })

    -- Terminal
    set_hl("Terminal", { bg = palette.bg, fg = palette.fg })
end

return M
