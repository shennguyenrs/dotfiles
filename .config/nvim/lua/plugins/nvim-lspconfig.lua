local lspconfig = require("lspconfig")

require "null-ls".setup {}

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local common_attach = function(client, bufnr)
  local function buf_set_keymap(...)
    vim.api.nvim_buf_set_keymap(bufnr, ...)
  end

  local function buf_set_option(...)
    vim.api.nvim_buf_set_option(bufnr, ...)
  end

  --Enable completion triggered by <c-x><c-o>
  buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

  -- Mappings.
  local opts = {noremap = true, silent = true}

  -- Attach lsp_signature
  require "lsp_signature".on_attach()

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  --buf_set_keymap("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts)
  buf_set_keymap("n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", opts)
  buf_set_keymap("n", "K", "<Cmd>lua vim.lsp.buf.hover()<CR>", opts)
  --buf_set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
  buf_set_keymap(
    "n",
    "<C-k>",
    "<cmd>lua vim.lsp.buf.signature_help()<CR>",
    opts
  )
  --[[buf_set_keymap(
    "n",
    "<space>wa",
    "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>",
    opts
  )
  buf_set_keymap(
    "n",
    "<space>wr",
    "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>",
    opts
  )
  buf_set_keymap(
    "n",
    "<space>wl",
    "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>",
    opts
  )]]
  buf_set_keymap(
    "n",
    "<space>D",
    "<cmd>lua vim.lsp.buf.type_definition()<CR>",
    opts
  )
  buf_set_keymap("n", "<space>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
  buf_set_keymap(
    "n",
    "<space>ca",
    "<cmd>lua vim.lsp.buf.code_action()<CR>",
    opts
  )
  buf_set_keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
  buf_set_keymap(
    "n",
    "<space>e",
    "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>",
    opts
  )
  buf_set_keymap("n", "[d", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", opts)
  buf_set_keymap("n", "]d", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", opts)
  buf_set_keymap(
    "n",
    "<space>q",
    "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>",
    opts
  )
  --buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
end

-- Snippets capability
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.resolveSupport = {
  properties = {
    "documentation",
    "detail",
    "additionalTextEdits"
  }
}

-- Diagnostic sign
local signs = {Error = " ", Warning = " ", Hint = " ", Information = " "}

for type, icon in pairs(signs) do
  local hl = "LspDiagnosticsSign" .. type
  vim.fn.sign_define(hl, {text = icon, texthl = hl, numhl = ""})
end

-- VimLs
lspconfig.vimls.setup {
  on_attach = common_attach,
  capabilities = capabilities
}

-- BashLs
lspconfig.bashls.setup {
  on_attach = common_attach,
  capabilities = capabilities
}

-- TsServer
local ts_utils_attach = require "plugins/nvim-lsp-ts-utils"

lspconfig.tsserver.setup {
  root_dir = lspconfig.util.root_pattern(
    "package.json",
    "package-lock.json",
    ".git"
  ),
  on_attach = function(client, bufnr)
    -- Disable formating capability
    client.resolved_capabilities.document_formatting = false
    ts_utils_attach(client)
    common_attach(client, bufnr)
  end,
  capabilities = capabilities,
  settings = {documentFormatting = false}
}

-- Sumneko_lua
local HOME = vim.fn.expand("$HOME")
local sumneko_binary =
  HOME .. "/lua-language-server/bin/Linux/lua-language-server"
local sumneko_root_path = HOME .. "/lua-language-server"

lspconfig.sumneko_lua.setup {
  cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"},
  settings = {
    Lua = {
      runtime = {
        version = "LuaJIT",
        path = vim.split(package.path, ";")
      },
      diagnostics = {
        globals = {"vim"}
      },
      workspace = {
        library = {
          [vim.fn.expand("$VIMRUNTIME/lua")] = true,
          [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true
        },
        preloadFileSize = 500
      }
    }
  },
  on_attach = common_attach,
  capabilities = capabilities
}

-- EFM
-- Check ctags file is exist and update tags
local update_ctags = function(client)
  vim.api.nvim_set_current_dir(client.config.root_dir)
  local file = io.open(".ctags", "r")
  if file ~= nil then
    io.close(file)
    vim.fn.systemlist("ctags -R")
  end
end

local prettier = require "efm/prettier"
local luafmt = require "efm/luafmt"

local languages = {
  lua = {luafmt},
  javascript = {prettier},
  javascriptreact = {prettier},
  typescript = {prettier},
  typescriptreact = {prettier},
  json = {prettier},
  html = {prettier},
  scss = {prettier},
  sass = {prettier},
  css = {prettier},
  markdown = {prettier}
}

lspconfig.efm.setup {
  root_dir = lspconfig.util.root_pattern(
    "package.lock",
    "package-lock.json",
    ".git",
    "init.vim"
  ),
  filetypes = vim.tbl_keys(languages),
  init_options = {
    documentFormatting = true,
    codeAction = false,
    rename = false,
    hover = false,
    completion = false
  },
  settings = {languages = languages},
  on_attach = function(client)
    -- Disable unneeded capabilities
    client.resolved_capabilities.document_formatting = true

    -- Format on save
    vim.api.nvim_command [[augroup FormatOnSave]]
    vim.api.nvim_command [[autocmd! * <buffer>]]
    vim.api.nvim_command [[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_seq_sync()]]
    vim.api.nvim_command [[augroup END]]

    -- Update ctags
    update_ctags(client)
  end
}
