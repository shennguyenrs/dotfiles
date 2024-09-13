vim.scriptencoding = "utf-8"
vim.opt.encoding = "utf-8"
vim.fileencoding = "utf-8"

vim.opt.ch = 2
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.showcmd = true
vim.opt.showmatch = true
vim.opt.incsearch = true
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.smartindent = true
vim.opt.autoindent = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.cmd('set expandtab')
vim.opt.backup = false
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.mouse:append('a')
vim.opt.path:append { '**' } -- Finding files - Search down into subfolders
vim.opt.wildignore:append { '*/node_modules/*' }

vim.opt.termguicolors = true
vim.opt.winblend = 0
vim.opt.wildoptions = 'pum'
vim.opt.pumblend = 5
vim.opt.background = 'dark'

vim.g.python3_host_prog = '/usr/bin/python3'
