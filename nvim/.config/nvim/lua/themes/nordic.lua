return {
	"AlexvZyl/nordic.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		require("nordic").setup({
			-- This callback can be used to override the colors used in the base palette.
			-- params: palette
			on_palette = function() end,
			-- This callback can be used to override the colors used in the extended palette.
			after_palette = function(palette)
				local U = require("nordic.utils")
				palette.bg_visual = U.blend(palette.orange.base, palette.bg, 0.15)
			end,
			-- This callback can be used to override highlights before they are applied.
			-- params: highlights, palette
			on_highlight = function() end,
			-- Enable bold keywords.
			bold_keywords = false,
			-- Enable italic comments.
			italic_comments = true,
			-- Enable general editor background transparency.
			transparent = {
				-- Enable transparent background.
				bg = true,
				-- Enable transparent background for floating windows.
				float = false,
			},
			-- Enable brighter float border.
			bright_border = false,
			-- Reduce the overall amount of blue in the theme (diverges from base Nord).
			reduced_blue = true,
			-- Swap the dark background with the normal one.
			swap_backgrounds = false,
			-- Override the styling of any highlight group.
			-- override = {
			-- 	Visual = { bg = palette.gray5 },
			-- },
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
