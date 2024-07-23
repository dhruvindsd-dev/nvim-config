local utils = require "custom.utils"

-- Assuming the green color is in the 'String' highlight group
local green_color = utils.get_hex_color("Keyword", "fg")

require("hlchunk").setup {
  chunk = {
    chars = {
      -- horizontal_line = "━",
      -- vertical_line = "┃",
      -- left_top = "┏",
      -- left_bottom = "┗",
      -- right_arrow = "▶",

      horizontal_line = "─",
      vertical_line = "│",
      left_top = "╭",
      left_bottom = "╰",
      -- right_arrow = ">",
      right_arrow = "➤",
    },
    style = green_color,
  },
  line_num = { enable = false },
  indent = {
    chars = { "│", "¦", "┆", "┊" }, -- more code can be found in https://unicodeplus.com/
  },
  blank = {
    enable = false,
  },
}

vim.api.nvim_create_augroup("Markdown", { clear = true })
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = "*.md",
  command = "set syntax=markdown",
  group = "Markdown",
})

vim.api.nvim_create_augroup("Markdown", { clear = true })
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = "*.md",
  command = "set filetype=markdown",
  group = "Markdown",
})
