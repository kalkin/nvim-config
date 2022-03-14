-- Diagnostic framework

-- Nvim provides a framework for displaying errors or warnings from external
-- tools, otherwise known as "diagnostics". These diagnostics can come from a
-- variety of sources, such as linters or LSP servers. The diagnostic framework
-- is an extension to existing error handling functionality such as the
-- |quickfix| list.

local border = {
      {"🭽", "FloatBorder"},
      {"▔", "FloatBorder"},
      {"🭾", "FloatBorder"},
      {"▕", "FloatBorder"},
      {"🭿", "FloatBorder"},
      {"▁", "FloatBorder"},
      {"🭼", "FloatBorder"},
      {"▏", "FloatBorder"},
}

local signs = { Error = '⛔', Warn = ' ', Hint = '💡', Info = '📌' }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

vim.diagnostic.config({
    virtual_text = {
        prefix = '👉',
        source  = "always",
    },
    float = {
        border = border,
        focusable = false,
        header = { '' .. ' Diagnostics:', 'Normal' },
        source = 'always',
    },
    signs = true,
    update_in_insert = false,
    underline = true,
});
