local status, mason = pcall(require, "mason")
if (not status) then return end
local status2, lspconfig = pcall(require, "mason-lspconfig")
if (not status2) then return end

mason.setup({})

lspconfig.setup {
	ensure_installed = {
		-- LSP
		"sumneko_lua",
		"bashls",
		"cssls",
		"gopls",
		"html",
		"tsserver",
		"pyright",
		"svelte",
		"tailwindcss",
		"yamlls",
		"emmet_ls",
		-- Linter
		"eslint_d",
		-- Formatter
		"prettierd",
		"gofumpt",
		"goimports",
		"luaformatter"
	},
}
