-- luacheck: globals vim

vim.keymap.set("n", "<Leader>mts", function()
	local current_file = vim.fn.expand("%")
	local current_line = vim.fn.line(".")
	local target = vim.fn.join({ current_file, current_line }, ":")
	vim.cmd("terminal mix test " .. target)
end, { desc = "Test under cursor", buffer = true })

vim.keymap.set("n", "<Leader>mtv", "<cmd>terminal mix test %<CR>", { desc = "Test file", buffer = true })
vim.keymap.set("n", "<Leader>mta", "<cmd>terminal mix test<CR>", { desc = "Test all", buffer = true })
