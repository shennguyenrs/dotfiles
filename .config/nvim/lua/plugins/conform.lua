return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
  cmd = { "ConformInfo" },
  keys = {
    {
      "<space>f",
      function()
        require("conform").format({ async = true, lsp_format = "fallback" })
      end,
      mode = "",
      desc = "Format buffer",
    },
  },
  opts = {
    formatters_by_ft = {
      lua = { "stylua" },
      python = { "yapf" },
      go = { "goimports", "gofumpt" },
      javascript = { "oxfmt", "prettierd", "prettier", stop_after_first = true },
      typescript = { "oxfmt", "prettierd", "prettier", stop_after_first = true },
      javascriptreact = { "oxfmt", "prettierd", "prettier", stop_after_first = true },
      typescriptreact = { "oxfmt", "prettierd", "prettier", stop_after_first = true },
      json = { "oxfmt","prettierd", "prettier", stop_after_first = true },
      html = { "oxfmt","prettierd", "prettier", stop_after_first = true },
      css = { "oxfmt","prettierd", "prettier", stop_after_first = true },
      sh = { "shfmt" },
      sql = { "sql_formatter" },
    },
    format_on_save = {
      timeout_ms = 500,
      lsp_format = "fallback",
    },
  },
}
