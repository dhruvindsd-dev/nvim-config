local overrides = require "custom.configs.overrides"

---@type NvPluginSpec[]
local plugins = {

  -- Override plugin definition options

  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- format & linting
      {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
          require "custom.configs.null-ls"
        end,
      },
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end, -- Override to setup mason-lspconfig
  },

  -- override plugin configs
  {
    "williamboman/mason.nvim",
    opts = overrides.mason,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },
  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },

  -- Install a plugin
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },

  -- To make a plugin not be loaded
  -- {
  --   "NvChad/nvim-colorizer.lua",
  --   enabled = false
  -- },

  -- All NvChad plugins are lazy-loaded by default
  -- For a plugin to be loaded, you will need to set either `ft`, `cmd`, `keys`, `event`, or set `lazy = false`
  -- If you want a plugin to load on startup, add `lazy = false` to a plugin spec, for example
  --
  {
    "christoomey/vim-tmux-navigator",
    lazy = false,
  },
  {
    "github/copilot.vim",
    lazy = false,
  },
  -- {
  --   "phaazon/hop.nvim",
  --   lazy = false,
  --   config = function()
  --     require("hop").setup()
  --     vim.cmd "highlight HopNextKey guifg=#29E68E"
  --     vim.cmd "highlight HopNextKey1 guifg=#29E68E"
  --     vim.cmd "highlight HopNextKey2 guifg=#29E68E"
  --   end,
  -- },
  {
    "mfussenegger/nvim-dap",
    lazy = false,
    config = function()
      require "custom.configs.dap"
    end,
  },
  {
    "rcarriga/nvim-dap-ui",
    keys = {
      { "<leader>du", mode = "n" },
    },
    config = function()
      require "custom.configs.dapui"
    end,
  },
  {
    "ThePrimeagen/harpoon",
    lazy = false,
  },
  { "yssl/QFEnter", lazy = false },
  { "kevinhwang91/promise-async", lazy = false },
  {
    "kevinhwang91/nvim-ufo",
    config = function()
      require "custom.configs.ufo-nvim"
    end,
    event = "BufRead",
  },
  {
    "mbbill/undotree",
    lazy = false,
  },
  {
    "stevearc/oil.nvim",
    lazy = false,
    config = function()
      require "custom.configs.mini"
    end,
  },
  {
    "ggandor/leap.nvim",
    lazy = false,
    config = function()
      require("leap").add_default_mappings()
      vim.keymap.set("n", "s", function()
        local current_window = vim.fn.win_getid()
        require("leap").leap { target_windows = { current_window } }
      end)
    end,
  },
  { "numtostr/BufOnly.nvim", lazy = false },
}

return plugins
