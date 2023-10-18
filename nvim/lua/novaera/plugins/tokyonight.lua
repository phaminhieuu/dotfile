return {
	"folke/tokyonight.nvim",
	lazy = false,
	priority = 1000,
	opts = {},
	config = function()
		local tokyonight = require("tokyonight")

		tokyonight.setup({
			style = "storm",
			transparent = true,
		})

		vim.cmd([[colorscheme tokyonight]])
	end,
}
