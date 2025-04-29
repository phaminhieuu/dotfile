return {
  "sindrets/diffview.nvim",
  config = function()
    require("diffview").setup({
      file_history_panel = {
        win_config = {
          height = 8,
        },
      },
    })

    local opts = { noremap = true, silent = true }

    vim.api.nvim_set_keymap("n", "<leader>g", "<cmd>DiffviewFileHistory %<CR>", opts)
  end,
}
