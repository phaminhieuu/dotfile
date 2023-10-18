---@diagnostic disable: missing-fields
return {
	{
		"nvim-treesitter/nvim-treesitter",
		event = { "BufReadPre", "BufNewFile" },
		build = ":TSUpdate",
		dependencies = {
			"nvim-treesitter/nvim-treesitter-textobjects",
		},

		config = function()
			require("nvim-treesitter.install").update({ with_sync = true })
			local ts = require("nvim-treesitter.configs")

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

			local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
			parser_config.tsx.filetype_to_parsername =
				{ "javascript", "typescript.tsx", "javascriptreact", "typescript.ts", "typescript" }
		end,
	},
}
