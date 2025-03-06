-- luacheck: globals vim

-- Options go here

-- display line numbers
vim.opt.number = true
-- hide mode, it will be in status line anyway
vim.opt.showmode = false
-- changes tab to spaces on insert
vim.opt.expandtab = true
-- smart ident on new lines
vim.opt.smartindent = true
-- number of spaces per tab
vim.opt.tabstop = 2
-- numver of spaces for each indent
vim.opt.shiftwidth = 2

-- Sync clipboard between OS and Neovim.
-- Schedule the setting after `UiEnter` because it can increase startup-time.
-- Remove this option if you want your OS clipboard to remain independent.
-- See `:help 'clipboard'`
vim.schedule(function()
	vim.opt.clipboard = "unnamedplus"
end)

-- Turn off unnecessary providers (they show as warnings in :checkhealth)
-- These providers are used for plugins written in their respective languages
-- See `:help providers` for details
vim.g.loaded_node_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_python_provider = 0
vim.g.loaded_ruby_provider = 0
