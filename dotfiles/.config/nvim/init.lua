vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.autoindent = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.incsearch = true
vim.opt.hlsearch = true
vim.opt.scrolloff = 5
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.hidden = true
vim.opt.undofile = true
vim.opt.termguicolors = true
vim.opt.mouse = ''

vim.cmd('filetype plugin indent on')
vim.cmd('syntax enable')
vim.cmd('nnoremap <silent> <Esc> :nohlsearch<CR>')
