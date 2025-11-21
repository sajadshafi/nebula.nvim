return {
    {
        "sajadshafi/nebula.nvim",
        name = "nebula",
        config = function()
            require("nebula").setup({
                transparent_background = true,
                integrations = {
                    treesitter = true,
                    lualine = true,
                    telescope = true,
                    mason = true,
                    lazy = true,
                    cmp = true,
                    gitsigns = true,
                    nvim_tree = true,
                },
                styles = { comments = "italic", keywords = "bold", functions = "NONE" },
            })
            require("nebula").apply()
            -- Optional helper: make some groups truly transparent (bg = "none")
            require("nebula").enable_transparency()
            -- Lualine integration example
            if pcall(require, "lualine") then
                require("lualine").setup({ options = { theme = require("nebula").lualine_theme() } })
            end
        end,
    }
}
