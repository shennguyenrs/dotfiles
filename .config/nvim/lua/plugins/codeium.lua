return {
  'Exafunction/codeium.vim',
  event = "VeryLazy",
  keys = {
    {
      '<C-g>',
      function() return vim.fn['codeium#Accept']() end,
      mode = "i",
      expr = true
    }, {
    '<C-;>',
    function() return vim.fn['codeium#CycleCompletions'](1) end,
    mode = "i",
    expr = true
  }, {
    '<C-,>',
    function() return vim.fn['codeium#CycleCompletions'](-1) end,
    mode = "i",
    expr = true
  }, {
    '<C-x>',
    function() return vim.fn['codeium#Clear']() end,
    mode = "i",
    expr = true
  }
  },
  config = function() vim.g.codeium_disable_bindings = 1 end

}
