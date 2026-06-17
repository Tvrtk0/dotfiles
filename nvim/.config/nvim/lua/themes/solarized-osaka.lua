return {
	"craftzdog/solarized-osaka.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		require("solarized-osaka").setup({
			transparent = true,
			terminal_colors = true,
			styles = {
				sidebars = "transparent",
				floats = "transparent",
			},
			dim_inactive = true,
			day_brightness = 0.9,
		})

		vim.cmd.colorscheme("solarized-osaka")
	end,
}
