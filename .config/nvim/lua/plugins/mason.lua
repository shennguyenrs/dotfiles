return {
    'williamboman/mason.nvim',
    dependencies = { 'williamboman/mason-lspconfig.nvim' },
    opts = {
        ensure_installed = {
            "lua_ls", "bashls", "cssls", "gopls", "html", "tsserver",
            "pyright", "svelte", "tailwindcss", "yamlls", "emmet_ls",
            "astro", "stylelint_lsp", "rust_analyzer", "sqlls", "dockerls",
            "docker_compose_language_service"
        }
    }
}
