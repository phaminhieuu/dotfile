return {
  'MunifTanjim/prettier.nvim',
  config = function ()
    local prettier = require('prettier')

  prettier.setup({
	bin = "prettierd",
	filetypes = {
		"graphql",
		"css",
		"javascript",
		"javascriptreact",
		"typescript",
		"typescriptreact",
		"json",
		"scss",
		"less",
		"prisma",
		"svelte",
		"astro",
	},
})
  end
}
