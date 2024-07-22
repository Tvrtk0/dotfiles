return {
    "AlexvZyl/nordic.nvim",
    lazy = false,
    priority = 1000,
    config = function()
        local palette = require("nordic.colors")

        require("nordic").setup({
            -- This callback can be used to override the colors used in the palette.
            --  on_palette = function(palette)
            --      return palette
            --  end,
            -- Enable bold keywords.
            bold_keywords = false,
            -- Enable italic comments.
            italic_comments = true,
            -- Enable general editor background transparency.
            transparent_bg = true,
            -- Enable brighter float border.
            bright_border = false,
            -- Reduce the overall amount of blue in the theme (diverges from base Nord).
            reduced_blue = true,
            -- Swap the dark background with the normal one.
            swap_backgrounds = false,
            -- Override the styling of any highlight group.
            override = {
                Visual = { bg = palette.gray5 }
            },
            -- Cursorline options.  Also includes visual/selection.
            cursorline = {
                -- Bold font in cursorline.
                bold = false,
                -- Bold cursorline number.
                bold_number = true,
                -- Available styles: 'dark', 'light'.
                theme = "dark",
                -- Blending the cursorline bg with the buffer bg.
                blend = 0.85,
            },
            telescope = {
                -- Available styles: `classic`, `flat`.
                style = "classic",
            },
            leap = {
                -- Dims the backdrop when using leap.
                dim_backdrop = false,
            },
            ts_context = {
                -- Enables dark background for treesitter-context window
                dark_background = true,
            },
        })

        require("nordic").load()
    end,
}

--    "ellisonleao/gruvbox.nvim",
--    priority = 2000,
--    config = function()
--        require("gruvbox").setup({
--            terminal_colors = true, -- add neovim terminal colors
--            undercurl = true,
--            underline = true,
--            bold = true,
--            italic = {
--                strings = true,
--                emphasis = true,
--                comments = true,
--                operators = false,
--                folds = true,
--            },
--            strikethrough = true,
--            invert_selection = false,
--            invert_signs = false,
--            invert_tabline = false,
--            invert_intend_guides = false,
--            inverse = true, -- invert background for search, diffs, statuslines and errors
--            contrast = "", -- can be "hard", "soft" or empty string
--            palette_overrides = {},
--            overrides = {},
--            dim_inactive = false,
--            transparent_mode = true,
--        })
--
--        vim.cmd("colorscheme gruvbox")
--    end,

--        "craftzdog/solarized-osaka.nvim",
--        lazy = false,
--        priority = 1000,
--        config = function()
--            require("solarized-osaka").setup({
--                transparent = true,
--                terminal_colors = true,
--                styles = {
--                    sidebars = "transparent",
--                    floats = "transparent",
--                },
--                dim_inactive = true,
--                day_brightness = 0.9,
--            })

--            vim.cmd.colorscheme("solarized-osaka")
--        end,
