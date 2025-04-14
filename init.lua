require("config.lazy")

vim.cmd.colorscheme "kanagawa-wave"

vim.g.mapleader = " "

vim.o.signcolumn = "yes"
vim.o.number = true
vim.o.wrap = false

local map = function(keys, func, mode)
  mode = mode or "n"
  vim.keymap.set(mode, keys, func, {})
end

local telescope = require("telescope")
map("<leader>d", telescope.extensions.file_browser.file_browser, "n")
local telescope_builtin = require("telescope.builtin")
map("<leader>f", telescope_builtin.find_files, "n")
map("<leader>b", telescope_builtin.buffers, "n")
map("<leader>s", telescope_builtin.live_grep, "n")
map("<leader>'", telescope_builtin.resume, "n")
map("<leader>j", telescope_builtin.jumplist, "n")
