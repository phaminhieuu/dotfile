return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
	},

	config = function()
		local neotree = require("neo-tree")
		neotree.setup({
			window = { width = 30 },
		})

		vim.keymap.set("n", "tg", ":Neotree float git_status<Return>", { silent = true })
		vim.keymap.set("n", "<C-t>", ":Neotree<Return>", { silent = true })
	end,
}
