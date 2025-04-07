return {
	{
		"akinsho/bufferline.nvim",
		version = "*",
		dependencies = "nvim-tree/nvim-web-devicons",
		opts = {
			options = {
				-- TODO: Add padding to account for nvim-tree file explorer
				diagnostic = "nvim-lsp", -- FIXME: Add this to the correct place
				hover = {
					enabled = true,
					delay = 200,
					reveal = { "close" },
				},
			},
		},
	},
}
