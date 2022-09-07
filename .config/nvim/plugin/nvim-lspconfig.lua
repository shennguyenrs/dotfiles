local status, lspconfig = pcall(require, "lspconfig")
if (not status) then return end

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
	require "lsp_signature".on_attach()

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
	keymap.set(
		"n",
		"<space>wl",
		function()
			print(vim.inspect(lspbuf.list_workspace_folders()))
		end,
		bufopts
	)
	keymap.set("n", "<space>D", lspbuf.type_definition, bufopts)
	keymap.set("n", "<space>rn", lspbuf.rename, bufopts)
	keymap.set("n", "<space>ca", lspbuf.code_action, bufopts)
	keymap.set("n", "gr", lspbuf.references, bufopts)
	keymap.set("n", "<space>f", lspbuf.formatting, bufopts)

	-- Formating
	if client.server_capabilities.documentFormattingProvider then
		vim.api.nvim_create_autocmd("BufWritePre", {
			group = vim.api.nvim_create_augroup("Format", { clear = true }),
			buffer = bufnr,
			callback = function() vim.lsp.buf.formatting_seq_sync() end
		})
	end
end

-- Set up completion using nvim_cmp with LSP source
local capabilities = require('cmp_nvim_lsp').update_capabilities(
	protocol.make_client_capabilities()
)

-- Diagnostic sign
local signs = { Error = " ", Warning = " ", Hint = " ", Information = " " }

for type, icon in pairs(signs) do
	local hl = "LspDiagnosticsSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

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

-- Golang
lspconfig.gopls.setup {
	on_attach = common_attach,
	capabilities = capabilities
}

-- Dockerfile
lspconfig.dockerls.setup {
	on_attach = common_attach,
	capabilities = capabilities,
}

-- Emmet
lspconfig.emmet_ls.setup({
	capabilities = capabilities,
	filetypes = { 'html', 'svelte', 'typescriptreact', 'javascriptreact' },
})

-- Svelte
lspconfig.svelte.setup({
	on_attach = common_attach,
	capabilities = capabilities,
})

-- TsServer
local function organize_imports()
	local params = {
		command = "_typescript.organizeImports",
		arguments = { vim.api.nvim_buf_get_name(0) },
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
	filetypes = { "javascript", "typescript", "javascriptreact"
		, "typescriptreact" },
	cmd = { "typescript-language-server", "--stdio" },
	on_attach = function(client, bufnr)
		-- Disable formating capability
		client.resolved_capabilities.document_formatting = false
		common_attach(client, bufnr)
	end,
	capabilities = capabilities,
	commands = {
		OrganizeImports = {
			organize_imports,
			description = "Organize imports"
		}
	}
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

-- Sumneko_lua
lspconfig.sumneko_lua.setup {
	on_attach = common_attach,
	capabilities = capabilities,
	settings = {
		Lua = {
			diagnostics = {
				-- Get the language server to recognize the `vim` global
				globals = { 'vim' },
			},

			workspace = {
				-- Make the server aware of Neovim runtime files
				library = vim.api.nvim_get_runtime_file("", true),
				checkThirdParty = false
			},
		},
	},
}
