require('config.lazy')

vim.cmd.colorscheme 'kanagawa-wave'

vim.g.mapleader = ' '

vim.o.signcolumn = 'yes'
vim.o.number = true
vim.o.wrap = false

local map = function(keys, func, mode)
  mode = mode or 'n'
  vim.keymap.set(mode, keys, func, {})
end

local telescope = require('telescope')
map('<leader>f', telescope.extensions.file_browser.file_browser, 'n')
