-- luacheck: globals vim

return {
	"lewis6991/gitsigns.nvim",
	opts = {
		attach_to_untracked = true,
		on_attach = function(bufnr)
			local gitsigns = require("gitsigns")
			local function map(mode, l, r, opts)
				opts = opts or {}
				opts.buffer = bufnr
				vim.keymap.set(mode, l, r, opts)
			end

			-- Navigation
			map("n", "<leader>g]", function()
				gitsigns.nav_hunk("next")
			end, { desc = "Next hunk" })

			map("n", "<leader>g[", function()
				gitsigns.nav_hunk("prev")
			end, { desc = "Previous hunk" })

			-- Actions
			map("n", "<leader>gs", gitsigns.stage_hunk, { desc = "Stage hunk" })
			map("n", "<leader>gS", gitsigns.stage_buffer, { desc = "Stage buffer" })
			map("n", "<leader>gr", gitsigns.reset_hunk, { desc = "Reset hunk" })
			map("n", "<leader>gR", gitsigns.reset_buffer, { desc = "Reset buffer" })
			map("n", "<leader>gb", gitsigns.toggle_current_line_blame, { desc = "Toggle line blame" })
			map("n", "<leader>gB", gitsigns.blame, { desc = "File blame" })
			map("n", "<leader>gd", gitsigns.diffthis, { desc = "File diff" })
			map("n", "<leader>gp", gitsigns.preview_hunk, { desc = "Preview_hunk" })
		end,
	},
}
