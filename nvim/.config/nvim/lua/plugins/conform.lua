return {
	{
		"stevearc/conform.nvim",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			local conform = require("conform")
			conform.setup({
				-- Configure which formatters to use per filetype.
				-- For Python, we're using black and ruff.
				formatters_by_ft = {
					python = { "black", "ruff" },
					lua = { "stylua" }, -- For Lua files, use stylua.
					go = { "goimports", "gofmt" },
					-- Use the "*" filetype to run formatters on all filetypes.
					["*"] = { "codespell" },
					-- Use the "_" filetype to run formatters on filetypes that don't
					-- have other formatters configured.
					["_"] = { "trim_whitespace" },
				},
				-- Optionally, enable format on save. Adjust the options as needed.
				format_on_save = {
					lsp_fallback = true,
					timeout = 1000,
				},
				-- Conform will notify you when a formatter errors
				notify_on_error = true,
				-- Conform will notify you when no formatters are available for the buffer
				notify_no_formatters = true,
			})
			-- Keymap for formatting the current buffer
			vim.keymap.set("n", "<leader>ff", function()
				conform.format({ async = true })
			end, { desc = "Format file" })
		end,
	},
	-- Other plugin specifications...
}
