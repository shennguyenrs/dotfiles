local status_ok, telescope = pcall(require, 'telescope')
if not status_ok then return end

telescope.setup {
  defaults = {
    prompt_prefix = "   ",
    layout_config = {
      horizontal = { preview_width = 0.6, results_width = 0.4 }
    }
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

-- Load extensions
telescope.load_extension('fzf')
telescope.load_extension('git_worktree')

-- Mappings
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = '[F]ind [F]iles' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = '[F]ind [G]rep' })
vim.keymap.set('n', '<leader>Gbc', builtin.git_bcommits,
  { desc = '[G]it [B]commits' })
vim.keymap.set('n', '<leader>wl',
  "<CMD>lua require('telescope').extensions.git_worktree.git_worktrees()<CR>",
  { desc = '[W]orktree [L]ist' })
