require("oil").setup {
  skip_confirm_for_simple_edits = true,
  delete_to_trash = true,

  -- Keymaps in oil buffer. Can be any value that `vim.keymap.set` accepts OR a table of keymap
  -- options with a `callback` (e.g. { callback = function() ... end, desc = "", nowait = true })
  -- Additionally, if it is a string that matches "actions.<name>",
  -- it will use the mapping at require("oil.actions").<name>
  -- Set to `false` to remove a keymap
  -- See :help oil-actions for a list of all available actions
  keymaps = {
    ["q"] = "actions.close",
    ["L"] = "actions.select_vsplit",
    ["J"] = "actions.select_split",
    ["H"] = "actions.parent",
    ["<C-l>"] = false,
    ["<C-h>"] = false,
  },
  -- Set to false to disable all of the above keymaps
  use_default_keymaps = true,
  view_options = {
    show_hidden = true,
    is_hidden_file = function(name, bufnr)
      --  maybe add migrations (django) folder here
      -- return vim.startswith(name, ".")
      return name == ".." or name == ".git"
    end,
  },
  -- Configuration for the floating window in oil.open_float
  float = {
    -- Padding around the floating window
    padding = 2,
    max_width = 120,
    max_height = 30,
    border = "rounded",
    win_options = {
      winblend = 0,
    },
    override = function(conf)
      return conf
    end,
  },
}

vim.keymap.set("n", "L", require("oil").open_float, { desc = "Open parent directory" })
