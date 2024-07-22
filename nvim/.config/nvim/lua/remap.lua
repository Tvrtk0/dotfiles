vim.g.mapleader = " "

-- move selected
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selected line down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selected line up" })

-- leave cursor at the start of the line after `J`
vim.keymap.set("n", "J", "mzJ`z", { desc = "Leave cursor at the start of the line after `J`" })

-- keep screen centered after page up/down
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc='Keep screen centered after page up'})
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc='Keep screen centered after page down'})

-- keep screen centered after search term
vim.keymap.set("n", "n", "nzzzv", {desc='Keep screen centered after search term'})
vim.keymap.set("n", "N", "Nzzzv", {desc='Keep screen centered after search term'})

-- paste over without copying selected text
vim.keymap.set("x", "<leader>p", [["_dP]], { desc = "Paste over without copying selected text" })

-- yank to the system clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]], { desc = "Yank to the system clipboard" })

-- delete without yanking
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]], { desc = "Delete without yanking" })

-- open links with gx when netrw is disabled
vim.keymap.set(
	{ "n", "v" },
	"gx",
	[[:execute '!open ' . shellescape(expand('<cfile>'), 1)<CR>]],
	{ desc = "Open links with gx when netrw is disabled" }
)

-- buffers
vim.api.nvim_set_keymap("n", "tk", ":blast<enter>", { noremap = false })
vim.api.nvim_set_keymap("n", "tj", ":bfirst<enter>", { noremap = false })
vim.api.nvim_set_keymap("n", "th", ":bprev<enter>", { noremap = false })
vim.api.nvim_set_keymap("n", "tl", ":bnext<enter>", { noremap = false })
vim.api.nvim_set_keymap("n", "td", ":bdelete<enter>", { noremap = false })
