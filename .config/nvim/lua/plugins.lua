local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    packer_bootstrap =
        fn.system({"git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path})
end

require("packer").startup(
    function(use)
        -- package manager
        use "wbthomason/packer.nvim"

        -- dependency for other plugins
        use "nvim-lua/plenary.nvim"
        use "kyazdani42/nvim-web-devicons"

        -- fuzzy finder
        use "nvim-telescope/telescope.nvim"
        use "nvim-telescope/telescope-hop.nvim"
        use {"nvim-telescope/telescope-fzf-native.nvim", run = "make"}
        use "nvim-telescope/telescope-ui-select.nvim"
        use "windwp/nvim-spectre"

        -- gruvbox colorscheme
        use "gruvbox-community/gruvbox"

        -- git
        use "tpope/vim-fugitive"

        -- syntax tree
        use {"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"}
        use "nvim-treesitter/nvim-treesitter-textobjects"

        -- LSP
        use "neovim/nvim-lspconfig"
        use "jose-elias-alvarez/nvim-lsp-ts-utils"
        use "b0o/schemastore.nvim"
        use "ray-x/lsp_signature.nvim"
        use "nvim-lua/lsp-status.nvim"

        use {
            "folke/trouble.nvim",
            requires = {
                "kyazdani42/nvim-web-devicons"
            }
        }

        use {
          "jose-elias-alvarez/null-ls.nvim",
          requires = {
            "nvim-lua/plenary.nvim"
          }
        }

        -- completion
        use "hrsh7th/nvim-cmp"
        use "hrsh7th/cmp-nvim-lsp"
        use "hrsh7th/cmp-buffer"
        use "hrsh7th/cmp-vsnip"
        use "hrsh7th/vim-vsnip"

        -- file tree
        use {"ms-jpq/chadtree", branch = "chad", run = "python3 -m chadtree deps"}

        -- formatter
        use "sbdchd/neoformat"

        -- comments
        use {
            "numToStr/Comment.nvim",
            config = function()
                require("Comment").setup()
            end
        }

        -- surronding addition / edition
        use "machakann/vim-sandwich"

        -- set of pair mappings
        use "tpope/vim-unimpaired"

        -- autosave
        use "907th/vim-auto-save"

        -- live preview
        use {"iamcco/markdown-preview.nvim", run = "cd app && yarn install"}

        -- navigation
        use {"phaazon/hop.nvim", branch = "v1"}
        use "ThePrimeagen/harpoon"

        -- debugger
        use "puremourning/vimspector"

        -- meta
        use "dstein64/vim-startuptime"

        -- whitespace
        use "lukas-reineke/indent-blankline.nvim"

        -- status line
        use 'qchouleur/statusline.lua'

        -- REST
        use {
          "NTBBloodbath/rest.nvim",
          requires = { "nvim-lua/plenary.nvim" },
          config = function()
            require("rest-nvim").setup({
              -- Open request results in a horizontal split
              result_split_horizontal = false,
              -- Keep the http file buffer above|left when split horizontal|vertical
              result_split_in_place = false,
              -- Skip SSL verification, useful for unknown certificates
              skip_ssl_verification = false,
              -- Highlight request on run
              highlight = {
                enabled = true,
                timeout = 150,
              },
              result = {
                -- toggle showing URL, HTTP info, headers at top the of result window
                show_url = true,
                show_http_info = true,
                show_headers = true,
              },
              -- Jump to request line on run
              jump_to_request = false,
              env_file = '.env',
              custom_dynamic_variables = {},
              yank_dry_run = true,
            })
          end
        }

        if packer_boostrap then
            require("packer").sync()
        end
    end
)
