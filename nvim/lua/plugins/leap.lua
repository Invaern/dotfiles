return {
	"ggandor/leap.nvim",
	lazy = false,
	config = function()
		require("leap").set_default_mappings()
	end,
}
