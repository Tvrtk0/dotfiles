local map = vim.keymap.set

-- move selected lines up/down, keeping indentation
map("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
map("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })

-- keep cursor in place when joining lines
map("n", "J", "mzJ`z", { desc = "Join lines, keep cursor" })

-- keep the view centered
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

-- register-friendly paste/yank/delete (kept from the old config)
map("x", "<leader>p", [["_dP]], { desc = "Paste over without yanking" })
map({ "n", "v" }, "<leader>y", [["+y]], { desc = "Yank to system clipboard" })
map({ "n", "v" }, "<leader>d", [["_d]], { desc = "Delete without yanking" })

-- simple buffer navigation (kept from the old config)
map("n", "tj", "<cmd>bnext<CR>", { desc = "Next buffer" })
map("n", "tk", "<cmd>bprev<CR>", { desc = "Previous buffer" })
map("n", "tx", "<cmd>bdelete<CR>", { desc = "Delete buffer" })

-- diagnostics
map("n", "<leader>e", vim.diagnostic.open_float, { desc = "Line diagnostics" })
map("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Diagnostics to loclist" })
