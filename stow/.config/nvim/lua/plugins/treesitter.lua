require "nvim-treesitter.configs".setup {
  highlight = {
    enable = true,
    disable = {}
  },
  indent = {
    enable = false,
    disable = {}
  },
  ensure_installed = {
    "bash",
    "c",
    "cpp",
    "css",
    "dockerfile",
    "html",
    "java",
    "javascript",
    "json",
    "lua",
    "php",
    "python",
    "regex",
    "scss",
    "tsx",
    "typescript",
    "yaml"
  }
}

local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.tsx.used_by = {"javascript", "typescript.tsx"}
