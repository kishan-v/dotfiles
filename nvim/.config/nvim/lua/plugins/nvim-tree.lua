return {
	"nvim-tree/nvim-tree.lua",
	version = "*",
	lazy = false,
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		vim.api.nvim_set_keymap("n", "<C-x>", ":NvimTreeToggle<CR>", { noremap = true, silent = true })
		require("nvim-tree").setup({})
	end,
}
