return {
	{
		"nvim-treesitter/nvim-treesitter",
		event = { "BufReadPre", "BufNewFile" },
		build = ":TSUpdate",

		config = function()
			require("nvim-treesitter.install").update({ with_sync = true })

			local ts = require("nvim-treesitter.configs")

			---@diagnostic disable-next-line: missing-fields
			ts.setup({
				highlight = {
					enable = true,
					disable = {},
				},
				indent = {
					enable = true,
					disable = {},
				},
				ensure_installed = {
					"tsx",
					"toml",
					"json",
					"yaml",
					"css",
					"html",
					"lua",
					"glsl",
					"prisma",
					"typescript",
					"javascript",
					"astro",
					"markdown",
				},
				autotag = {
					enable = true,
				},
				configs = {
					context_commentstring = {
						enable = true,
						commentary_integration = {
							Commentary = "g/",
						},
					},
				},
			})
		end,
	},
}
