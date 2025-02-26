-- Set leader to <Space>
vim.g.mapleader = " "
vim.g.maplocalleader = " "

require("config.lazy")
require("config.keymaps")

-- display line numbers
vim.opt.number = true
vim.cmd.colorscheme("tokyonight")

-- Clears highlights on search when pressing <Esc> in normal
-- See `:help hlsearch`
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")
