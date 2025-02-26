-- Set leader to <Space>
vim.g.mapleader = " "
vim.g.maplocalleader = " "

require("config.lazy")
require("config.keymaps")

-- display line numbers
vim.opt.number = true
vim.cmd.colorscheme("tokyonight")

