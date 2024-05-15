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
-- REQUIRED
harpoon:extend(require("harpoon.extensions").builtins.command_on_nav "UfoEnableFold")

vim.keymap.set("n", "<leader>a", function() harpoon:list():prepend() end)
vim.keymap.set("t", "<leader>a", function() harpoon:list():prepend() end)

vim.keymap.set("n", "<leader>A", function() harpoon:list():append() end)
vim.keymap.set("t", "<leader>A", function() harpoon:list():append() end)

vim.keymap.set("n", "H", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)
vim.keymap.set("t", "H", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

vim.keymap.set("n", "<C-a>", function() harpoon:list():select(1) end)
vim.keymap.set("t", "<C-a>", function() harpoon:list():select(1) end)

vim.keymap.set("n", "<C-s>", function() harpoon:list():select(2) end)
vim.keymap.set("t", "<C-s>", function() harpoon:list():select(2) end)

vim.keymap.set("n", "<C-d>", function() harpoon:list():select(3) end)
vim.keymap.set("t", "<C-d>", function() harpoon:list():select(3) end)

vim.keymap.set("n", "<C-f>", function() harpoon:list():select(4) end)
vim.keymap.set("t", "<C-f>", function() harpoon:list():select(4) end)


