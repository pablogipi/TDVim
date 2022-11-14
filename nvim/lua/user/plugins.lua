local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	vim.cmd("echoerr Packer module not loaded")
	return
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

-- Install your plugins here
--
return packer.startup(function(use)
	-- Packages plugins {{{
	use("wbthomason/packer.nvim") -- Have packer manage itself
	use("nvim-lua/popup.nvim") -- An implementation of the Popup API from vim in Neovim
	use("nvim-lua/plenary.nvim") -- Useful lua functions used ny lots of plugins

	-- Basic plugins {{{
	use("tpope/vim-unimpaired") -- All famous unimpaired :)
	use("vim-scripts/HelpClose") -- Close all Help windows
	use("tpope/vim-obsession") -- Manage sessions
	use("windwp/nvim-autopairs") -- Autopairs, integrates with both cmp and treesitter
	use("lewis6991/impatient.nvim")
	use("dstein64/vim-startuptime")
	use({ "kyazdani42/nvim-web-devicons", commit = "563f3635c2d8a7be7933b9e547f7c178ba0d4352" }) -- Devicons, nvim version
	use("ryanoasis/vim-devicons") -- Devicons, vim version for startify

	-- Basic plugins }}}

	-- UI {{{
	--
	-- Buffers {{{2
	-- use "akinsho/bufferline.nvim"
	use("moll/vim-bbye")
	use("nvim-lualine/lualine.nvim")
	-- }}}

	-- Telescope {{{2
	use("nvim-telescope/telescope.nvim")
	-- use 'nvim-telescope/telescope-media-files.nvim'
	-- }}}

	-- Nvim Tree
	use({ "kyazdani42/nvim-tree.lua", commit = "7282f7de8aedf861fe0162a559fc2b214383c51c" })

	-- Toggle Term
	use("akinsho/toggleterm.nvim")

	-- Start Screen
	-- use 'goolord/alpha-nvim' -- alpha
	use("mhinz/vim-startify") -- Startify

  -- Which Key
  use "folke/which-key.nvim"

	-- UI }}}

	-- Colorschemes {{{
	-- use "lunarvim/colorschemes" -- A bunch of colorschemes you can try out
	use("lunarvim/darkplus.nvim")
	use("ellisonleao/gruvbox.nvim")
	use("folke/tokyonight.nvim")

	-- Colorschemes }}}

	-- Developmemt {{{

	-- cmp plugins {{{2
	--[[
  use "hrsh7th/nvim-cmp" -- The completion plugin
  use "hrsh7th/cmp-buffer" -- buffer completions
  use "hrsh7th/cmp-path" -- path completions
  use "hrsh7th/cmp-cmdline" -- cmdline completions
  use "saadparwaiz1/cmp_luasnip" -- snippet completions
  use "hrsh7th/cmp-nvim-lsp" -- LSP completions
  use "hrsh7th/cmp-nvim-lua" -- Lua completions
  ]]
	use({ "hrsh7th/nvim-cmp", commit = "b0dff0ec4f2748626aae13f011d1a47071fe9abc" }) -- The completion plugin
	use({ "hrsh7th/cmp-buffer", commit = "3022dbc9166796b644a841a02de8dd1cc1d311fa" }) -- buffer completions
	use({ "hrsh7th/cmp-path", commit = "447c87cdd6e6d6a1d2488b1d43108bfa217f56e1" }) -- path completions
	-- use { "saadparwaiz1/cmp_luasnip", commit = "a9de941bcbda508d0a45d28ae366bb3f08db2e36" } -- snippet completions
	use({ "hrsh7th/cmp-nvim-lsp", commit = "affe808a5c56b71630f17aa7c38e15c59fd648a8" }) -- LSP completions
	use({ "hrsh7th/cmp-nvim-lua", commit = "d276254e7198ab7d00f117e88e223b4bd8c02d21" }) -- Lua completions
	-- }}}

	-- snippets {{{2
	-- use "L3MON4D3/LuaSnip" --snippet engine
	-- use "rafamadriz/friendly-snippets" -- a bunch of snippets to use
	-- }}}

	-- LSP {{{2
	--use "neovim/nvim-lspconfig" -- enable LSP
	use({ "neovim/nvim-lspconfig", commit = "f11fdff7e8b5b415e5ef1837bdcdd37ea6764dda" }) -- enable LSP
	--use "williamboman/nvim-lsp-installer" -- simple to use language server installer
	--[[ use { -- simple to use language server installer
    'williamboman/nvim-lsp-installer',
    opt = true,
    cmd = {'LspInstallInfo', 'LspInstall', 'LspUninstall', 'LspUninstallAll', 'LspInstallLog', 'LspPrintInstalled'}
  } ]]
	use({
		"williamboman/mason.nvim",
		commit = "c2002d7a6b5a72ba02388548cfaf420b864fbc12",
		-- opt = true,
		-- cmd = {'Mason', 'MasonInstall', 'MasonUninstall', 'MasonUninstallAll', 'MasonLog'}
	})
	use({
		"williamboman/mason-lspconfig.nvim",
		commit = "0051870dd728f4988110a1b2d47f4a4510213e31",
	})
	use("antoinemadec/FixCursorHold.nvim") -- This is needed to fix lsp doc highlight
	-- }}}

	-- Null-ls {{{2
	use({ "jose-elias-alvarez/null-ls.nvim", commit = "c0c19f32b614b3921e17886c541c13a72748d450" }) -- for formatters and linters
	use({ "RRethy/vim-illuminate", commit = "a2e8476af3f3e993bb0d6477438aad3096512e42" })
	--}}}

	-- Treesitter {{{2
	use({
		"nvim-treesitter/nvim-treesitter",
		commit = "8e763332b7bf7b3a426fd8707b7f5aa85823a5ac",
	})
	--[[
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  }
  ]]
	-- }}}

	-- Comments {{{2
	use("numToStr/Comment.nvim") -- Easily comment stuff
	--use 'JoosepAlviste/nvim-ts-context-commentstring' -- Context comments
	--}}}

	-- Git
	use("lewis6991/gitsigns.nvim")

	-- Project
	-- use "ahmedkhalf/project.nvim"

	-- Indent Lines
	use("lukas-reineke/indent-blankline.nvim")

	use("p00f/nvim-ts-rainbow")
	--use "nvim-treesitter/playground"

	-- Developmemt }}}

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)

-- vim: ts=2 ft=lua nowrap fdm=marker
