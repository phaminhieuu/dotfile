local status, tokyonight = pcall(require, "tokyonight")
if not status then
	return
end

tokyonight.setup({ transparent = true })

vim.cmd([[colorscheme tokyonight]])
