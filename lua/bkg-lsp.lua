local lspsaga = require("lspsaga") -- UI wrapper around LSP

local on_attach = function(_client, bufnr)
	lspsaga.init_lsp_saga({
		border_style = "round",
		use_saga_diagnostic_sign = false,
	})

    local function buf_set_keymap(...)
        vim.api.nvim_buf_set_keymap(bufnr, ...)
    end
    local function buf_set_option(...)
        vim.api.nvim_buf_set_option(bufnr, ...)
    end

    -- Use lsp for formatting via qq
    buf_set_option('formatexpr', 'v:lua.vim.lsp.buf.formatting_seq_sync({}, 2000)')

    --Enable completion triggered by <c-x><c-o>
    buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

    local opts = { noremap=true, silent=true }
    buf_set_keymap('n', '<C-]>', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
    buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    buf_set_keymap('n', 'gr', "<cmd>:TroubleToggle lsp_references<CR>", opts)
    buf_set_keymap('n', 'K', "<cmd>lua require('lspsaga.hover').render_hover_doc()<CR>", opts)
    buf_set_keymap('n', '<C-q>', "<cmd>lua require('lspsaga.signaturehelp').signature_help()<CR>", opts)
    buf_set_keymap('n', '<A-k>', "<cmd>lua require'lspsaga.provider'.preview_definition()<CR>", opts)

    buf_set_keymap('n', '<C-b>', "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>", opts)
    buf_set_keymap('n', '<C-f>', "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>", opts)
    buf_set_keymap('n', '<PageUp>', "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>", opts)
    buf_set_keymap('n', '<PageDown>', "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>", opts)

    buf_set_keymap('n', '<leader>ca', "<cmd>lua require('lspsaga.codeaction').code_action()<CR>", opts)
    buf_set_keymap('v', '<leader>ca', ":<C-U>lua require('lspsaga.codeaction').range_code_action()<CR>", opts)
    buf_set_keymap('n', '<leader>r', "<cmd>lua require('lspsaga.rename').rename()<CR>", opts)

end

return { on_attach = on_attach }
