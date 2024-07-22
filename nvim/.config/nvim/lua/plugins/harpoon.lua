return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local harpoon = require("harpoon")

		harpoon:setup()

		vim.keymap.set("n", "<leader>sa", function()
			harpoon:list():add()
		end, { desc = "Harppon Add" })
		vim.keymap.set("n", "<leader>se", function()
			harpoon.ui:toggle_quick_menu(harpoon:list())
		end, { desc = "Harpoon Edit" })

		vim.keymap.set("n", "<leader>1", function()
			harpoon:list():select(1)
		end, { desc = "Harpoon 1. item" })
		vim.keymap.set("n", "<leader>2", function()
			harpoon:list():select(2)
		end, { desc = "Harpoon 2. item" })
		vim.keymap.set("n", "<leader>3", function()
			harpoon:list():select(3)
		end, { desc = "Harpoon 3. item" })
		vim.keymap.set("n", "<leader>4", function()
			harpoon:list():select(4)
		end, { desc = "Harpoon 4. item" })
		vim.keymap.set("n", "<leader>5", function()
			harpoon:list():select(5)
		end, { desc = "Harpoon 5. item" })

		-- Toggle previous & next buffers stored within Harpoon list
		vim.keymap.set("n", "<leader>s,", function()
			harpoon:list():prev()
		end, { desc = "Harpoon Previous" })
		vim.keymap.set("n", "<leader>s;", function()
			harpoon:list():next()
		end, { desc = "Harpoon Next" })
	end,
}
