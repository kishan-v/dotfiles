return {
	{
		"catppuccin/nvim",
		config = function()
			require("catppuccin").setup({
				--flavour = "macchiato", -- choose from "latte", "frappe", "macchiato", "mocha"
				flavour = "mocha", -- choose from "latte", "frappe", "macchiato", "mocha"
				-- other setup options...
				dim_inactive = {
					enabled = true, -- dims the background color of inactive window
					shade = "dark",
					percentage = 0.15, -- percentage of the shade to apply to the inactive window
				},
				default_integrations = true,
				integrations = {
					--native_lsp = {
					--	enabled = true,
					--	inlay_hints = {
					--		background = true,
					--	},
					--},
					cmp = true,
					gitsigns = true,
					nvimtree = true,
					treesitter = true,
					notify = true,
					-- mini = {
					-- enabled = true,
					--}
				},
				--highlight_overrides = {
				--	all = function(colors)
				--		return {
				--			LspInlayHint = {
				--				fg = colors.overlay1,
				--				bg = "#00000040", -- black w/ 25% opacity
				--			},
				--		}
				--	end,
				--},
			})
			vim.cmd.colorscheme("catppuccin")
		end,
		name = "catppuccin",
	},
}
