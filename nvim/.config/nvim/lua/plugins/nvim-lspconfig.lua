return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
		},
		config = function()
			vim.notify = require("notify")
			local capabilities = vim.lsp.protocol.make_client_capabilities()
			capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

			require("mason").setup()
			local mason_lspconfig = require("mason-lspconfig")
			mason_lspconfig.setup({
				ensure_installed = { "basedpyright", "gopls" },
			})
			lspconfig = require("lspconfig")

			lspconfig.basedpyright.setup({
				capabilities = capabilities,
				on_attach = function(client, bufnr)
					-- Optional: enable signature help via lsp_signature
					require("lsp_signature").on_attach({
						bind = true,
						hint_enable = true, -- show parameter name hints in function calls
					}, bufnr)

					if client.server_capabilities.inlayHintProvider then
						vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
					else
						vim.notify(
							"Failed to enable inlay hints: inlay hints not supported by server",
							vim.log.levels.ERROR
						)
					end
				end,
				settings = {
					basedpyright = {
						analysis = {
							autoSearchPaths = true,
							diagnosticMode = "workspace",
							useLibraryCodeForTypes = true,
							autoImportCompletions = true,
							typeCheckingMode = "strict",
							inlayHints = {
								variableTypes = true,
								callArgumentNames = true,
								functionReturnTypes = true,
								genericTypes = false,
							},
						},
					},
				},
			})

			-- Setup for Go using gopls
			lspconfig.gopls.setup({
				capabilities = capabilities,
				on_attach = function(client, bufnr)
					require("lsp_signature").on_attach({
						bind = true,
						hint_enable = true, -- show signature hints if supported
					}, bufnr)
					if client.server_capabilities.inlayHintProvider then
						vim.lsp.inlay_hint(bufnr, true)
					else
						vim.notify(
							"Failed to enable inlay hints: inlay hints not supported by server",
							vim.log.levels.ERROR
						)
					end
				end,
				settings = {
					gopls = {
						hints = {
							assignVariableTypes = true,
							compositeLiteralFields = true,
							compositeLiteralTypes = true,
							functionTypeParameters = true,
							parameterNames = true,
							rangeVariableTypes = true,
						},
					},
				},
			})

			-- Setup for Swift using sourcekit-lsp
			lspconfig.sourcekit.setup({
				cmd = { "sourcekit-lsp" },
				filetypes = { "swift" },
				root_dir = function(fname)
					return lspconfig.util.root_pattern("Package.swift", ".git")(fname) or vim.fn.getcwd()
				end,
				on_attach = function(client, bufnr)
					vim.defer_fn(function()
						vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
					end, 50) -- HACK: inlay hint initialisation only works after delay
				end,
			})
		end,
	},
}
