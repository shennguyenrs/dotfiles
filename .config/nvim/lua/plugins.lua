local status_ok, packer = pcall(require, 'packer')
if not status_ok then
	print("Packer is not  intalled")
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
	use 'jiangmiao/auto-pairs'
	use 'AndrewRadev/tagalong.vim'

	-- UI
	use { 'dracula/vim', as = 'dracula' }
	use 'hoob3rt/lualine.nvim'
	use 'folke/tokyonight.nvim'
	use 'kyazdani42/nvim-web-devicons'
	use 'norcalli/nvim-colorizer.lua'
	use 'szw/vim-maximizer'

	-- Navigation
	use 'karb94/neoscroll.nvim'
	use 'nvim-lua/popup.nvim'
	use 'nvim-lua/plenary.nvim'
	use 'ibhagwan/fzf-lua'

	--Gits
	use 'lewis6991/gitsigns.nvim'
	use 'sindrets/diffview.nvim'

	-- Others
	use 'folke/trouble.nvim'
	use 'folke/todo-comments.nvim'
	use 'folke/which-key.nvim'
	use 'numToStr/Comment.nvim'
	use 'ellisonleao/glow.nvim'
	use 'ThePrimeagen/refactoring.nvim'
end)