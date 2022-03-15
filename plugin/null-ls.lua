local bkg_diagnostics = require("bkg-diagnostics")
local bkg_lsp = require("bkg-lsp")
local null_ls = require("null-ls")

null_ls.setup({
	sources = {
		bkg_diagnostics.clippy,

		null_ls.builtins.code_actions.eslint,
		null_ls.builtins.code_actions.proselint,
		null_ls.builtins.code_actions.shellcheck,

		null_ls.builtins.diagnostics.ansiblelint,
		null_ls.builtins.diagnostics.eslint,
		null_ls.builtins.diagnostics.mdl,
		null_ls.builtins.diagnostics.mypy,
		null_ls.builtins.diagnostics.php,
		null_ls.builtins.diagnostics.phpcs,
		null_ls.builtins.diagnostics.phpmd,
		null_ls.builtins.diagnostics.proselint.with({
			extra_filetypes = { "asciidoc", "text", "rst" },
		}),
		null_ls.builtins.diagnostics.pylint,
		null_ls.builtins.diagnostics.rpmspec,
		null_ls.builtins.diagnostics.selene,
		null_ls.builtins.diagnostics.shellcheck,
		null_ls.builtins.diagnostics.trail_space,
		null_ls.builtins.diagnostics.vint,
		null_ls.builtins.diagnostics.yamllint,
		null_ls.builtins.diagnostics.zsh,

		null_ls.builtins.formatting.eslint,
		null_ls.builtins.formatting.isort,
		null_ls.builtins.formatting.pg_format,
		null_ls.builtins.formatting.phpcbf,
		null_ls.builtins.formatting.rustfmt,
		null_ls.builtins.formatting.stylua,
		null_ls.builtins.formatting.terraform_fmt,
		null_ls.builtins.formatting.trim_newlines,
		null_ls.builtins.formatting.trim_whitespace,
		null_ls.builtins.formatting.xmllint,
		null_ls.builtins.formatting.yapf,
	},
	log = {
		enable = true,
		level = "warn",
		use_console = "async",
	},
	on_attach = bkg_lsp.on_attach,
})
