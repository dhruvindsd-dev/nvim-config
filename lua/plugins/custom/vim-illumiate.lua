require("illuminate").configure { delay = 400 }
local utils = require "plugins.custom.utils"

vim.api.nvim_set_hl(0, "IlluminatedWordRead", { bg = utils.get_hex_color("Substitute", "fg") })
