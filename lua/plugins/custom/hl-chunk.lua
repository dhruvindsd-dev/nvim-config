local utils = require "plugins.custom.utils"

-- Assuming the green color is in the 'String' highlight group
local green_color = utils.get_hex_color("String", "fg")

require("hlchunk").setup {
  chunk = {
    enable = true,
    style = green_color,
    duration = 0,
    delay = 0,
    use_treesitter = true,
    chars = {
      horizontal_line = "━",
      vertical_line = "┃",
      left_top = "┏",
      left_bottom = "┗",
      right_arrow = "▶",

      -- horizontal_line = "─",
      -- vertical_line = "│",
      -- left_top = "╭",
      -- left_bottom = "╰",
      -- right_arrow = "➤",
    },
  },
  line_num = { enable = false },
  indent = { enable = true, chars = { "│", "¦", "┆", "┊" } },
}
