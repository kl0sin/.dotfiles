local packer = require 'lib.packer-init'

packer.startup(function(use)
  use 'wbthomason/packer.nvim'
  use 'kyazdani42/nvim-web-devicons'
  use 'nvim-lua/plenary.nvim'
  use 'neovim/nvim-lspconfig'
  use 'tpope/vim-commentary'
  use 'tpope/vim-repeat'
  use 'tpope/vim-surround'

  use {
    'prettier/vim-prettier',
    config = function()
      require('plugins.prettier')
    end
  }

  use {
    'williamboman/nvim-lsp-installer',
    requires = {
      'neovim/nvim-lspconfig'
    },
    config = function()
      require('plugins.lsp')
    end
  }

  use {
    'hrsh7th/nvim-cmp',
    requires = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'saadparwaiz1/cmp_luasnip',
      'L3MON4D3/LuaSnip',
      'jessarcher/cmp-path',
      'hrsh7th/cmp-nvim-lua',
      'onsails/lspkind-nvim',
      'hrsh7th/cmp-nvim-lsp-signature-help',
    },
    config = function()
      require('plugins.cmp')
    end
  }

  use {
    'kyazdani42/nvim-tree.lua',
    config = function()
      require('plugins.nvim-tree')
    end
  }

  use {
    'dracula/vim',
    as = 'dracula',
    config = function()
      require('plugins.dracula')
    end
  }

  use {
    'nvim-telescope/telescope.nvim',
    requires = {
      { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' },
      { 'nvim-telescope/telescope-live-grep-raw.nvim' },
    },
    config = function()
      require('plugins.telescope')
    end
  }

  use {
      'nvim-treesitter/nvim-treesitter',
      run = ':TSUpdate',
      config = function()
          require('plugins.nvim-treesitter')
      end
  }

  use {
    'glepnir/dashboard-nvim',
    config = function()
      require('plugins.dashboard')
    end
  }

  use {
    'akinsho/bufferline.nvim',
    requires = {
      'kyazdani42/nvim-web-devicons'
    },
    config = function()
      require('plugins.bufferline')
    end
  }

  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true },
    config = function ()
      require('.plugins.lualine')
    end
  }

  use {
    'lukas-reineke/indent-blankline.nvim',
    config = function()
      require('plugins.indent-blankline')
    end
  }

  use {
    'lewis6991/gitsigns.nvim',
    requires = {
      'nvim-lua/plenary.nvim'
    },
    config = function ()
      require('plugins.gitsigns')
    end
  }

  if PACKER_BOOTSTRAP then
    require('packer').sync()
  end
end)
