-- Set leader to <Space>
vim.g.mapleader = " "
vim.g.maplocalleader = " "

require("config.lazy")
require("config.keymaps")

-- display line numbers
vim.opt.number = true

-- changes tab to spaces on insert
vim.opt.expandtab = true
-- smart ident on new lines
vim.opt.smartindent = true
-- number of spaces per tab
vim.opt.tabstop = 2
-- numver of spaces for each indent
vim.opt.shiftwidth = 2
vim.cmd.colorscheme("tokyonight")

