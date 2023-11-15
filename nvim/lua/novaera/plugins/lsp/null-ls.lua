---@diagnostic disable: redundant-parameter
return {
	"nvimtools/none-ls.nvim", -- configure formatters and linters
	lazy = false,
	config = function()
		local null_ls = require("null-ls")

		local formatting = null_ls.builtins.formatting

		local diagnostics = null_ls.builtins.diagnostics

		local code_actions = null_ls.builtins.code_actions

		null_ls.setup({
			sources = {
				formatting.prettier,
				formatting.stylua,
				formatting.black,

				diagnostics.pylint,
				diagnostics.eslint_d.with({
					diagnostics_format = "#{m}\n(#{c})",
					condition = function(utils)
						-- only enable if root has .eslintrc.js or .eslintrc.cjs
						return utils.root_has_file({ ".eslintrc.js", ".eslintrc.cjs" })
					end,
				}),

				code_actions.eslint_d,
			},
		})

		-- Keybindings for formatting
		vim.keymap.set("n", "<leader>f", "<cmd>lua vim.lsp.buf.format()<cr>")
	end,
}
