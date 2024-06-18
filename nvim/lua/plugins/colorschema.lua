return {
	"craftzdog/solarized-osaka.nvim",
	lazy = true,
	priority = 1000,
	config = function()
		require("solarized-osaka").setup({
			transparent = true,
			on_highlights = function(hl, c)
				hl.TelescopeSelection = { bg = c.base03 }
			end,
		})
	end,
}
