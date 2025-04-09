-- luacheck: globals vim

local function expand_tabs()
	local ret = {}
	for _, tab in ipairs(vim.api.nvim_list_tabpages()) do
		local tab_nr = vim.api.nvim_tabpage_get_number(tab)
		ret[#ret + 1] = {
			tostring(tab_nr),
			function()
				vim.api.nvim_set_current_tabpage(tab)
			end,
			desc = "Go to tab " .. tab_nr,
		}
	end

	if #ret > 1 then
		return ret
	else
		return {}
	end
end

-- Shows available keymaps
return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	opts = {
		preset = "helix",
	},
	keys = function()
		local wk = require("which-key")
		wk.add({
			-- groups
			{ "<leader>s", group = "search" },
			{ "<leader>b", group = "buffers", name = "buffers" },
			{ "<leader>o", group = "open", icon = "" },
			{ "<leader>w", group = "windows" },
			{ "<leader>g", group = "git" },
			{ "<leader>c", group = "code" },
			{ "<leader>t", group = "toggle" },
			{ "<leader>m", group = "localleader" },
			{ "<leader>mt", group = "test" },
			-- set/override icons for existing mappings
			{ "<leader>op", icon = "" },
			{ "<leader>wd", icon = "" },
			{ "<leader>wh", icon = "" },
			{ "<leader>wl", icon = "" },
			{ "<leader>wj", icon = "" },
			{ "<leader>wk", icon = "" },
			{ "<leader>ws", icon = "" },
			{ "<leader>wv", icon = "" },
			{ "<leader>bd", icon = "󰆴" },
			{
				"<leader><TAB>",
				group = "tabs",
				expand = function()
					return expand_tabs()
				end,
			},
		})
		return {}
	end,
}
