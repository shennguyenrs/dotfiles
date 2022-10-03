local status_ok, lualine = pcall(require, "lualine")
if not status_ok then return end

lualine.setup {
  options = {
    theme = 'catppuccin',
    component_separators = '',
    section_separators = { left = '', right = '' }
  },
  sections = {
    lualine_b = { "branch", { "diff", colored = true } },
    lualine_c = { "filename", "filesize" },
    lualine_x = {
      { "diagnostics", sources = { "nvim_lsp" } }, 'encoding', 'fileformat',
      'filetype'
    }
  }
}
