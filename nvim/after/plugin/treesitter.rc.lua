local status, ts = pcall(require, "nvim-treesitter.configs")
if not status then
	return
end

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
		"fish",
		"php",
		"json",
		"yaml",
		"swift",
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
parser_config.astro.filetype_to_parsername = { ".astro" }
