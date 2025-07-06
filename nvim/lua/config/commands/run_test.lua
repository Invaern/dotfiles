-- luacheck: globals vim
--
-- Opens a new tab with single terminal buffer in which the given command is run.
-- Subsequent runs of the command kill the created tab & buffer (if one still exists),
-- so you don't end up with multiple test result buffers.
--
-- Example use:
-- vim.keymap.set("n", "<Leader>mta", "<cmd>RunTest mix test<CR>", { desc = "Test all", buffer = true })

local TEST_RESULTS_VAR = "test_results"

local function find_test_tab()
	local tabpages = vim.api.nvim_list_tabpages()

	local test_tab_id = nil

	for _, tab_id in ipairs(tabpages) do
		if vim.t[tab_id][TEST_RESULTS_VAR] then
			test_tab_id = tab_id
			break
		end
	end

	return test_tab_id
end

local function find_test_buffer()
	local b = nil
	for _, b_id in ipairs(vim.api.nvim_list_bufs()) do
		if vim.b[b_id][TEST_RESULTS_VAR] then
			b = b_id
			break
		end
	end
	return b
end

local function create_test_tab()
	vim.cmd("tab sb")
	vim.t[TEST_RESULTS_VAR] = true
end

local function delete_test_tab()
	local t = find_test_tab()
	if t then
		local t_nr = vim.api.nvim_tabpage_get_number(t)
		vim.cmd("tabclose " .. t_nr)
	end
	local b = find_test_buffer()
	if b then
		vim.api.nvim_buf_delete(b, {})
	end
end

local function switch_to_test_tab()
	delete_test_tab()
	create_test_tab()
end

vim.api.nvim_create_user_command("RunTest", function(opts)
	switch_to_test_tab()
	vim.cmd("term " .. opts.fargs[1])
	vim.b[TEST_RESULTS_VAR] = true
end, { nargs = 1 })
