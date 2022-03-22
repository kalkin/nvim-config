local nvim_lsp = require("lspconfig")
local bkg_lsp = require("bkg-lsp")

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = { "als", "flow", "jedi_language_server", "rust_analyzer", "phpactor", "pylsp" }
for _, lsp in ipairs(servers) do
	nvim_lsp[lsp].setup({
		on_attach = bkg_lsp.on_attach,
		flags = {
			debounce_text_changes = 150,
		},
	})
end

vim.cmd([[autocmd! CursorHold,CursorHoldI * lua require'lspsaga.diagnostic'.show_line_diagnostics()]])
