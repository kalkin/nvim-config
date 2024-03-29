require("nvim-treesitter.configs").setup({
	ensure_installed = {
		"bash",
		"c",
		"cmake",
		"css",
		"html",
		"javascript",
		"jsdoc",
		"json",
		"kotlin",
		"latex",
		"lua",
		"make",
		"markdown",
		"php",
		"query",
		"regex",
		"rst",
		"rust",
		"scss",
		"toml",
		"vim",
		"yaml",
	},

	highlight = {
		enable = true,
	},
	indent = {
		enable = true,
		disable = {
			"python", -- We use yapf‼
		},
	},
	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = "gnn",
			node_incremental = "grn",
			scope_incremental = "grc",
			node_decremental = "grm",
		},
	},
	textobjects = { enable = true },
	playground = {
		enable = true,
		disable = {},
		updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
		persist_queries = false, -- Whether the query persists across vim sessions
		keybindings = {
			toggle_query_editor = "o",
			toggle_hl_groups = "i",
			toggle_injected_languages = "t",
			toggle_anonymous_nodes = "a",
			toggle_language_display = "I",
			focus_language = "f",
			unfocus_language = "F",
			update = "R",
			goto_node = "<cr>",
			show_help = "?",
		},
	},
})
