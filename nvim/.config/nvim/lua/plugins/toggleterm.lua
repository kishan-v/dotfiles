return {
	"akinsho/toggleterm.nvim",
	version = "*",
	config = function()
		require("toggleterm").setup({
			start_in_insert = true,
			persist_mode = false,
			open_mapping = [[<c-t>]],
			direction = "vertical",
			size = function(term)
				return vim.o.columns * 0.3 -- 30% of the total window width
			end,
			shade_terminals = true,
		})
		-- Autocommand to update toggleterm size on window resize
		vim.api.nvim_create_autocmd("VimResized", {
			callback = function()
				local Terminal = require("toggleterm.terminal").Terminal
				for _, term in pairs(require("toggleterm.terminal").get_all()) do
					if term:is_open() then
						term:resize(vim.o.columns * 0.3)
					end
				end
			end,
		})
	end,
}
