local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

require('packer').startup(function(use)
  -- package manager
  use 'wbthomason/packer.nvim'

	-- dependency for other plugins
	use 'nvim-lua/plenary.nvim'
	use 'kyazdani42/nvim-web-devicons'

	-- fuzzy finder
	use 'nvim-telescope/telescope.nvim'
	use 'nvim-telescope/telescope-hop.nvim'
  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

	-- gruvbox colorscheme
  use 'sainnhe/gruvbox-material'

	-- git wrapper
	use 'tpope/vim-fugitive'

	-- syntax tree
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

	-- LSP
	use 'neovim/nvim-lspconfig'
	use 'folke/lsp-colors.nvim'
	use 'jose-elias-alvarez/nvim-lsp-ts-utils'
  use 'b0o/schemastore.nvim'

	-- completion
	use 'hrsh7th/nvim-cmp'
	use 'hrsh7th/cmp-nvim-lsp'
	use 'hrsh7th/cmp-buffer'
	use 'hrsh7th/cmp-vsnip'
	use 'hrsh7th/vim-vsnip'

	-- file tree
  use { 'ms-jpq/chadtree', branch = 'chad', run = 'python3 -m chadtree deps' }

	-- formatter
	use 'sbdchd/neoformat'

	-- comments
	use {
    'numToStr/Comment.nvim',
    config = function()
        require('Comment').setup()
    end
  }

	-- surronding addition / edition
	use "machakann/vim-sandwich"

  -- set of pair mappings
  use 'tpope/vim-unimpaired'

	-- autosave
	use '907th/vim-auto-save'

	-- live preview
	use { 'iamcco/markdown-preview.nvim', run = 'cd app && yarn install' }

	-- navigation
	use { 'phaazon/hop.nvim', branch = 'v1' }
  use 'ThePrimeagen/harpoon'

  -- debugger
  use 'puremourning/vimspector'

	-- meta
	use 'dstein64/vim-startuptime'

  -- whitespace
  use 'lukas-reineke/indent-blankline.nvim' 


	if packer_boostrap then
	  require('packer').sync()
	end

end)

require('plugin-configs/fuzzy-finder')
require('plugin-configs/syntaxtree')
require('plugin-configs/lsp')
require('plugin-configs/completion')
require('plugin-configs/filetree')
require('plugin-configs/format')
require('plugin-configs/autosave')
require('plugin-configs/git')
require('plugin-configs/navigation')
require('plugin-configs/debugger')
require('plugin-configs/visual')
