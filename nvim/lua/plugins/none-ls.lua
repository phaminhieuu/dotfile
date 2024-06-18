return {
	"nvimtools/none-ls.nvim",
	dependencies = {
		"nvimtools/none-ls-extras.nvim",
	},
	lazy = false,
	config = function()
		local null_ls = require("null-ls")
		local formatting = null_ls.builtins.formatting

		null_ls.setup({
			sources = {
				require("none-ls.diagnostics.eslint_d").with({
					diagnostics_format = "#{m}",
					condition = function(utils)
						-- only enable if root has .eslintrc.js or .eslintrc.cjs
						return utils.root_has_file({ ".eslintrc.js", ".eslintrc.cjs" })
					end,
				}),

				require("none-ls.code_actions.eslint_d"),
				formatting.prettier,
				formatting.stylua,
			},
		})

		-- Keybindings for formatting
		vim.keymap.set("n", "<leader>f", "<cmd>lua vim.lsp.buf.format()<cr>")
	end,
}
