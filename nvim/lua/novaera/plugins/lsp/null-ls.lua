return {
	"jose-elias-alvarez/null-ls.nvim",
	config = function()
		local null_ls = require("null-ls")

		local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

		local formating = null_ls.builtins.formatting

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

		---@diagnostic disable-next-line: redundant-parameter
		null_ls.setup({
			sources = {
				diagnostics.eslint_d.with({
					-- diagnostics_format = "#{m}\n(#{c})",
				}),
				formating.prettierd,
				formating.stylua,
				code_actions.eslint_d,
			},
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
