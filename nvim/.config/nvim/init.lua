-- From-scratch config for Neovim 0.11+, native-first (no plugin manager yet).
-- Old setup is preserved and runnable:  NVIM_APPNAME=nvim-old nvim   (alias: vimold)
--
-- Add plugins later only when native isn't enough. To bootstrap lazy.nvim,
-- create lua/plugins.lua and require it at the bottom of this file.

vim.g.mapleader = " "
vim.g.maplocalleader = " "

require("options")
require("colorscheme")
require("keymaps")
require("autocmds")
require("lsp")
