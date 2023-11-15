return {
  "MunifTanjim/prettier.nvim",
  confing = function()
    local prettier = require("prettier")
    prettier.setup({
      bin = "prettierd",
      filetypes = {
        "css",
        "javascript",
        "javascriptreact",
        "typescript",
        "typescriptreact",
        "json",
      },
    })
  end,
}
