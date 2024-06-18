return {
  "sindrets/diffview.nvim",
  config = function()
    require("diffview").setup()

    local opts = { noremap = true, silent = true }

    vim.api.nvim_set_keymap("n", "<leader>g", "<cmd>DiffviewOpen<CR>", opts)
  end,
}
