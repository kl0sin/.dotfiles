local packer = require 'lib.packer-init'

packer.startup(function(use)
  use { 'wbthomason/packer.nvim' }                  -- Packer Initialization

  use {                                             -- Nvim Tree
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
end)
