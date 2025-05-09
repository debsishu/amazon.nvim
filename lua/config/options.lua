-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local opt = vim.opt

vim.o.colorcolumn = "120"
opt.clipboard = ""
vim.g.autoformat = false
vim.o.guifont = "GeistMono Nerd Font:h17"
vim.opt.linespace = 5
vim.opt.termguicolors = true
-- for dev desk setup
vim.o.lazyredraw = true
vim.o.ttyfast = true
