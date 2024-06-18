return {
  "pocco81/auto-save.nvim",
  config = function()
    require("auto-save").setup({
      execution_message = {
        message = function()
          return ("Saved")
        end,
      },
    })
  end,
}
