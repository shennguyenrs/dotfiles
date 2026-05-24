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
		local keymap = vim.keymap
		local opts = { noremap = true, silent = true }

		keymap.set("n", "<space>e", vim.diagnostic.open_float, opts)
		keymap.set("n", "<space>q", vim.diagnostic.setloclist, opts)

		local common_attach = function(client, bufnr)
			-- Attach lsp_signature
			require("lsp_signature").on_attach()

			-- Custom Leader Mappings (Defaults like K, gd, grr, grn, gra, [d, ]d are kept as built-in)
			local bufopts = { noremap = true, silent = true, buffer = bufnr }
			local lspbuf = vim.lsp.buf

			keymap.set("n", "gD", lspbuf.declaration, bufopts)
			keymap.set("n", "gi", lspbuf.implementation, bufopts)
			keymap.set("n", "<space>wa", lspbuf.add_workspace_folder, bufopts)
			keymap.set("n", "<space>wr", lspbuf.remove_workspace_folder, bufopts)
			keymap.set("n", "<space>wl", function()
				print(vim.inspect(lspbuf.list_workspace_folders()))
			end, bufopts)
			keymap.set("n", "<space>D", lspbuf.type_definition, bufopts)
			keymap.set("n", "<space>rn", lspbuf.rename, bufopts)
			keymap.set({ "n", "x" }, "<space>ca", lspbuf.code_action, bufopts)
			keymap.set("n", "<space>f", function()
				lspbuf.format()
			end)
		end

		-- Diagnostic sign
		vim.diagnostic.config({
			signs = {
				text = {
					[vim.diagnostic.severity.ERROR] = "E",
					[vim.diagnostic.severity.WARN] = "W",
					[vim.diagnostic.severity.HINT] = "H",
					[vim.diagnostic.severity.INFO] = "I",
				},
			},
		})

		-- List of servers to setup with common options
		local servers = {
			"astro",
			"bashls",
			"cssls",
			"docker_compose_language_service",
			"dockerls",
			"emmet_ls",
			"eslint",
			"gopls",
			"html",
			"lua_ls",
			"pyright",
			"rust_analyzer",
			"sqlls",
			"stylelint_lsp",
			"svelte",
			"tailwindcss",
			"ts_ls",
			"yamlls",
		}

		vim.lsp.config("*", {
			on_attach = common_attach,
			capabilities = require("blink.cmp").get_lsp_capabilities(),
		})

		for _, server_name in ipairs(servers) do
			vim.lsp.enable(server_name)
		end
	end,
}
