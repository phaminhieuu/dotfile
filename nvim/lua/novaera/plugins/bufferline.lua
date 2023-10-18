---@diagnostic disable: missing-fields
return {
	"akinsho/nvim-bufferline.lua",
	config = function()
		local bufferline = require("bufferline")

		bufferline.setup({
			options = {
				mode = "tabs",
				separator_style = "slant",
				always_show_bufferline = false,
				show_buffer_close_icons = false,
				show_close_icon = false,
				color_icons = true,
			},
			highlights = {

				separator = {
					fg = "#24283b",
					bg = "#24283b",
				},
				separator_selected = {
					fg = "#24283b",
				},
				background = {
					bg = "#24283b",
				},
				fill = {
					bg = "#24283b",
				},
			},
		})

		vim.api.nvim_set_keymap("n", "<Tab>", "<cmd>BufferLineCycleNext<cr>", {})
		vim.api.nvim_set_keymap("n", "<S-Tab>", "<cmd>BufferLineCyclePrev<cr>", {})
	end,
}
