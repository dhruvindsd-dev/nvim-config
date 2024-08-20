return {
  {
    "lukas-reineke/indent-blankline.nvim",
    enabled = false,
  },
  {
    "nvim-telescope/telescope.nvim",
    opts = {
      defaults = {
        vimgrep_arguments = {
          "rg",
          "-L",
          "--color=never",
          "--no-heading",
          "--with-filename",
          "--line-number",
          "--column",
          "--smart-case",
        },
        prompt_prefix = "",
        selection_caret = "  ",
        entry_prefix = "  ",
        initial_mode = "insert",
        selection_strategy = "reset",
        sorting_strategy = "ascending",
        layout_strategy = "horizontal",
        layout_config = {
          horizontal = {
            prompt_position = "top",
            preview_width = 0.55,
            results_width = 0.8,
          },
          vertical = {
            mirror = false,
          },
          width = 0.87,
          height = 0.95,
          preview_cutoff = 120,
        },
        file_sorter = require("telescope.sorters").get_fuzzy_file,
        file_ignore_patterns = { "^out%/.+$", "*/node_modules/*" },
        generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
        path_display = { "truncate" },
        winblend = 0,
        border = {},
        borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
        color_devicons = true,
        set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
        file_previewer = require("telescope.previewers").vim_buffer_cat.new,
        grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
        qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
        -- Developer configurations: Not meant for general override
        buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,
        mappings = {
          i = {
            ["<c-d>"] = require("telescope.actions").delete_buffer,
          },
          n = {
            ["f"] = require("telescope.actions.layout").toggle_preview,
            ["q"] = require("telescope.actions").close,
            ["L"] = require("telescope.actions").file_vsplit,
            ["J"] = require("telescope.actions").file_split,
            ["<c-d>"] = require("telescope.actions").delete_buffer,
          },
        },
      },

      extensions_list = { "themes", "terms" },
    },
  },

  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    -- commit = "786ca8680ecbed11f3f6a157ea411e7ad2ee4d34",
    lazy = false,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    -- commit = "f197a15",
    opts = {
      ensure_installed = {
        "lua",
        "vimdoc",
        "vim",
        "lua",
        "html",
        "css",
        "javascript",
        "typescript",
        "tsx",
        "c",
        "markdown",
        "markdown_inline",
        "prisma",
        "graphql",
        "python",
      },
      highlight = { enable = true, use_languagetree = true },
      indent = { enable = true },
      textobjects = {
        select = {
          enable = true,
          lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
          keymaps = {
            -- You can use the capture groups defined in textobjects.scm
            ["ia"] = "@assignment.inner",
            ["aa"] = "@assignment.outer",
            ["af"] = "@function.outer",
            ["if"] = "@function.inner",
            ["ac"] = "@class.outer",
            ["ic"] = "@class.inner",
            ["ii"] = "@conditional.inner",
            ["ai"] = "@conditional.outer",
            ["il"] = "@loop.inner",
            ["al"] = "@loop.outer",
            ["a/"] = "@comment.outer",
          },
        },
        move = {
          enable = true,
          set_jumps = true,
          goto_next_start = {
            ["]]"] = "@function.outer",
            ["}}"] = "@class.outer",
          },
          goto_previous_start = {
            ["[["] = "@function.outer",
            ["{{"] = "@class.outer",
          },
        },
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "vv",
          scope_incremental = false,
          node_incremental = "<TAB>",
          node_decremental = "<S-TAB>",
        },
      },
    },
  },
  { "christoomey/vim-tmux-navigator", lazy = false },
  { "github/copilot.vim", lazy = false },
  { "yssl/QFEnter", lazy = false },
  {
    "kevinhwang91/nvim-ufo",
    lazy = false,
    dependencies = { "kevinhwang91/promise-async" },
    config = function()
      require "plugins.custom.ufo"
    end,
  },
  { "mbbill/undotree", lazy = false, keys = { "<leader>ut" } },
  {
    "stevearc/oil.nvim",
    keys = { "L" },
    cmd = { "Oil" },
    config = function()
      require "plugins.custom.oil"
    end,
  },
  {
    "smoka7/hop.nvim",
    lazy = false,
    keys = { "s", "S", "//" },
    config = function()
      require("hop").setup { keys = "asdfghjlqwertyuiozxcvbnm" }
    end,
  },
  { "numtostr/BufOnly.nvim", event = "BufRead" },
  {
    "mg979/vim-visual-multi",
    lazy = false,
    branch = "master",
    config = function()
      vim.cmd "VMTheme purplegray"
      vim.g.VM_maps["Find Under"] = "<C-d>" -- replace C-n
    end,
  },
  { "nvim-pack/nvim-spectre", keys = { "<leader>F" } },
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = { "MunifTanjim/nui.nvim" },
    config = function()
      require "plugins.custom.noice"
    end,
  },
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    lazy = false,
    config = function()
      require "plugins.custom.harpoon"
    end,
  },
  {
    "RRethy/vim-illuminate",
    event = "BufRead",
    config = function()
      require "plugins.custom.vim-illumiate"
    end,
  },
  {
    "hedyhli/outline.nvim",
    cmd = { "Outline", "OutlineOpen" },
    lazy = false,
    config = function()
      require("outline").setup()
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
  {
    "folke/zen-mode.nvim",
    lazy = false,
    opts = {
      plugins = {
        twilight = { enabled = true }, -- enable to start Twilight when zen mode opens
        tmux = { enabled = true }, -- disables the tmux statusline
      },
    },
  },
  {
    "shellRaining/hlchunk.nvim",
    lazy = false,
    event = { "UIEnter" },
    config = function()
      require "plugins.custom.hl-chunk"
    end,
  },
  {
    "mistricky/codesnap.nvim",
    keys = {
      { "<leader>sc", "<cmd>CodeSnap<cr>", mode = "x", desc = "Save selected code snapshot into clipboard" },
      { "<leader>sch", "<cmd>CodeSnapHighlight<cr>", mode = "x", desc = "Save selected code snapshot into clipboard" },
    },
    build = "make",
    config = function()
      require "plugins.custom.codesnap"
    end,
  },
  { "folke/twilight.nvim" },
  { "xiyaowong/transparent.nvim", lazy = false },
  {
    "razak17/tailwind-fold.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    ft = { "html", "svelte", "astro", "vue", "typescriptreact", "blade", "javascriptreact" },
    opts = {
      enabled = false,
      symbol = "•",
      highlight = { fg = "Grey" },
      ft = { "html", "svelte", "astro", "vue", "tsx", "php", "blade", "eruby" },
    },
  },
  {
    "brenoprata10/nvim-highlight-colors",
    lazy = false,
    config = function()
      require("nvim-highlight-colors").setup {}
    end,
  },
}
