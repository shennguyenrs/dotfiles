return {
  "williamboman/mason.nvim",
  dependencies = { "williamboman/mason-lspconfig.nvim" },
  config = function()
    require("mason").setup()
    require("mason-lspconfig").setup {
      ensure_installed = {
        "lua_ls",
        "bashls",
        "cssls",
        "gopls",
        "html",
        "ts_ls",
        "pyright",
        "svelte",
        "tailwindcss",
        "yamlls",
        "emmet_ls",
        "astro",
        "stylelint_lsp",
        "rust_analyzer",
        "sqlls",
        "dockerls",
        "docker_compose_language_service",
        -- "prettier_d",
        -- "eslint_d",
        -- "stylua",
        -- "goimports",
        -- "gofumpt",
        -- "sql-formatter",
        -- "sqlfluff",
        -- "yapf",
        -- "shfmt",
      },
    }
  end
}
