-- luacheck: globals vim

return {
	"nvim-telescope/telescope.nvim",
	event = "VimEnter",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ -- If encountering errors, see telescope-fzf-native README for installation instructions
			"nvim-telescope/telescope-fzf-native.nvim",

			-- `build` is used to run some command when the plugin is installed/updated.
			-- This is only run then, not every time Neovim starts up.
			build = "make",

			-- `cond` is a condition used to determine whether this plugin should be
			-- installed and loaded.
			cond = function()
				return vim.fn.executable("make") == 1
			end,
		},
		{ "nvim-telescope/telescope-ui-select.nvim" },

		-- Useful for getting pretty icons, but requires a Nerd Font.
		{ "nvim-tree/nvim-web-devicons" },
	},
	keys = {
		{ "<leader>sf", ":Telescope find_files<CR>", desc = "Find files" },
		{ "<leader><leader>", ":Telescope find_files<CR>", desc = "Find files" },
		{ "<leader>/", ":Telescope live_grep<CR>", desc = "Live grep" },
		{
			"<leader>/",
			'"zy:Telescope live_grep default_text=<C-r>z<CR>',
			desc = "Live grep selection",
			mode = "v",
			remap = false,
		},
		{ "<leader>sg", ":Telescope live_grep<CR>", desc = "Grep files" },
		{ "<leader>sb", ":Telescope buffers<CR>", desc = "List buffers" },
		{ "<leader>bb", ":Telescope buffers<CR>", desc = "List buffers" },
		{ "<leader>gg", ":Telescope git_status<CR>", { desc = "Git status" } },
		{ "<leader>tt", ":Telescope colorscheme<CR>", { desc = "Theme" } },
	},
	opts = {
		defaults = {
			mappings = {
				i = {
					["<C-j>"] = "move_selection_next",
					["<C-k>"] = "move_selection_previous",
					["<esc>"] = "close",
				},
			},
		},
	},
}
