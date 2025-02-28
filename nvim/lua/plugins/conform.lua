return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" }, -- lazy load plugin, either on save or explicitly running ConformInfo
	cmd = { "ConformInfo" },
	keys = {
		{
			"<leader>cf",
			function()
				require("conform").format({ async = true, lsp_format = "fallback" })
			end,
			desc = "Format buffer",
		},
	},
	opts = {
		notify_on_error = true,
		format_on_save = {
			-- These options will be passed to conform.format()
			timeout_ms = 500,
			lsp_format = "fallback", -- use lsp if no formatter is found
		},
		formatters_by_ft = {
			lua = { "stylua" },
		},
	},
}
