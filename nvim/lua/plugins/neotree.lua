return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  cmd = "Neotree",
  dependencies = { "MunifTanjim/nui.nvim" },
  keys = {
    {
      "tg",
      ":Neotree float git_status<Return>",
      desc = "Toggle Neotree with git status",
    },
    {
      "<C-t>",
      ":Neotree<Return>",
    },
  },

  config = function(_, opts)
    opts.window = { width = 30 }
  end,
}
