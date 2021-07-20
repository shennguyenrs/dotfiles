call plug#begin('~/.config/nvim/plugged')

" Autocompletion & highlighting
Plug 'jiangmiao/auto-pairs'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'andymass/vim-matchup'
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-compe'
Plug 'ray-x/lsp_signature.nvim'

" Snippet
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'
Plug 'rafamadriz/friendly-snippets'

" UI
Plug 'dracula/vim', {'name': 'dracula'}
Plug 'hoob3rt/lualine.nvim'
Plug 'folke/tokyonight.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'lukas-reineke/indent-blankline.nvim'

" TS Utils
Plug 'jose-elias-alvarez/nvim-lsp-ts-utils'
Plug 'jose-elias-alvarez/null-ls.nvim'

"Trouble
Plug 'folke/trouble.nvim'

" Which Key
Plug 'folke/which-key.nvim'

" Emmet
Plug 'mattn/emmet-vim'

" Kommentary
Plug 'b3nj5m1n/kommentary'

" Vim CSS Color
Plug 'ap/vim-css-color'

" Vim Maximizer
Plug 'szw/vim-maximizer'

" Telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

" Startify
Plug 'mhinz/vim-startify'

" Spelunker
Plug 'kamykn/spelunker.vim'

call plug#end()
