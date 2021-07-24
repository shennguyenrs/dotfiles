require "lspsaga".init_lsp_saga()

-- Mappings
-- Code action
vim.api.nvim_command [[
nnoremap <silent><leader>ca :Lspsaga code_action<CR>
vnoremap <silent><leader>ca :<C-U>Lspsaga range_code_action<CR>
]]

-- Rename
vim.api.nvim_command [[
nnoremap <silent>gr :Lspsaga rename<CR>
]]
