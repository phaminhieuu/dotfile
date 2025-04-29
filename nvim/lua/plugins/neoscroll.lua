return {
  "karb94/neoscroll.nvim",
  config = function()
    local neoscroll = require("neoscroll")

    local keymap = {
      ["-"] = function()
        neoscroll.ctrl_d({ move_cursor = true, easing = "sine", duration = 300 })
      end,
      ["="] = function()
        neoscroll.ctrl_u({ move_cursor = true, easing = "sine", duration = 300 })
      end,
    }

    local modes = { "n", "v", "x" }
    for key, func in pairs(keymap) do
      vim.keymap.set(modes, key, func, { noremap = true, silent = true })
    end
  end,
}
