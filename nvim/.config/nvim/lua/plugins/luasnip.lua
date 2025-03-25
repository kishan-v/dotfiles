return {
	{
		"L3MON4D3/LuaSnip",
		event = "VeryLazy",
		config = function()
			require("luasnip.loaders.from_lua").load({ paths = "./snippets" })
		end,
	},
}
