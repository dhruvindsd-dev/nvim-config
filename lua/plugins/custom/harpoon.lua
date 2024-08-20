local harpoon = require "harpoon"

-- REQUIRED

harpoon:setup {
  settings = {
    save_on_toggle = true,
    sync_on_ui_close = true,
    key = function()
      return vim.loop.cwd()
    end,
  },
}
harpoon:extend(require("harpoon.extensions").builtins.command_on_nav "UfoEnableFold")
