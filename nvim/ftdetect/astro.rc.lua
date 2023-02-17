vim.filetype.add({
	extension = { astro = "astro" },
})

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, { pattern = { "*.astro" }, command = "setlocal spell" })
