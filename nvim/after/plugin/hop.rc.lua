local status, hop = pcall(require, "hop")
if not status then
	return
end

-- local directions = require('hop.hint').HintDirection

hop.setup({
	multi_windows = true,
})

local map = vim.keymap.set
local opts = { noremap = true, silent = true }

map("", "<C-h>", function()
	hop.hint_char2()
end, opts)

map("", "<C-w>", function()
	hop.hint_char1()
end, opts)
