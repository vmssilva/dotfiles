local opt = vim.opt
local cmd = vim.cmd

opt.number = true
opt.relativenumber = false
opt.wrap = true
opt.expandtab = true
opt.shiftwidth = 2
opt.tabstop = 2
opt.termguicolors = true

--" Set clipboard to system clipboard (Linux/Windows/macOS)
cmd [[ set clipboard=unnamedplus ]]

--" Enable mouse support (optional)
cmd [[ set mouse=a ]]

--" Enable search in the current file
cmd [[ set incsearch ]]

-- Enable ignore case
cmd [[ set ignorecase ]]

--" Enable auto-completion (optional)
cmd [[ set completeopt=menuone,noinsert,noselect ]]
