-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim

return {
	"nvim-neo-tree/neo-tree.nvim",
	version = "*",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
		"MunifTanjim/nui.nvim",
	},
	cmd = "Neotree",
	keys = {
		{ "<leader>op", ":Neotree reveal toggle<CR>", desc = "NeoTree reveal", silent = true },
	},
	opts = {
		window = {
			mappings = {
				["<tab>"] = "toggle_node",
			},
		},
	},
}
