-- Global Settings
vim.g.mapleader = ' ' -- Setting the leader key
vim.g.maplocalleader = ' '

-- Terminal and Title Settings
vim.opt.title = true
vim.opt.titlestring = '%t'

-- Indentation and Formatting Settings
vim.opt.autoindent = true
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.smarttab = true
vim.opt.tabstop = 2

-- Font
vim.g.have_nerd_font = true

-- Display Settings
vim.opt.cursorline = true
vim.opt.expandtab = true
vim.opt.showcmd = true
vim.opt.timeoutlen = 300
vim.opt.wildmenu = true
vim.opt.wrap = false
vim.opt.completeopt = 'menu,menuone,noselect'
vim.opt.updatetime = 50
vim.opt.scrolloff = 5
vim.opt.signcolumn = 'yes'

-- List and Match Settings
vim.opt.list = true
vim.opt.listchars = { tab = '  ', leadmultispace = '│   ' }
vim.opt.showmatch = true

-- GUI and Encoding Settings
vim.opt.termguicolors = true
vim.opt.clipboard = 'unnamedplus'
vim.opt.encoding = 'utf-8'

-- Search and Case Settings
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.incsearch = true
vim.opt.smartcase = true
vim.opt.smartindent = true

-- Line Number Settings
vim.opt.number = true

-- For statusline plugin
vim.o.showmode = false
