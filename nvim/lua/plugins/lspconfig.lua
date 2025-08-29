-- luacheck: globals vim

return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			-- Installs and manages LSP, linters etc
			{ "williamboman/mason.nvim", opts = {} },
			-- Bridge between mason & vim lsp config
			"williamboman/mason-lspconfig.nvim",
			-- Allows extra capabilities provided by nvim-cmp
			"hrsh7th/cmp-nvim-lsp",
		},
		config = function()
			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("kickstart-lsp-attach", { clear = true }),
				callback = function(event)
					local map = function(keys, func, desc, mode)
						mode = mode or "n"
						vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
					end

					map("gd", require("telescope.builtin").lsp_definitions, "Goto definition")
					map("<leader>cd", require("telescope.builtin").lsp_definitions, "Goto definition")
					map("<leader>cD", require("telescope.builtin").lsp_definitions, "Goto declaration")
					map("<leader>cr", require("telescope.builtin").lsp_references, "Goto references")
					map("<leader>cs", require("telescope.builtin").lsp_document_symbols, "Document symbols")
					map("<leader>cS", require("telescope.builtin").lsp_dynamic_workspace_symbols, "Workspace symbols")
					map("<leader>cx", function()
						require("telescope.builtin").diagnostics({ bufnr = 0 })
					end, "Document diagnostics")
					map("<leader>cX", require("telescope.builtin").diagnostics, "Workspace diagnostics")
					map("<leader>ca", vim.lsp.buf.code_action, "Code Action", { "n", "x" })

					local client = assert(vim.lsp.get_client_by_id(event.data.client_id))
					-- The following code creates a keymap to toggle inlay hints in your
					-- code, if the language server you are using supports them
					--
					-- This may be unwanted, since they displace some of your code
					if client:supports_method("textDocument/inlayHint", event.buf) then
						map("<leader>ch", function()
							vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = event.buf }))
						end, "Toggle inlay hints")
					end
				end,
			})

			-- Diagnostic Config
			-- See :help vim.diagnostic.Opts
			vim.diagnostic.config({
				severity_sort = true,
				float = { border = "rounded", source = "if_many" },
				underline = { severity = vim.diagnostic.severity.ERROR },
				signs = {
					text = {
						[vim.diagnostic.severity.ERROR] = "󰅚 ",
						[vim.diagnostic.severity.WARN] = "󰀪 ",
						[vim.diagnostic.severity.INFO] = "󰋽 ",
						[vim.diagnostic.severity.HINT] = "󰌶 ",
					},
				},
				virtual_text = {
					source = "if_many",
					spacing = 2,
					format = function(diagnostic)
						local diagnostic_message = {
							[vim.diagnostic.severity.ERROR] = diagnostic.message,
							[vim.diagnostic.severity.WARN] = diagnostic.message,
							[vim.diagnostic.severity.INFO] = diagnostic.message,
							[vim.diagnostic.severity.HINT] = diagnostic.message,
						}
						return diagnostic_message[diagnostic.severity]
					end,
				},
			})

			-- LSP servers and clients are able to communicate to each other what features they support.
			-- By default, Neovim doesn't support everything that is in the LSP specification.
			-- When you add nvim-cmp, luasnip, etc. Neovim now has *more* capabilities.
			-- So, we create new capabilities with nvim cmp, and then broadcast that to the servers.
			local capabilities = vim.lsp.protocol.make_client_capabilities()
			capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

			-- Default LSP configuration.
			--
			-- Each LSP can provide it's own config in lua/<server_name>.lua file
			-- The <server_name> **should be** a name matching config from `nvim-lspconfig`,
			-- otherwise defaults won't be merged in.
			-- See `https://github.com/neovim/nvim-lspconfig/tree/master/lua/lspconfig/configs` for list of available configs
			-- See `:h lsp-config` for how configuration is resolved
			vim.lsp.config("*", {
				capabilities = capabilities,
				root_markers = { ".git" },
			})
			-- To check the current status of installed tools and/or manually install
			-- other tools, you can run
			--    :Mason
			--
			-- You can press `g?` for help in this menu.
			--
			-- `mason` had to be setup earlier: to configure its options see the
			-- `dependencies` table for `nvim-lspconfig` above.
			--
			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls", "texlab", "elixirls" },
			})

			-- rust-analyzer comes from rustup and not Mason, as such we need to enable it manually
			vim.lsp.enable("rust_analyzer")
		end,
	},
}
