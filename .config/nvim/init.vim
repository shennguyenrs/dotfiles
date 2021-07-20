" Run plugins
runtime ./plug.vim

" Set custom path for lua execute
let g:lua_path = '~/.config/nvim/lua'

" Basics
syntax on
set encoding=UTF-8
set mouse=a

set cmdheight=2
set number
set relativenumber
set cursorline
set showcmd
set showmatch

set incsearch
set hlsearch
set ignorecase
set smartcase

set smartindent
set autoindent

set tabstop=2
set shiftwidth=2

set shortmess+=c

" Theme
set t_Co=256
set background=dark
set termguicolors

" Enable Tokyo night theme
exec 'luafile' expand(g:lua_path . '/plugins/tokyonight.lua')

hi Comment gui=italic

" Turn off search highlighting permanently
noremap <esc><esc> :noh<return>

set splitbelow
set splitright

" Key for split Vim
nmap <A-h> <C-w>h
nmap <A-j> <C-w>j
nmap <A-k> <C-w>k
nmap <A-l> <C-w>l

" Run plugins config
exec 'luafile' expand(g:lua_path . "/plugins/lualine.lua")
exec 'luafile' expand(g:lua_path . "/plugins/emmet.lua")
exec 'luafile' expand(g:lua_path . "/plugins/nvim-tree.lua")
exec 'luafile' expand(g:lua_path . "/plugins/nvim-web-devicons.lua")
exec 'luafile' expand(g:lua_path . "/plugins/telescope.lua")
exec 'luafile' expand(g:lua_path . "/plugins/treesitter.lua")
exec 'luafile' expand(g:lua_path . "/plugins/which-key.lua")
exec 'luafile' expand(g:lua_path . "/plugins/trouble.lua")
exec 'luafile' expand(g:lua_path . "/plugins/vim-matchup.lua")
exec 'luafile' expand(g:lua_path . "/plugins/nvim-lspconfig.lua")
exec 'luafile' expand(g:lua_path . "/plugins/compe.lua")

" Create cache Eslint_d
augroup EslintCache
	autocmd BufWritePost *.js silent !eslint_d --cache "*.js" <afile>
	autocmd BufWritePost *.jsx silent !eslint_d --cache "*.jsx" <afile>
	autocmd BufWritePost *.ts silent !eslint_d --cache "*.ts" <afile>
	autocmd BufWritePost *.tsx silent !eslint_d --cache "*.tsx" <afile>
augroup END
