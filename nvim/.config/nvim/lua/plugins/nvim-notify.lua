return {
	{
		"rcarriga/nvim-notify",
		config = function()
			local notify = require("notify")
			notify.setup({
				-- Customize nvim-notify settings here
				-- For example:
				-- stages = "fade_in_slide_out",
				-- timeout = 3000,
				-- background_colour = "#000000",
			})
			vim.notify = notify
		end,
	},
}
