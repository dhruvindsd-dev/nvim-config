require("noice").setup {
  routes = { { view = "notify", filter = { event = "msg_showmode" } } },
  lsp = {
    progress = { enabled = true },
    override = { enabled = true },
    hover = { enabled = true, silent = false },
    signature = { enabled = false},
    message = { enabled = true },
    documentation = { enabled = true },
  },

  presets = {
    bottom_search = true, -- use a classic bottom cmdline for search
    command_palette = true, -- position the cmdline and popupmenu together
    long_message_to_split = true, -- long messages will be sent to a split
    inc_rename = false, -- enables an input dialog for inc-rename.nvim
    lsp_doc_border = "rounded", -- add a border to hover docs and signature help
  },
}
