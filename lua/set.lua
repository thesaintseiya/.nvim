vim.opt.autoindent = true
vim.opt.backup = false
vim.opt.completeopt = 'menuone,noselect,preview'
vim.opt.cursorline = true
vim.opt.cursorlineopt = 'number'
vim.opt.expandtab = true
vim.opt.guicursor = 'n-v-c:block,i-v:blinkon400,i-ci:ver25-Cursor2/lCursor2,r-cr:hor20-Cursor'
vim.opt.hlsearch = false
vim.opt.ignorecase = true
vim.opt.incsearch = true
vim.opt.isfname:append '@-@'
vim.opt.mouse = 'a'
vim.opt.nu = true
vim.opt.rnu = true
vim.opt.scrolloff = 8
vim.opt.shiftwidth = 4
vim.opt.signcolumn = 'yes'
vim.opt.smartcase = true
vim.opt.smartindent = true
vim.opt.softtabstop = 4
vim.opt.swapfile = false
vim.opt.tabstop = 4
vim.opt.undodir = os.getenv 'HOME' .. '/.vim/undodir'
vim.opt.undofile = true
vim.opt.updatetime = 50
