return {
  'ThePrimeagen/refactoring.nvim',
  event = 'VeryLazy',
  opts = {},
  keys = {
    {
      '<leader>re',
      "[[ <Esc><Cmd>lua require('refactoring').refactor('Extract Function')<CR>]]",
      mode = 'v',
      desc = 'Extract Function',
      noremap = true,
      silent = true,
      expr = false
    }, {
    '<leader>rf',
    "[[ <Esc><Cmd>lua require('refactoring').refactor('Extract Function To File')<CR>]]",
    mode = 'v',
    desc = 'Extract Function To File',
    noremap = true,
    silent = true,
    expr = false
  }, {
    '<leader>rv',
    "[[ <Esc><Cmd>lua require('refactoring').refactor('Extract Variable')<CR>]]",
    mode = 'v',
    desc = 'Extract Variable',
    noremap = true,
    silent = true,
    expr = false
  }, {
    '<leader>ri',
    "[[ <Esc><Cmd>lua require('refactoring').refactor('Inline Variable')<CR>]]",
    mode = 'v',
    desc = 'Inline Variable',
    noremap = true,
    silent = true,
    expr = false
  }
  }
}
