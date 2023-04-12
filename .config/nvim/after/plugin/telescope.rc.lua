local status_ok, telescope = pcall(require, 'telescope')
if not status_ok then return end

telescope.setup {
  defaults = {
    prompt_prefix = "   ",
    layout_config = {
      horizontal = { preview_width = 0.6, results_width = 0.4 }
    },
  },
  extensions = {
    fzf = {
      fuzzy = true,
      override_generic_sorter = true,
      override_file_sorter = true,
      case_mode = "smart_case"
    }
  }
}

telescope.load_extension('fzf')

-- Mappings
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
