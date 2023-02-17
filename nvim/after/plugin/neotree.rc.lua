local status, neotree = pcall(require, "neo-tree")
if not status then
	return
end

neotree.setup({
	window = { width = 30 },
})

vim.cmd("NeoTreeClose")
