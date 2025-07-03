return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre" },
  lazy = true,
  config = function()
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

    local on_attach = function(_, bufnr)
      local function buf_set_option(...)
        vim.api.nvim_buf_set_option(bufnr, ...)
      end

      --Enable completion triggered by <c-x><c-o>
      buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
    end

    local lspconfig = require("lspconfig")

    local lsp_list = {
      "astro",
      "ts_ls",
      "cssls",
      "tailwindcss",
      "html",
      "yamlls",
      "dockerls",
      "glsl_analyzer",
      "marksman",
      "yamlls",
      "bashls",
      -- "biome",
      "gopls",
      "phpactor",
      "graphql",
    }

    for _, lsp in pairs(lsp_list) do
      lspconfig[lsp].setup({
        capabilities = capabilities,
        on_attach = on_attach,
      })
    end

    lspconfig.lua_ls.setup({
      capabilities = capabilities,
      settings = {
        Lua = {
          diagnostics = {
            globals = { "vim" },
          },
          workspace = {
            checkThirdParty = false,
          },
        },
      },
    })

    -- Diagnostics symbols
    vim.diagnostic.config({
      virtual_text = {
        prefix = "",
      },
      update_in_insert = true,
      float = {
        source = "always",
        border = "rounded",
      },
    })

    -- Diagnostic symbols in the sign column (gutter)
    local signs = { Error = "󰅙", Warn = "", Hint = "", Info = "" }
    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
    end
  end,
}
