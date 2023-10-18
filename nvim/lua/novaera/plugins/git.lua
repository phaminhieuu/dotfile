return {
	"dinhhuy258/git.nvim",
	config = function()
		local git = require("git")

		git.setup({
			keymaps = {
				-- Open blame window
				blame = "<Leader>gb",
				-- Open file/folder in git repository
				browse = "<Leader>go",
				-- Close git diff
				diff_close = "<Leader>gf",
			},
		})
	end,
}
