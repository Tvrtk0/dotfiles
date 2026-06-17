return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("lualine").setup({
			-- options = {
			-- 	component_separators = { left = ">", right = "<" },
			-- },
			winbar = {
				lualine_a = {},
				lualine_b = { {
					"filename",
					path = 1,
					file_status = false,
				} },
				lualine_c = {},
				lualine_x = {},
				lualine_y = {},
				lualine_z = {},
			},
			inactive_winbar = {
				lualine_a = {},
				lualine_b = { {
					"filename",
					path = 1,
					file_status = false,
				} },
				lualine_c = {},
				lualine_x = {},
				lualine_y = {},
				lualine_z = {},
			},
		})
	end,
}
