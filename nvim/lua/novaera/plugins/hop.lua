return {
	"phaazon/hop.nvim",
	branch = "v2",
	config = function()
		local hop = require("hop")

		require("hop").setup()

		local map = vim.keymap.set

		local directions = require("hop.hint").HintDirection

		map("n", "<leader>w", function()
			hop.hint_words()
		end)

		map("n", "<C-h>", function()
			hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = false })
		end)
	end,
}
