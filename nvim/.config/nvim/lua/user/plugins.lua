local packer = require 'lib.packer-init'

packer.startup(function(use)
  use { 'wbthomason/packer.nvim' }

  use {
    'kyazdani42/nvim-tree.lua',
    requires = 'kyazdani42/nvim-web-devicons',
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
      { 'nvim-lua/plenary.nvim' },
      { 'kyazdani42/nvim-web-devicons' },
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
end)
