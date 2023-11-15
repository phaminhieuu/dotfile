return {
	"pocco81/auto-save.nvim",
	config = function()
		local autosave = require("auto-save")

		autosave.setup({
			-- debounce_delay = 1000,
		})
	end,
}
