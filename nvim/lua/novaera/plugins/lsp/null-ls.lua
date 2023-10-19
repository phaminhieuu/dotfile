return {
	"nvimtools/none-ls.nvim", -- configure formatters and linters
	lazy = true,
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local null_ls = require("null-ls")

		local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

		local formatting = null_ls.builtins.formatting

		local diagnostics = null_ls.builtins.diagnostics

		local code_actions = null_ls.builtins.code_actions

		local lsp_formatting = function(bufnr)
			vim.lsp.buf.format({
				filter = function(client)
					return client.name == "null-ls"
				end,
				bufnr = bufnr,
			})
		end

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

			-- configure format on save
			on_attach = function(client, bufnr)
				if client.supports_method("textDocument/formatting") then
					vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
					vim.api.nvim_create_autocmd("BufWritePre", {
						group = augroup,
						buffer = bufnr,
						callback = function()
							lsp_formatting(bufnr)
						end,
					})
				end
			end,
		})

		vim.api.nvim_create_user_command("DisableLspFormatting", function()
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = 0 })
		end, { nargs = 0 })
	end,
}
