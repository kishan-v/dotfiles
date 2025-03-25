return {
	--	{ "github/copilot.vim" },
	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		event = "InsertEnter", -- initialise on entering Insert mode
		opts = {
			panel = {
				--enabled = true,
				enabled = false, -- disable as using copilot-cmp
				auto_refresh = false,
				keymap = {
					jump_prev = "[[",
					jump_next = "]]",
					accept = "<CR>",
					refresh = "gr",
					open = "<M-CR>",
				},
				layout = {
					position = "bottom",
					ratio = 0.4,
				},
			},
			suggestion = {
				--enabled = true,
				enabled = false, -- disable as using copilot-cmp
				auto_trigger = true,
				hide_during_completion = true,
				debounce = 75,
				keymap = {
					accept = "<M-l>",
					accept_word = false,
					accept_line = false,
					next = "<M-]>",
					prev = "<M-[>",
					dismiss = "<C-]>",
				},
			},
			filetypes = {
				yaml = true,
				markdown = false,
				help = false,
				gitcommit = false,
				gitrebase = false,
				hgcommit = false,
				svn = false,
				cvs = false,
				lua = true,
				python = true,
				["."] = true, -- all filetypes
			},
			logger = {
				file = vim.fn.stdpath("log") .. "/copilot-lua.log",
				file_log_level = vim.log.levels.OFF,
				print_log_level = vim.log.levels.WARN,
				trace_lsp = "off",
				trace_lsp_progress = false,
				log_lsp_messages = false,
			},
			copilot_node_command = "node",
			workspace_folders = {},
			copilot_model = "",
			root_dir = function()
				return vim.fs.dirname(vim.fs.find(".git", { upward = true })[1])
			end,
			should_attach = nil,
			server_opts_overrides = {},
		},
	},
	{
		"AndreM222/copilot-lualine",
	},
	{
		"zbirenbaum/copilot-cmp",
		opts = {},
	},
}
