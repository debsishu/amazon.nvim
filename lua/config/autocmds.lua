-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

vim.cmd([[
  autocmd FileType java setlocal shiftwidth=4
  autocmd FileType java setlocal tabstop=4
  autocmd FileType java setlocal expandtab
  autocmd FileType brazil-config setlocal shiftwidth=4
  autocmd FileType brazil-config setlocal tabstop=4
  autocmd FileType brazil-config setlocal expandtab
  autocmd FileType xml setlocal shiftwidth=4
  autocmd FileType xml setlocal tabstop=4
  autocmd FileType xml setlocal expandtab
  autocmd FileType kt setlocal shiftwidth=4
  autocmd FileType kt setlocal tabstop=4
  autocmd FileType kt setlocal expandtab
]])

-- Turn off auto formatting for java, kotlin, brazil-config and xml
vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "java", "xml", "brazil-config", "kt" },
  callback = function()
    vim.b.autoformat = false
  end,
})
