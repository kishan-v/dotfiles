return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8", -- or branch = '0.1.x'
		dependencies = {
			"nvim-lua/plenary.nvim",
			{
				"nvim-telescope/telescope-fzf-native.nvim",
				build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release",
			},
		},
		keys = {
			{ "<leader>sf", "<cmd>Telescope git_files<cr>", desc = "Find Files (root dir)" },
			{ "<leader>gg", "<cmd>Telescope buffers<cr>", desc = "Find Buffers" },
			{ "<leader>sg", "<cmd>Telescope live_grep<cr>", desc = "Search Project" },
			{ "<leader>ss", "<cmd>Telescope lsp_document_symbols<cr>", desc = "Search Document Symbols" },
			{ "<leader>sw", "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", desc = "Search Workspace Symbols" },
		},
		opts = {
			extensions = {
				fzf = {
					fuzzy = true,
					override_generic_sorter = true,
					override_file_sorter = true,
					case_mode = "smart_case",
				},
			},
		},
	},
	{
		"nvim-telescope/telescope-fzf-native.nvim",
		build = "make",
		config = function()
			require("telescope").load_extension("fzf")
		end,
	},
}
