require "nvchad.options"

-- add yours here!

local o = vim.o
o.cursorlineopt = "both" -- to enable cursorline!

-- diable clipoard
o.clipboard = ""

require("luasnip.loaders.from_vscode").lazy_load { paths = { "../snippets/react.json" } }
