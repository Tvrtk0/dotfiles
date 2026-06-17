return {
	"folke/tokyonight.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		require("tokyonight").setup({
			style = "night", -- `storm`, `night` and `moon`
			transparent = true,
		})

		vim.cmd("colorscheme tokyonight")
	end,
}
