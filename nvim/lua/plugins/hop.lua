return {
  "phaazon/hop.nvim",
  branch = "v2",
  config = function()
    local hop = require("hop")

    require("hop").setup()

    local map = vim.keymap.set

    map("n", "<leader>w", function()
      hop.hint_words()
    end)
  end,
}
