-- Built-in catppuccin colorscheme (ships with Neovim 0.12 — no plugin needed).
-- The built-in version has no options, so transparency is done the native way:
-- clear the background on the relevant highlight groups after the scheme loads.

local transparent_groups = {
	"Normal", -- editor background
	"NormalNC", -- background of non-current windows
	"NormalFloat", -- floating windows (hover, etc.)
	"FloatBorder",
	"SignColumn",
	"LineNr",
	"CursorLineNr",
	"EndOfBuffer",
	"FoldColumn",
	"MsgArea",
}

local function clear_backgrounds()
	for _, group in ipairs(transparent_groups) do
		-- :highlight is additive — only guibg/ctermbg change, the foreground is kept.
		vim.cmd(string.format("highlight %s guibg=NONE ctermbg=NONE", group))
	end
end

-- Re-apply on every colorscheme load so it survives `:colorscheme` switches.
vim.api.nvim_create_autocmd("ColorScheme", { callback = clear_backgrounds })

vim.cmd.colorscheme("catppuccin")
