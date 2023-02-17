local status, neotree = pcall(require, "neo-tree")
if not status then
	return
end

neotree.setup({
	window = { width = 30 },
})

vim.keymap.set("n", "tg", ":Neotree float git_status<Return>", { silent = true })
vim.keymap.set("n", "<C-t>", ":Neotree<Return>", { silent = true })
