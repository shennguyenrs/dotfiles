local status_ok, packer = pcall(require, 'packer')
if not status_ok then
  print('Packer is not intalled')
  return
end

packer.startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Nvim LSP & Treesitter & Formatter
  use 'neovim/nvim-lspconfig'
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use 'ray-x/lsp_signature.nvim'
  use 'williamboman/mason.nvim'
  use 'williamboman/mason-lspconfig.nvim'
  use 'mfussenegger/nvim-dap'
  use 'jose-elias-alvarez/null-ls.nvim'

  -- Autocomplete
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/nvim-cmp'

  -- Snippets
  use 'SirVer/ultisnips'
  use 'quangnguyen30192/cmp-nvim-ultisnips'
  use 'rafamadriz/friendly-snippets'
  use 'L3MON4D3/LuaSnip'
  use 'saadparwaiz1/cmp_luasnip'
  use 'mlaursen/vim-react-snippets'
  use 'andymass/vim-matchup'
  use 'AndrewRadev/tagalong.vim'
  use 'windwp/nvim-autopairs'

  -- UI
  use { 'dracula/vim', as = 'dracula' }
  use 'hoob3rt/lualine.nvim'
  use 'folke/tokyonight.nvim'
  use 'kyazdani42/nvim-web-devicons'
  use 'norcalli/nvim-colorizer.lua'
  use 'szw/vim-maximizer'
  use { 'catppuccin/nvim', as = 'catppuccin' }
  use 'lukas-reineke/indent-blankline.nvim'
  use({ 'rose-pine/neovim', as = 'rose-pine' })

  -- UI support
  use 'nvim-lua/popup.nvim'
  use 'nvim-lua/plenary.nvim'
  use 'nvim-telescope/telescope.nvim'
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

  -- Gits
  use 'lewis6991/gitsigns.nvim'
  use 'sindrets/diffview.nvim'
  use 'tpope/vim-fugitive'
  use 'ThePrimeagen/git-worktree.nvim'

  -- Flutter
  use { 'akinsho/flutter-tools.nvim', requires = { 'stevearc/dressing.nvim' } }

  -- AI
  use({ 'jackMort/ChatGPT.nvim', requires = { 'MunifTanjim/nui.nvim' } })
  use 'Exafunction/codeium.vim'

  -- Others
  use 'folke/trouble.nvim'
  use 'folke/todo-comments.nvim'
  use 'folke/which-key.nvim'
  use 'numToStr/Comment.nvim'
  use 'ellisonleao/glow.nvim'
  use 'ThePrimeagen/refactoring.nvim'
  use 'kylechui/nvim-surround'
end)
