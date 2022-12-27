local status, cmp = pcall(require, "cmp")
if (not status) then return end
local lspkind = require 'lspkind'

local source_mapping = {
	buffer = "[Buffer]",
	nvim_lsp = "[LSP]",
	nvim_lua = "[Lua]",
	cmp_tabnine = "[TN]",
	path = "[Path]",
}

cmp.setup({
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end
  },
  window = {
    completion = cmp.config.window.bordered({ winhighlight = 'Normal:None' }),
    documentation = cmp.config.window.bordered({ winhighlight = 'Normal:None' }),
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Replace,
      select = true
    }),
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'buffer' },
  }),
  -- formatting = {
  --   format = lspkind.cmp_format({
  --     mode = 'symbol_text',
  --     with_text = false,
  --     maxwidth = 50,
  --   })
  -- }
  formatting = {
		format = function(entry, vim_item)
			-- if you have lspkind installed, you can use it like
			-- in the following line:
	 		vim_item.kind = lspkind.symbolic(vim_item.kind, {mode = "symbol_text"})
	 		vim_item.menu = source_mapping[entry.source.name]
	 		local maxwidth = 80
	 		vim_item.abbr = string.sub(vim_item.abbr, 1, maxwidth)
	 		return vim_item
	  end,
	},
})

vim.cmd [[
  set completeopt=menuone,noinsert,noselect
  highlight! default link CmpItemKind CmpItemMenuDefault
]]
