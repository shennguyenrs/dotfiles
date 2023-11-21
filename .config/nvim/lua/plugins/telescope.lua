return {
  'nvim-telescope/telescope.nvim',
  event = 'VeryLazy',
  version = false,
  dependencies = {
    'nvim-lua/plenary.nvim',
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      build = 'make',
      config = function()
        require("telescope").load_extension("fzf")
      end,
    },
    {
      "smartpde/telescope-recent-files",
      config = function()
        require("telescope").load_extension("recent_files")
      end
    }
  },
  opts = {
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
  },
  keys = {
    { "<leader>ff", function() require("telescope.builtin").find_files() end,   desc = '[F]ind [F]iles' },
    {
      "<leader>fr",
      "<cmd>lua require('telescope').extensions.recent_files.pick()<CR>",
      desc =
      '[F]ind [R]ecent files'
    },
    { "<leader>sg", function() require("telescope.builtin").live_grep() end,    desc = "[S]earch [G]rep" },
    { "<leader>gc", function() require("telescope.builtin").git_bcommits() end, desc = "[G]it [B]commits" },
  }
}
