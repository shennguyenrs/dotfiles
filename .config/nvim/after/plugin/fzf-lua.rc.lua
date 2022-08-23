local keymap = vim.keymap

keymap.set('n', '<leader>fb', "<cmd>lua require('fzf-lua').builtin()<CR>")
keymap.set('n', '<leader>ff', "<cmd>lua require('fzf-lua').files()<CR>")
keymap.set('n', '<leader>fr', "<cmd>lua require('fzf-lua').grep()<CR>")
