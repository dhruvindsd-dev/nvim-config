local dapui = require "dapui"
dapui.setup {
  icons = { expanded = "", collapsed = "", current_frame = "" },
  expand_lines = vim.fn.has "nvim-0.7",
  floating = {
    max_height = 0.9, -- These can be integers or a float between 0 and 1.
    max_width = 0.9, -- Floats will be treated as percentage of your scren.
  },
}

vim.api.nvim_set_keymap("n", "<leader>du", '<cmd>lua require("dapui").toggle()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap(
  "n",
  "<leader>dU",
  '<cmd>lua require("dapui").toggle({reset=true})<CR>',
  { noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
  "n",
  "<leader>dw",
  '<cmd>lua require("dapui").float_element("watches", {width=150, height=100, enter=true, position="center"})<CR>',
  { noremap = true, silent = true }
)
