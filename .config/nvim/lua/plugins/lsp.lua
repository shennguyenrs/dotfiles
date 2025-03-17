return {
  "neovim/nvim-lspconfig",
  dependencies = {
    {
      "ray-x/lsp_signature.nvim",
      opts = {},
      config = function(_, opts)
        require("lsp_signature").setup(opts)
      end,
    },
  },
  config = function()
    local lspconfig = require("lspconfig")
    local protocol = vim.lsp.protocol
    local keymap = vim.keymap

    local opts = { noremap = true, silent = true }
    keymap.set("n", "<space>e", vim.diagnostic.open_float, opts)
    keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
    keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
    keymap.set("n", "<space>q", vim.diagnostic.setloclist, opts)

    local common_attach = function(client, bufnr)
      vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

      -- Attach lsp_signature
      require("lsp_signature").on_attach()

      -- Mappings
      local bufopts = { noremap = true, silent = true, buffer = bufnr }
      local lspbuf = vim.lsp.buf

      keymap.set("n", "gD", lspbuf.declaration, bufopts)
      keymap.set("n", "gd", lspbuf.definition, bufopts)
      keymap.set("n", "K", lspbuf.hover, bufopts)
      keymap.set("n", "gi", lspbuf.implementation, bufopts)
      keymap.set("n", "<C-k>", lspbuf.signature_help, bufopts)
      keymap.set("n", "<space>wa", lspbuf.add_workspace_folder, bufopts)
      keymap.set("n", "<space>wr", lspbuf.remove_workspace_folder, bufopts)
      keymap.set("n", "<space>wl", function()
        print(vim.inspect(lspbuf.list_workspace_folders()))
      end, bufopts)
      keymap.set("n", "<space>D", lspbuf.type_definition, bufopts)
      keymap.set("n", "<space>rn", lspbuf.rename, bufopts)
      keymap.set({ "n", "x" }, "<space>ca", lspbuf.code_action, bufopts)
      keymap.set("n", "gr", lspbuf.references, bufopts)
      keymap.set("n", "<space>f", function()
        lspbuf.format({ async = true })
      end, bufopts)

      -- Formating
      -- if client.server_capabilities.documentFormattingProvider then
      --   vim.api.nvim_create_autocmd("BufWritePre", {
      --     group = vim.api.nvim_create_augroup("Format", { clear = true }),
      --     buffer = bufnr,
      --     callback = function() vim.lsp.buf.format { async = true } end
      --   })
      -- end
    end

    local lsp_flags = { debounce_text_changes = 150 }

    -- Set up completion using nvim_cmp with LSP source
    local capabilities = require("cmp_nvim_lsp").default_capabilities(protocol.make_client_capabilities())

    -- Diagnostic sign
    local signs = {
      Error = "E",
      Warning = "W",
      Hint = "H",
      Information = "I",
    }

    for type, icon in pairs(signs) do
      local hl = "LspDiagnosticsSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
    end

    -- BashLs
    lspconfig.bashls.setup({
      on_attach = common_attach,
      capabilities = capabilities,
      flags = lsp_flags,
    })

    -- Dockerls
    lspconfig.dockerls.setup({
      on_attach = common_attach,
      capabilities = capabilities,
      flags = lsp_flags,
    })

    -- Docker_compose_language_service
    lspconfig.docker_compose_language_service.setup({
      on_attach = common_attach,
      capabilities = capabilities,
      flags = lsp_flags,
    })

    -- Dart
    lspconfig.dartls.setup({
      on_attach = common_attach,
      capabilities = capabilities,
      flags = lsp_flags,
    })

    -- SQL
    lspconfig.sqlls.setup({
      on_attach = common_attach,
      capabilities = capabilities,
      flags = lsp_flags,
      root_pattern = { ".git" },
    })

    -- PyRight
    lspconfig.pyright.setup({
      on_attach = common_attach,
      capabilities = capabilities,
      flags = lsp_flags,
    })

    -- Tailwind CSS
    lspconfig.tailwindcss.setup({
      on_attach = common_attach,
      capabilities = capabilities,
      flags = lsp_flags,
      filetypes = {
        "astro",
        "astro-markdown",
        "handlebars",
        "hbs",
        "html",
        "css",
        "less",
        "postcss",
        "sass",
        "scss",
        "javascript",
        "javascriptreact",
        "typescript",
        "typescriptreact",
        "svelte",
      },
      root_pattern = {
        "tailwind.config.js",
        "tailwind.config.ts",
        "postcss.config.js",
        "postcss.config.ts",
        "package.json",
        "node_modules",
        ".git",
      },
    })

    -- CssLs
    lspconfig.cssls.setup({
      on_attach = common_attach,
      capabilities = capabilities,
      filetypes = { "css", "scss", "sass", "handlebars" },
      flags = lsp_flags,
    })

    -- Html
    lspconfig.html.setup({
      on_attach = common_attach,
      capabilities = capabilities,
      filetypes = { "html", "handlebars" },
      flags = lsp_flags,
    })

    -- Golang
    lspconfig.gopls.setup({
      capabilities = capabilities,
      on_attach = function(client, bufnr)
        -- Disable formating capability
        client.server_capabilities.document_formatting = false
        common_attach(client, bufnr)
      end,
      settings = { gopls = { gofumpt = true } },
      flags = lsp_flags,
    })

    -- Dockerfile
    lspconfig.dockerls.setup({
      on_attach = common_attach,
      capabilities = capabilities,
      flags = lsp_flags,
    })

    -- Emmet
    lspconfig.emmet_ls.setup({
      capabilities = capabilities,
      filetypes = {
        "html",
        "handlebars",
        "svelte",
        "astro",
        "typescriptreact",
        "javascriptreact",
        "javascript",
      },
      flags = lsp_flags,
    })

    -- Svelte
    lspconfig.svelte.setup({
      on_attach = common_attach,
      capabilities = capabilities,
      flags = lsp_flags,
    })

    -- Astro
    lspconfig.astro.setup({
      on_attach = common_attach,
      capabilities = capabilities,
      flags = lsp_flags,
    })

    -- Style lint
    lspconfig.stylelint_lsp.setup({
      on_attach = common_attach,
      capabilities = capabilities,
      flags = lsp_flags,
    })

    -- Rust
    lspconfig.rust_analyzer.setup({
      on_attach = common_attach,
      capabilities = capabilities,
      flags = lsp_flags,
      root_pattern = { "Cargo.toml" },
    })

    -- TsServer
    local function organize_imports()
      local params = {
        command = "_typescript.organizeImports",
        arguments = { vim.api.nvim_buf_get_name(0) },
        title = "",
      }
      vim.lsp.buf.execute_command(params)
    end

    lspconfig.ts_ls.setup({
      root_dir = lspconfig.util.root_pattern("package.json", "package-lock.json", ".git"),
      filetypes = {
        "javascript",
        "typescript",
        "javascriptreact",
        "typescriptreact",
      },
      cmd = { "typescript-language-server", "--stdio" },
      on_attach = function(client, bufnr)
        -- Disable formating capability
        client.server_capabilities.document_formatting = false
        common_attach(client, bufnr)
      end,
      capabilities = capabilities,
      commands = {
        OrganizeImports = { organize_imports, description = "Organize imports" },
      },
      flags = lsp_flags,
    })

    -- Yaml
    lspconfig.yamlls.setup({
      on_attach = common_attach,
      capabilities = capabilities,
      settings = {
        yaml = {
          trace = { server = "verbose" },
          schemas = {
            ["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",
          },
        },
      },
      flags = lsp_flags,
    })

    -- lua_ls
    lspconfig.lua_ls.setup({
      on_attach = function(client, bufnr)
        -- Disable formating capability
        client.server_capabilities.document_formatting = false
        common_attach(client, bufnr)
      end,
      capabilities = capabilities,
      settings = {
        Lua = {
          diagnostics = {
            -- Get the language server to recognize the `vim` global
            globals = { "vim" },
          },
          workspace = {
            -- Make the server aware of Neovim runtime files
            library = vim.api.nvim_get_runtime_file("", true),
            checkThirdParty = false,
          },
        },
      },
      flags = lsp_flags,
    })

    -- eslint
    lspconfig.eslint.setup({})
  end,
}
