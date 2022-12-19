local status, eslint = pcall(require, 'eslint')
if (not status) then return end

eslint.setup({
  bin = 'eslint_d',
  code_actions = {
    enable = true,
    apply_on_save = {
      enable = false,
      types = { "suggestion" }, -- "directive", "problem", "suggestion", "layout"
    },
    disable_rule_comment = {
      enable = true,
      location = "separate_line", -- or `same_line`
    },
  },
  diagnostics = {
    enable = true,
    report_unused_disable_directives = false,
    run_on = "type", -- or `save`
  },
})

local opts = { noremap = true, silent = true }
vim.keymap.set('n', '<C-e>', '<Cmd>EslintFixAll<CR>', opts)
