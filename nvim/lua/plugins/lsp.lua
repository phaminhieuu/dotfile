return {
	"neovim/nvim-lspconfig",
	lazy = true,
	config = function()
		local capabilities = require("cmp_nvim_lsp").default_capabilities()

		local on_attach = function(_, bufnr)
			local function buf_set_option(...)
				vim.api.nvim_buf_set_option(bufnr, ...)
			end

			--Enable completion triggered by <c-x><c-o>
			buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
		end

		local lspconfig = require("lspconfig")

		local lsp_list = {
			"tsserver",
			"cssls",
			"tailwindcss",
			"html",
			"yamlls",
			"dockerls",
		}

		for _, lsp in pairs(lsp_list) do
			lspconfig[lsp].setup({
				capabilities = capabilities,
				on_attach = on_attach,
			})
		end

		lspconfig.glsl_analyzer.setup({
			capabilities = capabilities,
		})

		lspconfig.astro.setup({
			capabilities = capabilities,
		})

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
