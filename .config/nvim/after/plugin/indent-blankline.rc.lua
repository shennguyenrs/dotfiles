local status_ok, indent_blankline = pcall(require, 'ibl')
if not status_ok then return end

indent_blankline.setup {
  -- char = "▏",
  -- char = "│",
  -- filetype_exclude = {
  --   "help", "alpha", "dashboard", "neo-tree", "Trouble", "lazy"
  -- }
  -- show_trailing_blankline_indent = false,
  -- show_current_context = false
  indent = { char = "┊" },
  scope = { show_start = false }
}

local hooks = require "ibl.hooks"
hooks.register(hooks.type.WHITESPACE,
  hooks.builtin.hide_first_space_indent_level)

hooks.register(hooks.type.WHITESPACE, hooks.builtin.hide_first_tab_indent_level)
