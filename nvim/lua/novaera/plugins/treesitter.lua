return {
	{
		"nvim-treesitter/nvim-treesitter",
		dependencies = {
			"nvim-treesitter/nvim-treesitter-textobjects",
		},
		event = { "BufReadPre", "BufNewFile" },
		build = ":TSUpdate",

		config = function()
			require("nvim-treesitter.install").update({ with_sync = true })

			local ts = require("nvim-treesitter.configs")

			ts.setup({
				highlight = {
					enable = true,
				},
				indent = {
					enable = true,
				},
				autotag = {
					enable = true,
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
				configs = {
					context_commentstring = {
						enable = true,
						enable_autocmd = false,
					},
				},
			})
		end,
	},
}
