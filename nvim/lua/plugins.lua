local status, packer = pcall(require, "packer")
if not status then
	print("Packer is not installed")
	return
end

vim.cmd([[packadd packer.nvim]])

packer.startup(function(use)
	use("wbthomason/packer.nvim")

	-- color schemas
	use({
		"svrana/neosolarized.nvim",
		requires = { "tjdevries/colorbuddy.nvim" },
	})

	-- use("folke/tokyonight.nvim")

	use("norcalli/nvim-colorizer.lua")

	-- bufferline
	use("akinsho/nvim-bufferline.lua")

	-- dashboard startup
	use("glepnir/dashboard-nvim")

	-- treesitter
	use({
		"nvim-treesitter/nvim-treesitter",
		run = function()
			require("nvim-treesitter.install").update({ with_sync = true })
		end,
	})
	use({ "nvim-treesitter/nvim-treesitter-textobjects", after = "nvim-treesitter" })

	-- icons
	use("kyazdani42/nvim-web-devicons")

	-- automatic bracket pairs
	use("windwp/nvim-autopairs")

	-- indent guides
	-- use("lukas-reineke/indent-blankline.nvim")

	-- autotag
	use("windwp/nvim-ts-autotag")

	-- smooth scrolling
	use("karb94/neoscroll.nvim")

	-- quick motions
	use({
		"phaazon/hop.nvim",
		branch = "v2",
	})

	-- git decorations in files
	use("lewis6991/gitsigns.nvim")

	-- git blame and browse
	use("dinhhuy258/git.nvim")

	-- commenting
	use("JoosepAlviste/nvim-ts-context-commentstring")
	use({ "numToStr/Comment.nvim" })

	-- telescope
	use("nvim-lua/plenary.nvim")
	use("nvim-telescope/telescope.nvim")
	use("nvim-telescope/telescope-file-browser.nvim")
	use("nvim-telescope/telescope-ui-select.nvim")

	-- display file system
	use({
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v2.x",
		requires = {
			"MunifTanjim/nui.nvim",
		},
	})

	-- status line
	use("hoob3rt/lualine.nvim")

	-- snippet
	use("L3MON4D3/LuaSnip")
	use("onsails/lspkind-nvim")

	-- formatting, code actions and diagnostics
	use("jose-elias-alvarez/null-ls.nvim")

	-- lsp
	use("neovim/nvim-lspconfig")

	-- lsp installer
	use("williamboman/mason.nvim")
	use("williamboman/mason-lspconfig.nvim")

	-- lsp UI
	use({
		"glepnir/lspsaga.nvim",
		branch = "main",
	})

	-- autocompletion
	use("hrsh7th/nvim-cmp")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-nvim-lua")
	use("saadparwaiz1/cmp_luasnip")

	-- prettier
	use("MunifTanjim/prettier.nvim")

	-- lazy git
	-- use("kdheepak/lazygit.nvim")

	-- auto save
	use("pocco81/auto-save.nvim")
end)
