-- Includes
require('lotharkatt.core')
require('lotharkatt.core.lazy')

-- Enable line numbers
vim.opt.number = true

-- Optionally, enable relative line numbers
-- vim.opt.relativenumber = true


-- Disable backup and swap files
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.swapfile = false

-- Automatically change the current working directory to the file's directory
vim.opt.autochdir = true

-- Searching
vim.opt.incsearch = true
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Tabs and spaces
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.tabstop = 4
vim.opt.shiftround = true

vim.opt.modeline = true
vim.opt.modelines = 5

-- clipboard compatible with system
vim.opt.clipboard:append("unnamedplus")

