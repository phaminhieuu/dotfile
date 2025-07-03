return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
  },
  config = function()
    local mason = require("mason")
    local mason_lspconfig = require("mason-lspconfig")

    mason.setup({
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
        border = "rounded",
      },
    })

    mason_lspconfig.setup({
      ensure_installed = {
        "ts_ls",
        "html",
        "cssls",
        "tailwindcss",
        "lua_ls",
        "astro",
        "eslint_d",
        "prettierd",
        "glsl_analyzer",
        "marksman",
        "dockerls",
        "yamlls",
        "bashls",
        "dockerls",
        "prettierd",
        -- "biome",
        "gopls",
      },
      automatic_installation = true,
    })
  end,
}
