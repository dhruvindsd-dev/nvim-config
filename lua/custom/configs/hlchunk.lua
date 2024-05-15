require("hlchunk").setup {
  chunk = {
    chars = {
      horizontal_line = "━",
      vertical_line = "┃",
      -- left_top = "┏",
      -- left_bottom = "┗",
      right_arrow = "▶",

      -- horizontal_line = "─",
      -- vertical_line = "│",
      left_top = "╭",
      left_bottom = "╰",
    },
    style = "#00C7C7",
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
