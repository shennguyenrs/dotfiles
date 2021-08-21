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
Plug 'SirVer/ultisnips'
Plug 'mlaursen/vim-react-snippets'
Plug 'honza/vim-snippets'

" UI
Plug 'dracula/vim', {'name': 'dracula'}
Plug 'hoob3rt/lualine.nvim'
Plug 'folke/tokyonight.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'ryanoasis/vim-devicons'

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

" Nvim Colorizer
Plug 'norcalli/nvim-colorizer.lua'

" Vim Maximizer
Plug 'szw/vim-maximizer'

" Telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

" Startify
Plug 'mhinz/vim-startify'

" Git Sign
Plug 'lewis6991/gitsigns.nvim'

call plug#end()
