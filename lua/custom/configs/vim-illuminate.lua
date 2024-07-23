-- require("illuminate").configure { delay = 400 }
--
-- local hslutil = require "solarized-osaka.hsl"
-- local hsl = hslutil.hslToHex
--
-- vim.api.nvim_set_hl(0, "IlluminatedWordRead", { bg = hsl(184, 35, 16), fg = hsl(184, 35, 70) })


require("illuminate").configure { delay = 400 }
local utils = require "custom.utils"

vim.api.nvim_set_hl(0, "IlluminatedWordRead", { bg = utils.get_hex_color("Substitute", "fg")})

