require "nvim-treesitter.configs".setup {
  highlight = { enable = true, disable = {} },
  autotag = { enable = true },
  matchup = { enable = true },
  auto_install = true,
  ensure_installed = {
    "bash", "css", "scss", "html", "javascript", "typescript", "tsx",
    "json", "lua", "python", "go", "regex", "yaml", "dockerfile",
    "markdown", "sql", "svelte", "vim"
  }
}
