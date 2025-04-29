return {
  "nvimdev/lspsaga.nvim",
  config = function()
    local lspsaga = require("lspsaga")

    lspsaga.setup({
      ui = {
        border = "rounded",
      },
      diagnostic = {
        show_code_action = true,
      },
      symbol_in_winbar = {
        enable = false,
      },
      lightbulb = {
        enable = false,
      },
      implement = {
        enable = false,
      },
    })

    local opts = { noremap = true, silent = true }
    vim.keymap.set("n", "<C-j>", "<Cmd>Lspsaga diagnostic_jump_next<CR>", opts)
    vim.keymap.set("n", "<C-k>", "<Cmd>Lspsaga diagnostic_jump_prev<CR>", opts)
    vim.keymap.set("n", "<C-l>", "<Cmd>Lspsaga outline<CR>", opts)
    vim.keymap.set("n", "K", "<Cmd>Lspsaga hover_doc<CR>", opts)
    vim.keymap.set("n", "gd", "<Cmd>Lspsaga goto_definition<CR>", opts)
    vim.keymap.set("n", "gp", "<Cmd>Lspsaga peek_definition<CR>", opts)
    vim.keymap.set("n", "gr", "<Cmd>Lspsaga rename<CR>", opts)
    vim.keymap.set("n", "gf", "<Cmd>Lspsaga finder<CR>", opts)
  end,
}
