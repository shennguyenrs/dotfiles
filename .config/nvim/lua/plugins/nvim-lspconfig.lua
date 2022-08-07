local lspconfig = require("lspconfig")

-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = {noremap = true, silent = true}
vim.keymap.set("n", "<space>e", vim.diagnostic.open_float, opts)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local common_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

  -- Attach lsp_signature
  require "lsp_signature".on_attach()

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = {noremap = true, silent = true, buffer = bufnr}
  vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
  vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
  vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
  vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set(
    "n",
    "<space>wl",
    function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end,
    bufopts
  )
  vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, bufopts)
  vim.keymap.set("n", "<space>ca", vim.lsp.buf.code_action, bufopts)
  vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
  vim.keymap.set("n", "<space>f", vim.lsp.buf.formatting, bufopts)
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

-- PyRight
lspconfig.pyright.setup {
  on_attach = common_attach,
  capabilities = capabilities
}

-- Tailwind CSS
lspconfig.tailwindcss.setup {}

-- CssLs
lspconfig.cssls.setup {
  on_attach = common_attach,
  capabilities = capabilities
}

--Html
lspconfig.html.setup {
  on_attach = common_attach,
  capabilities = capabilities
}

-- Eslint
lspconfig.eslint.setup {
  on_attach = common_attach,
  capabilities = capabilities
}

-- TsServer
local function organize_imports()
  local params = {
    command = "_typescript.organizeImports",
    arguments = {vim.api.nvim_buf_get_name(0)},
    title = ""
  }
  vim.lsp.buf.execute_command(params)
end

lspconfig.tsserver.setup {
  root_dir = lspconfig.util.root_pattern(
    "package.json",
    "package-lock.json",
    ".git"
  ),
  on_attach = function(client, bufnr)
    -- Disable formating capability
    client.resolved_capabilities.document_formatting = false
    common_attach(client, bufnr)
  end,
  capabilities = capabilities,
  settings = {documentFormatting = false},
  commands = {
    OrganizeImports = {
      organize_imports,
      description = "Organize imports"
    }
  }
}

-- Sumneko_lua
local HOME = vim.fn.expand("$HOME/Applications")
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

-- Golang
lspconfig.gopls.setup {
  on_attach = common_attach,
  capabilities = capabilities
}

-- Yaml
lspconfig.yamlls.setup {
  on_attach = common_attach,
  capabilities = capabilities,
  settings = {
    yaml = {
      trace = {
        server = "verbose"
      },
      schemas = {
        kubernetes = "https://raw.githubusercontent.com/kubernetes/kubernetes/master/api/openapi-spec/swagger.json"
      }
    }
  }
}

-- Rust
lspconfig.rls.setup {
  on_attach = common_attach,
  capabilities = capabilities,
  settings = {
    rust = {
      unstable_features = true,
      build_on_save = false,
      all_features = true
    }
  }
}

-- EFM
local prettier = require "efm/prettier"
local luafmt = require "efm/luafmt"
local yapf = require "efm/yapf"

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
  markdown = {prettier},
  python = {yapf}
}

lspconfig.efm.setup {
  root_dir = lspconfig.util.root_pattern(
    "package.lock",
    "package-lock.json",
    ".git",
    "init.vim",
    "__init__.py"
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
  end
}
