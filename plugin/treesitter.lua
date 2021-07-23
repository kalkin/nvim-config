require "nvim-treesitter.configs".setup {
    highlight = {
        enable = true,
    },
    indent = {
        enable = true,
        disable = { 
            "python", -- We use yapf‼
        },
    },
    incremental_selection = { enable = true },
    textobjects = { enable = true },
}
