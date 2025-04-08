require("config.lazy")

vim.cmd.colorscheme 'kanagawa-wave'

vim.g.mapleader = ' '

vim.o.winborder = 'rounded'
vim.o.signcolumn = 'yes'
vim.o.number = true
vim.o.wrap = false

local map = function(keys, func, mode)
  mode = mode or 'n'
  vim.keymap.set(mode, keys, func, {})
end

map('<leader>f', '<cmd>Ex<CR>', 'n')
