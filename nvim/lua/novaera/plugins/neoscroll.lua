return {
	"karb94/neoscroll.nvim",
	config = function()
		local neoscroll = require("neoscroll")

		local t = {}

		t["-"] = { "scroll", { "vim.wo.scroll", "true", "300" } }
		t["="] = { "scroll", { "-vim.wo.scroll", "true", "300" } }

		neoscroll.setup({
			hide_cursor = false,
			mappings = {
				"-",
				"=",
			},
		})

		require("neoscroll.config").set_mappings(t)
	end,
}
