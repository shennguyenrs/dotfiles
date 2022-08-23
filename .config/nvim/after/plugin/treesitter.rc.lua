require "nvim-treesitter.configs".setup {
  highlight = {
    enable = true,
    disable = {}
  },
  auto_install = true,
  ensure_installed = {
    "bash",
    "css",
    "scss",
    "html",
    "javascript",
    "typescript",
    "tsx",
    "json",
    "lua",
    "python",
    "go",
    "regex",
    "yaml",
    "dockerfile",
    "markdown",
    "sql",
    "vim"
  }
}

-- local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
-- parser_config.tsx.used_by = {"javascript", "typescript"}