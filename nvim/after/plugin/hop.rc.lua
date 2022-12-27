local status, hop = pcall(require, 'hop')
if (not status) then return end

-- local directions = require('hop.hint').HintDirection

hop.setup({
  multi_windows = true
})

local map = vim.keymap.set

map('', 'q', function()
  hop.hint_char2()
end)


