vim.g.base46_cache = vim.fn.stdpath "data" .. "/nvchad/base46/"
vim.g.mapleader = " "

-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.uv.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
end

vim.opt.rtp:prepend(lazypath)

local lazy_config = require "configs.lazy"

-- load plugins
require("lazy").setup({
  {
    "NvChad/NvChad",
    lazy = false,
    branch = "v2.5",
    import = "nvchad.plugins",
  },

  { import = "plugins" },
}, lazy_config)

-- load theme
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

require "options"
require "nvchad.autocmds"

vim.schedule(function()
  require "mappings"
end)

require("luasnip.loaders.from_vscode").lazy_load { paths = { "./snippets" } }

vim.cmd "hi HopNextKey guifg=Red gui=bold cterm=bold"
vim.cmd "hi HopNextKey1 guibg=Gray40  guifg=Gray90 gui=bold cterm=bold"
vim.cmd "hi HopNextKey2 guibg=Gray40   guifg=Gray90 gui=bold cterm=bold"

if vim.g.neovide then
  vim.o.termguicolors = true
  -- vim.o.guifont = "FiraCode NF:h16:b"
  vim.o.linespace = 2

  vim.g.neovide_hide_mouse_when_typing = true

  vim.g.neovide_remember_window_size = true

  vim.g.neovide_input_use_logo = true
  vim.g.neovide_input_macos_option_key_is_meta = "both"

  vim.g.neovide_transparency = 0.94
  vim.g.neovide_window_blurred = true

  -- disable noice
end

vim.filetype.add { extension = { mdx = "markdown" } }
vim.treesitter.language.register("markdown", "mdx")

--  disable numbers 

vim.cmd "set nonumber"
