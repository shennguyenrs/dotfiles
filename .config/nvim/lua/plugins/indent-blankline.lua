return {
  'lukas-reineke/indent-blankline.nvim',
  main = "ibl",
  event = "VeryLazy",
  config = function()
    require("ibl").setup({
      indent = { char = "┊" }, scope = { show_start = false }
    })

    local hooks = require "ibl.hooks"
    hooks.register(hooks.type.WHITESPACE,
      hooks.builtin.hide_first_space_indent_level)
    hooks.register(hooks.type.WHITESPACE,
      hooks.builtin.hide_first_tab_indent_level)
  end
}
