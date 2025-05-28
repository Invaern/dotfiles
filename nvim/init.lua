-- luacheck: globals vim

-- Set leader to <Space>
vim.g.mapleader = " "
vim.g.maplocalleader = " "

require("config.lazy")
require("config.keymaps")
require("config.opts")
require("config.commands")

vim.cmd.colorscheme("tokyonight-night")
