return {
    'hoob3rt/lualine.nvim',
    opts = {
        options = {
            theme = 'rose-pine',
            -- theme = 'catppuccin',
            component_separators = '',
            section_separators = { left = '', right = '' }
        },
        sections = {
            lualine_b = { "branch", { "diff", colored = true } },
            lualine_c = { "filename", "filesize" },
            lualine_x = {
                { "diagnostics", sources = { "nvim_lsp" } }, 'encoding',
                'fileformat', 'filetype'
            }
        }
    }
}
