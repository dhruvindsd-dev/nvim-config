--
-- vim.keymap.set("n", "<C-c>", "", opts)
-- vim.keymap.set("i", "<C-c>", "<cmd>PickColorInsert<cr>", opts)


require("color-picker").setup({ -- for changing icons & mappings
	["icons"] = { "ﱢ", "" },
	["border"] = "none", -- none | single | double | rounded | solid | shadow
	["keymap"] = { -- mapping example:
		["H"] = "<Plug>ColorPickerSlider5Decrease",
		["L"] = "<Plug>ColorPickerSlider5Increase",
	},
	["background_highlight_group"] = "Normal", -- default
	["border_highlight_group"] = "FloatBorder", -- default
  ["text_highlight_group"] = "Normal", --default
})

