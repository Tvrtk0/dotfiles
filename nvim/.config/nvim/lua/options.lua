local o = vim.opt

-- indentation
o.tabstop = 4
o.softtabstop = 4
o.shiftwidth = 4
o.expandtab = true
o.smartindent = true

-- line numbers
o.number = true
o.relativenumber = true

-- ui
o.termguicolors = true
o.signcolumn = "yes"
o.cursorline = true
o.scrolloff = 15
o.conceallevel = 2
o.winborder = "rounded" -- 0.11: rounded borders for all floating windows (hover, etc.)

-- splits
o.splitbelow = true
o.splitright = true

-- search
o.ignorecase = true
o.smartcase = true
o.incsearch = true
o.hlsearch = false

-- files / persistence
o.swapfile = false
o.backup = false
o.undofile = true

-- behaviour
o.mouse = "a"
o.updatetime = 250

-- native completion (0.11 supports 'fuzzy' and 'popup' in completeopt)
o.completeopt = "menu,menuone,noinsert,fuzzy,popup"
o.pumheight = 10
