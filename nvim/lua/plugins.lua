local status, packer = pcall(require, 'packer')
if (not status) then
  print("Packer is not installed")
  return
end

vim.cmd [[packadd packer.nvim]]

packer.startup(function(use)
  use 'wbthomason/packer.nvim'

  -- color schemas
  use {
    'svrana/neosolarized.nvim',
    requires = { 'tjdevries/colorbuddy.nvim' }
  }
  use 'norcalli/nvim-colorizer.lua'

  -- bufferline 
  use 'akinsho/nvim-bufferline.lua'

  -- treesitter
  use {
    'nvim-treesitter/nvim-treesitter',
    run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
  }
  use("nvim-treesitter/nvim-treesitter-textobjects")

  -- icons
  use 'kyazdani42/nvim-web-devicons'

  -- automatic bracket pairs
  use 'windwp/nvim-autopairs'

  -- autotag
  use 'windwp/nvim-ts-autotag'

  -- smooth scrolling
	use("karb94/neoscroll.nvim")

  -- surround selections
  use("kylechui/nvim-surround")

  -- quick motions
	use({
		"phaazon/hop.nvim",
		branch = "v2",
	})
  -- git decorations in files
  use 'lewis6991/gitsigns.nvim'

  -- commenting
  use 'JoosepAlviste/nvim-ts-context-commentstring'
  use { 'numToStr/Comment.nvim' }

  -- telescope
  use 'nvim-lua/plenary.nvim' -- Common utilities
  use 'nvim-telescope/telescope.nvim'
  use 'nvim-telescope/telescope-file-browser.nvim'
  use 'nvim-telescope/telescope-ui-select.nvim'

  -- status line
  use 'hoob3rt/lualine.nvim'

  -- snippet
  use 'L3MON4D3/LuaSnip' -- Snippet
  use 'onsails/lspkind-nvim' -- vscode-like pictograms

  -- formatting, code actions and diagnostics
  use 'jose-elias-alvarez/null-ls.nvim'

  -- lsp
  use 'neovim/nvim-lspconfig'

  -- lsp installer
  use 'williamboman/mason.nvim'
  use 'williamboman/mason-lspconfig.nvim'

  -- lsp UI
  use 'glepnir/lspsaga.nvim'

  -- autocompletion
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-buffer' --nvim-cmp source for buffer words
  use 'hrsh7th/cmp-path' -- Completion
  use 'hrsh7th/cmp-nvim-lsp' -- nvim-cmp source for neovim's built-in LSP
  use 'hrsh7th/cmp-nvim-lua' -- nvim-cmp source for neovim's built-in LSP
  use 'saadparwaiz1/cmp_luasnip'

  -- prettier
  use 'MunifTanjim/prettier.nvim' -- Prettier plugin for Neovim's built-in LSP client :

  -- lazy git
  use 'kdheepak/lazygit.nvim'

  -- auto save
  use 'pocco81/auto-save.nvim' -- Auto save in Nvim
end)
