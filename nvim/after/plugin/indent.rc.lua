local status, indent = pcall(require, "indent_blankline")
if not status then
	return
end

vim.cmd([[highlight IndentBlanklineChar guifg=#073642 gui=nocombine]])

indent.setup({})
