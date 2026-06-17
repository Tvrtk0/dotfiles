-- Diagnostics appearance
vim.diagnostic.config({
	virtual_text = { prefix = "●" },
	severity_sort = true,
	underline = true,
	float = { border = "rounded", source = true },
})

-- When a language server attaches: turn on native autocompletion and add a
-- couple of buffer-local maps. Note many LSP keymaps are 0.11 defaults already:
--   grn rename · gra code action · grr references · gri implementation
--   gO document symbols · K hover · <C-s> signature help · [d / ]d diagnostics
vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(ev)
		local client = vim.lsp.get_client_by_id(ev.data.client_id)
		if client and client:supports_method("textDocument/completion") then
			vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
		end

		local opts = { buffer = ev.buf }
		vim.keymap.set("n", "gd", vim.lsp.buf.definition, vim.tbl_extend("force", opts, { desc = "Go to definition" }))
		vim.keymap.set({ "n", "v" }, "<leader>f", function()
			vim.lsp.buf.format({ async = true })
		end, vim.tbl_extend("force", opts, { desc = "Format buffer" }))
	end,
})

-- Server definitions using the native 0.11 API (no nvim-lspconfig needed).
-- Install the servers and they auto-enable on next launch:
--   lua_ls : brew install lua-language-server
--   ts_ls  : npm install -g typescript-language-server
vim.lsp.config("lua_ls", {
	cmd = { "lua-language-server" },
	filetypes = { "lua" },
	root_markers = { ".luarc.json", ".luarc.jsonc", ".git" },
	settings = {
		Lua = {
			runtime = { version = "LuaJIT" },
			diagnostics = { globals = { "vim" } },
			workspace = {
				library = vim.api.nvim_get_runtime_file("", true),
				checkThirdParty = false,
			},
			telemetry = { enable = false },
		},
	},
})

vim.lsp.config("ts_ls", {
	cmd = { "typescript-language-server", "--stdio" },
	filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
	root_markers = { "package.json", "tsconfig.json", ".git" },
})

-- Only enable a server if its binary is on PATH, so a missing server is silent.
local function enable_if_present(name, bin)
	if vim.fn.executable(bin) == 1 then
		vim.lsp.enable(name)
	end
end

enable_if_present("lua_ls", "lua-language-server")
enable_if_present("ts_ls", "typescript-language-server")
