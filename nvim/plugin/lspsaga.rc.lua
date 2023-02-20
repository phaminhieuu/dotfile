local status, saga = pcall(require, "lspsaga")
if not status then
	return
end

saga.setup({
	ui = {
		border = "rounded",
		colors = {
			normal_bg = "none",
			red = "#dc322f",
			magenta = "#d33682",
			orange = "#cb4b16",
			yellow = "#b58900",
			green = "#719e07",
			cyan = "#2aa198",
			blue = "#268bd2",
			purple = "#6c71c4",
			white = "#fdf6e3",
			black = "#002b36",
		},
	},
	diagnostic = {
		show_code_action = false,
	},
	symbol_in_winbar = {
		enable = false,
	},
})

local opts = { noremap = true, silent = true }
vim.keymap.set("n", "<C-j>", "<Cmd>Lspsaga diagnostic_jump_next<CR>", opts)
vim.keymap.set("n", "<C-k>", "<Cmd>Lspsaga diagnostic_jump_prev<CR>", opts)
vim.keymap.set("n", "<C-l>", "<Cmd>Lspsaga outline<CR>", opts)
vim.keymap.set("n", "K", "<Cmd>Lspsaga hover_doc ++quiet<CR>", opts)
vim.keymap.set("n", "gd", "<Cmd>Lspsaga goto_definition<CR>", opts)
vim.keymap.set("n", "gp", "<Cmd>Lspsaga peek_definition<CR>", opts)
vim.keymap.set("n", "gr", "<Cmd>Lspsaga rename<CR>", opts)
