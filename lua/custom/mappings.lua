---@type MappingsTable
local M = {}

M.general = {
  n = {
    ["0"] = { "^", "Start of the line", opts = { nowait = true } },
    ["J"] = { "5j", "Down", opts = { nowait = true } },
    ["K"] = { "5k", "Up", opts = { nowait = true } },
    ["<leader>q"] = { ":<C-U>q<cr>", "quit", opts = { nowait = true } },
    ["<leader>tn"] = { ":<C-U>tabnew<cr>", "new tab", opts = { silent = true } },
    ["<leader>tc"] = { " X:<C-U>tabclose<cr>", "close tab", opts = { silent = true } },

    ["<leader><leader>"] = {
      function()
        local params = {
          command = "_typescript.organizeImports",
          arguments = { vim.api.nvim_buf_get_name(0) },
          title = "",
        }
        vim.lsp.buf.format { async = false }
        vim.lsp.buf.execute_command(params)

        if vim.bo.filetype == "prisma" then
          vim.cmd ":e!"
        end
      end,
      "LSP formatting",
    },
    ["<leader>we"] = { "<C-w>=", "resize splits " },
    -- maximise vertical and horizontal splits
    ["<leader>wm"] = { "<C-w>|<C-w>_", "maximise vertical and horizontal splits" },

    -- lse all buffers
    ["<leader>X"] = { ":bufdo bd<CR>", "Close all buffers", opts = { silent = true } },
    ["<leader>bc"] = { ":BufOnly<cr>", "Close all buffers", opts = { noremap = true, silent = true } },
    ["<leader>bf"] = { "<cmd> Telescope buffers <CR>", "Find buffers" },
    ["<leader>bs"] = {
      "<cmd> tab split<CR>",
      "Open current buffer in new tab",
      opts = { noremap = true, silent = true },
    },

    -- using Q,W,E,R for global marks. Mapping then manually so I don't have to press shift again and agian
    ["mq"] = { "mQ", "set global mark Q" },
    ["mw"] = { "mW", "set global mark W" },
    ["me"] = { "mE", "set global mark E" },
    ["mr"] = { "mR", "set global mark R" },
    --for navigation
    ["'q"] = { "'Qzz", "jump to global mark Q" },
    ["'w"] = { "'Wzz", "jump to global mark W" },
    ["'e"] = { "'Ezz", "jump to global mark E" },
    ["'r"] = { "'Rzz", "jump to global mark R" },

    -- list marks
    ["mv"] = { ":<C-U>Telescope marks<cr>", "list marks", { opts = { silent = true } } },

    ["t"] = {
      ":<C-U>Telescope lsp_document_symbols theme=cursor preview=false<cr>",
      "document symbols",
      { opts = { silent = true } },
    },
    ["T"] = {
      function()
        local otps = {
          symbols = { "class", "method", "function" },
        }
        -- for ts, js, and .tsx files remove symbols and allow all symbols
        if
          vim.bo.filetype == "typescript"
          or vim.bo.filetype == "javascript"
          or vim.bo.filetype == "typescriptreact"
        then
          otps = {}
        end
        require("telescope.builtin").lsp_dynamic_workspace_symbols(otps)
      end,
      "workspace symbols",
      { opts = { silent = true } },
    },
    ["<leader>sp"] = { '"+p', "Paste from system clipboard", opts = { silent = true } },
    -- harpoon
    ["<leader>a"] = { ":<C-U> lua require('harpoon.mark').add_file()<cr>ma", "Add File", opts = { silent = true } },
    ["H"] = {
      ":<C-U> lua require('harpoon.ui').toggle_quick_menu()<cr>",
      "Files View",
      opts = { silent = true },
    },
    ["<leader>hn"] = {
      ":<C-U> lua require('harpoon.ui').nav_next()<cr>",
      "Next Mark",
      opts = { silent = true },
    },
    ["<leader>hp"] = {
      ":<C-U> lua require('harpoon.ui').nav_prev()<cr>",
      "Prev Mark",
      opts = { silent = true },
    },
    ["<C-a>"] = { ":<C-U> lua require('harpoon.ui').nav_file(1)<cr>'a", "1", opts = { silent = true } },
    ["<C-s>"] = { ":<C-U> lua require('harpoon.ui').nav_file(2)<cr>'a", "2", opts = { silent = true } },
    ["<C-d>"] = { ":<C-U> lua require('harpoon.ui').nav_file(3)<cr>'a", "3", opts = { silent = true } },
    ["<C-f>"] = { ":<C-U> lua require('harpoon.ui').nav_file(4)<cr>'a", "4", opts = { silent = true } },
    ["<leader>QQ"] = { ":<C-U>quitall<cr>", "Quit", opts = { silent = true } },
    ["<C-m>"] = { ":<C-U>b#<cr>", "Last buffer", opts = { silent = true } },
    ["<leader>fc"] = { ":<C-U>Telescope lsp_incoming_calls<cr>", "Last buffer", opts = { silent = true } },
    ["<leader>ut"] = { ":<C-U>UndotreeToggle<cr>", "Undo tree", opts = { silent = true } },

    ["<leader>wl"] = { "<C-w>v", "Vertical Split" },
    ["<leader>wj"] = { "<C-w>s", "Horizontal Split" },
    ["<leader>wc"] = { "<C-w>o", "Close all splits" },
    ["gi"] = { "gi<Esc>zzi" },

    -- vim visual multi
    ["<leader>mc"] = { "<Plug>(VM-Find-Under)" },
    ["<leader>F"] = { "<cmd>lua require('spectre').toggle()<CR>", opts = { silent = true } },
    ["zo"] = { "zO" },

    ["<leader>wt"] = { ":<C-U>set wrap!<cr>", "Toggle word wrap", opts = { silent = true } },
  },
  v = {
    ["<leader>sy"] = { '"+y', "Copy to system clipboard", { opts = { silent = true } } },
    ["<leader>sp"] = { '"+p', "Paste from system clipboard", opts = { silent = true } },
    ["<leader>mc"] = { "<Plug>(VM-Visual-Cursors)" },
  },
  i = {
    ["jr"] = { "<C-r>", "select register" },
  },
}

return M
