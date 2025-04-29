return {
  "nvimtools/none-ls.nvim",
  dependencies = {
    "nvimtools/none-ls-extras.nvim",
  },
  lazy = false,
  config = function()
    local null_ls = require("null-ls")
    local formatting = null_ls.builtins.formatting

    local eslint_config = {
      diagnostics_format = "#{m}",
      condition = function(utils)
        -- only enable if root has eslint config file
        return utils.root_has_file({
          ".eslintrc.js",
          ".eslintrc.cjs",
          "eslint.config.js",
          ".eslintrc.json",
          ".eslintrc",
          "eslint.config.cjs",
          "eslint.config.ts",
        })
      end,
    }

    local prettier_config = {
      condition = function(utils)
        -- only enable if root has prettier config file
        return utils.root_has_file({
          ".prettierrc",
          ".prettierrc.json",
          ".prettierrc.yaml",
          ".prettierrc.yml",
          ".prettierrc.js",
          ".prettierrc.cjs",
          ".prettierrc.mjs",
          "prettier.config.js",
          "prettier.config.cjs",
          ".prettierrc.toml",
        })
      end,
    }

    null_ls.setup({
      sources = {
        require('none-ls.diagnostics.eslint_d').with(eslint_config),
        require('none-ls.code_actions.eslint_d').with(eslint_config),
        formatting.prettierd.with(prettier_config),
        formatting.biome,
        formatting.stylua,
        formatting.shfmt,
      },
    })

    -- Keybindings for formatting
    vim.keymap.set("n", "<leader>f", "<cmd>lua vim.lsp.buf.format()<cr>")
  end,
}
