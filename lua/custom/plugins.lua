local overrides = require "custom.configs.overrides"

---@type NvPluginSpec[]
local plugins = {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
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
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },
  { "christoomey/vim-tmux-navigator", lazy = false },
  { "github/copilot.vim", lazy = false },
  {
    "mfussenegger/nvim-dap",
    keys = { "<leader>du" },
    config = function()
      require "custom.configs.dap"
    end,
  },
  {
    "rcarriga/nvim-dap-ui",
    keys = { "<leader>du" },
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
  { "mbbill/undotree", keys = { "<leader>ut" } },
  {
    "stevearc/oil.nvim",
    event = "BufRead",
    keys = { "L" },
    config = function()
      require "custom.configs.oil"
    end,
  },
  {
    "smoka7/hop.nvim",
    lazy = false,
    keys = { "s" },
    config = function()
      require("hop").setup { keys = "wersdfagvhjkln" }
    end,
  },
  { "numtostr/BufOnly.nvim", event = "BufRead" },
  { "nvim-treesitter/nvim-treesitter-textobjects", lazy = false },
  { "xiyaowong/transparent.nvim", lazy = false },
  {
    "mg979/vim-visual-multi",
    event = "BufRead",
    branch = "master",
    config = function()
      vim.cmd "VMTheme purplegray"
      vim.g.VM_maps["Find Under"] = "<leader>p"
    end,
  },
  { "nvim-pack/nvim-spectre", keys = { "<leader>F" } },
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = { "MunifTanjim/nui.nvim" },
    config = function()
      require("noice").setup {
        routes = { { view = "notify", filter = { event = "msg_showmode" } } },
        lsp = {
          -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
          signature = { enabled = false },
          hover = { enabled = false },
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
  { "diepm/vim-rest-console", ft = "rest" },
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
    event = "BufRead",
    config = function()
      require "custom.configs.vim-illuminate"
    end,
  },
  { "craftzdog/solarized-osaka.nvim", lazy = false, priority = 1000, opts = {} },
  {
    "hedyhli/outline.nvim",
    cmd = { "Outline", "OutlineOpen" },
    lazy = false,
    config = function()
      require "custom.configs.outline"
    end,
  },
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function()
      vim.fn["mkdp#util#install"]()
    end,
  },
  { "opdavies/toggle-checkbox.nvim", lazy = false },
}

return plugins
