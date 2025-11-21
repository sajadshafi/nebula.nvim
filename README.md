
# nebula.nvim

A nebula inspired Neovim colorscheme with optional transparency and first-class highlights for Treesitter, Lualine, Telescope, Mason and Lazy (plugin manager). Use it as a plugin with lazy.nvim or call :colorscheme nebula to load it.

Preview palette
- Background: #222436
- Foreground: #FFF4D2
- Accent / Border: #C099FF

Features
- Dark colorscheme with optional transparent background (for floating terminals / kitty/alacritty backgrounds)
- :colorscheme nebula and :colorscheme nebula supported (colors/ shims)
- Treesitter-friendly highlights
- Integrations for: lualine, telescope, mason, lazy, nvim-tree, treesitter
- Terminal color mappings

Installation (lazy.nvim)
```lua
-- lazy.nvim
{
  "sajadshafi/nebula.nvim",
  config = function()
    -- Example: enable transparency
    require("nebula").setup({ transparent = true })
    require("nebula").apply()

    -- Lualine integration example:
    -- require('lualine').setup({ options = { theme = require('nebula').lualine_theme() } })
  end
}
```

Installation (packer.nvim)
```lua
use {
  "sajadshafi/nebula.nvim",
  config = function()
    require("nebula").setup({ transparent = false })
    require("nebula").apply()
  end
}
```

Load as colorscheme
- :colorscheme nebula
- :colorscheme nebula

API
- require("nebula").setup(opts)
  - opts.transparent = boolean (default false)
  - opts.styles = table, keys: comments, keywords, functions, cursorline_nr
- require("nebula").apply()
  - apply the colorscheme now (useful in config or after changing setup)

Lualine integration
```lua
require('lualine').setup({ options = { theme = require('nebula').lualine_theme() } })
```

Notes about plugin integrations
- Treesitter: the theme sets a number of @-groups for common language elements; additional Treesitter modules may require extra customization.
- Telescope: prompt/border/selection are themed; if you use extensions that define custom highlights you may want to add them in your local after/plugin or open a PR.
- Mason: basic headings/normal text are themed.
- Lazy: highlights for headers/normal are provided so the UI looks consistent.
- nvim-tree: root folder / git indicators / folder names are themed.

Extending the theme
- If you'd like additional plugin-specific highlights (for example cmp, notify, trouble, undotree), open an issue or send a PR — I can add more default mappings.

Screenshots
- Add screenshots under `assets/` and reference them in the README for the GitHub repo. I didn't embed images here, but a `assets/preview.png` will make the README pop.

Contributing
- PRs welcome. Please run `stylua` or keep code style consistent.
- If you add a new plugin integration, include before/after screenshots and a short testing checklist.

License
- MIT
```
