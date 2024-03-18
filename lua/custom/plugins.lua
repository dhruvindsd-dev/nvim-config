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
  { "williamboman/mason.nvim", opts = overrides.mason },
  { "nvim-treesitter/nvim-treesitter", opts = overrides.treesitter },
  { "nvim-tree/nvim-tree.lua", opts = overrides.nvimtree },
  --
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
  { "christoomey/vim-tmux-navigator", lazy = false },
  { "github/copilot.vim", lazy = false },
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
  { "yssl/QFEnter", lazy = false },
  { "kevinhwang91/promise-async", lazy = false },
  {
    "kevinhwang91/nvim-ufo",
    config = function()
      require "custom.configs.ufo-nvim"
    end,
    event = "BufRead",
  },
  { "mbbill/undotree", lazy = false },
  {
    "stevearc/oil.nvim",
    lazy = false,
    config = function()
      require "custom.configs.oil"
    end,
  },
  {
    "smoka7/hop.nvim",
    version = "*",
    lazy = false,
    opts = {},
    config = function()
      require("hop").setup { keys = "wersdfagvhjkln" }
    end,
  },
  { "numtostr/BufOnly.nvim", lazy = false },
  { "nvim-treesitter/nvim-treesitter-textobjects", lazy = false },
  { "xiyaowong/transparent.nvim", lazy = false },
  {
    "mg979/vim-visual-multi",
    lazy = false,
    config = function()
      vim.cmd "VMTheme purplegray"
    end,
  },
  { "nvim-pack/nvim-spectre", lazy = false },
  {
    "stevearc/stickybuf.nvim",
    lazy = false,
    config = function()
      require("stickybuf").setup()
    end,
  },
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
      -- add any options here
    },
    dependencies = {
      "MunifTanjim/nui.nvim",
    },
    config = function()
      require("noice").setup {
        routes = { { view = "notify", filter = { event = "msg_showmode" } } },
        lsp = {
          -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
          override = {
            ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
            ["vim.lsp.util.stylize_markdown"] = true,
            ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
          },
        },
        -- you can enable a preset for easier configuration
        presets = {
          bottom_search = true, -- use a classic bottom cmdline for search
          command_palette = true, -- position the cmdline and popupmenu together
          long_message_to_split = true, -- long messages will be sent to a split
          inc_rename = false, -- enables an input dialog for inc-rename.nvim
          lsp_doc_border = false, -- add a border to hover docs and signature help
        },
      }
    end,
  },
  { "diepm/vim-rest-console", lazy = false },
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    lazy = false,
    config = function()
      require "custom.configs.harpoon2"
    end,
  },
  {
    "RRethy/vim-illuminate",
    lazy = false,
    config = function()
      require "custom.configs.vim-illuminate"
    end,
  },
}

return plugins
