require "nvchad.mappings"
local nomap = vim.keymap.del

nomap("n", "<C-l>")
nomap("n", "<C-h>")
nomap("n", "<C-j>")
nomap("n", "<C-k>")
nomap("n", "<C-s>")
nomap("n", "<leader>e")
nomap("n", "<leader>h")
nomap("n", "<leader>v")

-- add yours here

local map = vim.keymap.set

map("n", "r", "<cmd> Telescope find_files theme=ivy<CR>", { silent = true })
map("n", "R", "<cmd> Telescope current_buffer_fuzzy_find theme=cursor previewer=false<CR>")
map("i", "jk", "<ESC>", { silent = true })
map("n", "<leader>e", "<cmd> NvimTreeToggle<CR>", { silent = true })

map("n", "0", "^", { silent = true })
map("n", "J", "5j", { silent = true })
map("n", "K", "5k", { silent = true })
map("n", "<leader>q", ":<C-U>q <cr>", { silent = true })
map("n", "<leader>tf", ":<C-U>tabmove 0 <cr>", { silent = true })
map("n", "<leader>tn", ":<C-U>tabnew<cr>", { silent = true })
map("n", "<leader>tc", " X:<C-U>tabclose<cr>", { silent = true })

map("n", "<leader>we", "<C-w>=", { silent = true })
map("n", "<leader>ww", "<C-w>|<C-w>_", { silent = true })

-- lse all buffers
map("n", "<leader>X", ":bufdo bd<CR>", { silent = true })
map("n", "<leader>bc", ":BufOnly<cr>", { silent = true })
map("n", "<leader>bs", "<cmd> tab split<CR>", { silent = true })

-- using Q,W,E,R for global marks. Mapping then manually so I don't have to press shift again and agian
map("n", "mq", "mQ", { silent = true })
map("n", "mw", "mW", { silent = true })
map("n", "me", "mE", { silent = true })
map("n", "mr", "mR", { silent = true })
--for navigation
map("n", "'q", "'Qzz", { silent = true })
map("n", "'w", "'Wzz", { silent = true })
map("n", "'e", "'Ezz", { silent = true })
map("n", "'r", "'Rzz", { silent = true })

-- list marks
map("n", "mv", ":<C-U>Telescope marks<cr>", { silent = true })

map("n", "t", ":<C-U>Telescope lsp_document_symbols theme=cursor previewer=false<cr>", { silent = true })
map("n", "<leader>sp", "+p', ", { silent = true })
-- harpoon
map("n", "<leader>QQ", ":<C-U>quitall<cr>", { silent = true })
map("n", "<C-m>", ":<C-U>b#<cr>", { silent = true })
map("n", "<leader>fc", ":<C-U>Telescope lsp_incoming_calls<cr>", { silent = true })
map("n", "<leader>ut", ":<C-U>UndotreeToggle<cr>", { silent = true })

map("n", "<leader>wl", "<C-w>v", { silent = true })
map("n", "<leader>wj", "<C-w>s", { silent = true })
map("n", "<leader>wc", "<C-w>o", { silent = true })
map("n", "gi", "gi<Esc>zzi", { silent = true })

map("n", "<leader>mc", "<Plug>(VM-Find-Under, {silent=true})")
map("n", "<M-C-j>", "<Plug>(VM-Select-Cursor-Down, {silent=true})")
map("n", "<M-C-k>", "<Plug>(VM-Select-Cursor-Up, {silent=true})")

map("n", "<leader>F", "<cmd>lua require('spectre', {silent=true}).toggle()<CR>")
map("n", "zo", "zO", { silent = true })
map("n", "<leader>wt", ":<C-U>set wrap!<cr>", { silent = true })
map("n", "s", ":<C-U>HopWord<cr>", { silent = true })
map("n", "S", ":<C-U>HopLine<cr>", { silent = true })
map("n", "//", ":<C-U>HopPattern<cr>", { silent = true })
map("n", "<C-;>", "<C-\\-n>", { silent = true })
map("n", "<leader>nm", ":<C-U>Noice <CR>", { silent = true })
map("n", "<leader>nt", ":<C-U>Noice telescope<CR>", { silent = true })
map("n", "<leader>nn", ":<C-U>Noice dismiss<CR>", { silent = true })
map("n", "<leader>i", ":<C-U>IlluminateToggle<CR>", { silent = true })
map("n", "<leader>o", ":<C-U>Outline<CR>", { silent = true })
map("n", "<leader>mp", ":<C-U>MarkdownPreviewToggle<CR>", { silent = true })
map("n", "yl", "] = { '0v$", { silent = true })
map("n", "<leader>rr", ":e!<CR>", { silent = true })
map("n", "<leader>tt", ":terminal<Cr>", { silent = true })
map("n", "<leader>zm", ":ZenMode<Cr>", { silent = true })
map("n", "C", "<Plug>Markdown_Checkbox", { silent = true })
map("n", "<leader>nf", "<cmd>Oil<cr>", { silent = true })
map("n", "<leader>cs", "viwgU", { silent = true })

-- obsidian
map("n", "<leader>oo", "<cmd>ObsidianOpen<cr>", { silent = true })
map("n", "<leader>or", "<cmd>ObsidianBacklinks<cr>", { silent = true })
map("n", "<leader>ol", "<cmd>ObsidianLinks<cr>", { silent = true })
map("n", "<leader>tw", "<cmd>TailwindFoldToggle<cr>", { silent = true })

-- map("n", "<leader><leader>", function()
--   local params = {
--     command = "_typescript.organizeImports",
--     arguments = { vim.api.nvim_buf_get_name(0) },
--     title = "",
--   }
--   vim.lsp.buf.format { async = false }
--   vim.lsp.buf.execute_command(params)
--
--   if vim.bo.filetype == "prisma" then
--     vim.cmd ":e!"
--   end
-- end)

map("n", "T", function()
  local otps = {
    symbols = { "class", "method", "function" },
  }
  -- for ts, js, and .tsx files remove symbols and allow all symbols
  if vim.bo.filetype == "typescript" or vim.bo.filetype == "javascript" or vim.bo.filetype == "typescriptreact" then
    otps = {}
  end
  require("telescope.builtin").lsp_dynamic_workspace_symbols(otps)
end, { silent = true })

map("n", "<C-h>", ":<C-U>TmuxNavigateLeft<cr>", { silent = true })
map("n", "<C-l>", ":<C-U>TmuxNavigateRight<cr>", { silent = true })
map("n", "<C-j>", ":<C-U>TmuxNavigateDown<cr>", { silent = true })
map("n", "<C-k>", ":<C-U>TmuxNavigateUp<cr>", { silent = true })

-- save
map("n", "<leader>s", ":<C-U>w<CR>", { silent = true })
map("n", "<leader>S", ":<C-U>wa<CR>", { silent = true })

map("n", "gD", "<cmd>tab split | lua vim.lsp.buf.definition(, {silent=true})<CR>")

map("n", "gr", ":<C-U>Telescope lsp_references <cr>", { silent = true })

map("n", "<leader>.", "@q", { silent = true })
map("n", "<leader>ff", "<cmd> Telescope grep_string<CR>", { silent = true })
map("n", "<leader>fw", "<cmd> Telescope live_grep <CR>", { silent = true })
map("n", "<leader>fb", "<cmd> Telescope buffers theme=ivy <CR>", { silent = true })
map("n", "<leader>fo", "<cmd> Telescope oldfiles <CR>", { silent = true })

-- git
map("n", "<leader>cm", "<cmd> Telescope git_commits <CR>", { silent = true })
map("n", "<leader>gt", "<cmd> Telescope git_status <CR>", { silent = true })
map("n", "<leader>pt", "<cmd> Telescope terms <CR>", { silent = true })
map("n", "<leader>ma", "<cmd> Telescope marks <CR>", { silent = true })
map("n", "<leader>fd", "<cmd> Telescope diagnostics bufnr=0<CR>", { silent = true })
map("n", "<leader>fD", "<cmd> Telescope diagnostics<CR>", { silent = true })

-- harpoon
local harpoon = require "harpoon"

vim.keymap.set("n", "<leader>a", function()
  harpoon:list():prepend()
end)
vim.keymap.set("t", "<leader>a", function()
  harpoon:list():prepend()
end)

vim.keymap.set("n", "<leader>A", function()
  harpoon:list():append()
end)
vim.keymap.set("t", "<leader>A", function()
  harpoon:list():append()
end)

vim.keymap.set("n", "H", function()
  harpoon.ui:toggle_quick_menu(harpoon:list())
end)
vim.keymap.set("t", "H", function()
  harpoon.ui:toggle_quick_menu(harpoon:list())
end)

vim.keymap.set("n", "<C-a>", function()
  harpoon:list():select(1)
end)
vim.keymap.set("t", "<C-a>", function()
  harpoon:list():select(1)
end)

vim.keymap.set("n", "<C-s>", function()
  harpoon:list():select(2)
end)
vim.keymap.set("t", "<C-s>", function()
  harpoon:list():select(2)
end)

vim.keymap.set("n", "<C-d>", function()
  harpoon:list():select(3)
end)
vim.keymap.set("t", "<C-d>", function()
  harpoon:list():select(3)
end)

vim.keymap.set("n", "<C-f>", function()
  harpoon:list():select(4)
end)
vim.keymap.set("t", "<C-f>", function()
  harpoon:list():select(4)
end)

---
--- VISUAL
---
map("v", "<leader>sy", '"+y', { silent = true })
map("v", "<leader>sp", '"+p', { silent = true })
map("v", "<leader>mc", "<Plug>(VM-Visual-Cursors, {silent=true})")

-- INSERT
map("i", "jr", "<C-r>", { silent = true })
map("i", "<C-l>", function()
  local copilot_keys = vim.fn["copilot#Accept"]()
  if copilot_keys ~= "" then
    vim.api.nvim_feedkeys(copilot_keys, "i", true)
  else
    vim.api.nvim_feedkeys("<C-j>", "i", true)
  end
end, { silent = true })

-- TERMINAL
map("t", "<C-h>", "<C-\\><C-N>:<C-U>TmuxNavigateLeft<cr>", { silent = true })
map("t", "<C-l>", "<C-\\><C-N>:<C-U>TmuxNavigateRight<cr>", { silent = true })
map("t", "<C-j>", "<C-\\><C-N>:<C-U>TmuxNavigateDown<cr>", { silent = true })
map("t", "<C-k>", "<C-\\><C-N>:<C-U>TmuxNavigateUp<cr>", { silent = true })
map("t", "<leader>wl", "<C-\\><C-N><C-w>v", { silent = true })
map("t", "<leader>wj", "<C-\\><C-N><C-w>s", { silent = true })
-- next tab

map("t", "gt", "<C-\\><C-N>gt", { silent = true })
map("t", "gT", "<C-\\><C-N>gT", { silent = true })
map("t", "<M-n>", "<C-\\><C-N>", { silent = true })

map("n", "gh", function()
  vim.lsp.buf.hover()
end, { silent = true })

map("n", "<leader>ls", function()
  vim.lsp.buf.signature_help()
end, { silent = true })

map("n", "<leader>td", function()
  vim.lsp.buf.type_definition()
end, { silent = true })

map("n", "gd", function()
  vim.lsp.buf.definition()
end, { silent = true })

map("n", "gR", function()
  vim.lsp.buf.references()
end, { silent = true })

map("n", "<leader>f", function()
  vim.diagnostic.open_float { border = "rounded" }
end, { silent = true })

map("n", "[d", function()
  vim.diagnostic.goto_prev { float = { border = "rounded" } }
end, { silent = true })

map("n", "]d", function()
  vim.diagnostic.goto_next { float = { border = "rounded" } }
end, { silent = true })

map("n", "<leader>fi", function()
  require("telescope.builtin").find_files { find_command = { "rg", "--files", "--iglob", "!.git", "--hidden" } }
end, { silent = true })

map("n", "<leader>fg", function()
  local changed_files =
    vim.fn.systemlist "{ git status --short; git diff --name-only --cached; } | awk '{print $NF}' | sort | uniq"
  -- Filter out empty lines or potential error messages
  local valid_files = {}
  for _, file in ipairs(changed_files) do
    table.insert(valid_files, file)
  end

  -- Use Telescope to live grep through the changed files
  require("telescope.builtin").live_grep {
    search_dirs = valid_files,
  }
end, { silent = true })

map("n", "]c", function()
  if vim.wo.diff then
    return "]c"
  end
  vim.schedule(function()
    require("gitsigns").next_hunk()
  end)
  return "<Ignore>"
end, { silent = true })

map("n", "[c", function()
  if vim.wo.diff then
    return "[c"
  end
  vim.schedule(function()
    require("gitsigns").prev_hunk()
  end)
  return "<Ignore>"
end, { silent = true })

map("n", "<leader>gr", function()
  require("gitsigns").reset_hunk()
end, { silent = true })

map("n", "<leader>gp", function()
  require("gitsigns").preview_hunk()
end, { silent = true })

map("n", "<leader>gb", function()
  package.loaded.gitsigns.blame_line()
end, { silent = true })

map("n", "<leader>gd", function()
  require("gitsigns").toggle_deleted()
end, { silent = true })

map("n", "<C-i>", function()
  require("nvchad.tabufline").move_buf(1)
end, { silent = true })

map("n", "<C-u>", function()
  require("nvchad.tabufline").move_buf(-1)
end, { silent = true })

for i = 1, 9, 1 do
  map("n", string.format("<leader>%s", i), function()
    vim.api.nvim_set_current_buf(vim.t.bufs[i])
  end, { silent = true })
end
