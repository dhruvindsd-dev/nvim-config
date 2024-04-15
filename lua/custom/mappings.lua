---@type MappingsTable
local M = {}

M.general = {
  n = {
    ["0"] = { "^", "Start of the line", opts = { nowait = true } },
    ["J"] = { "5j", "Down", opts = { nowait = true } },
    ["K"] = { "5k", "Up", opts = { nowait = true } },
    ["<leader>q"] = { ":<C-U>q<cr>", "quit", opts = { nowait = true } },
    ["<leader>tf"] = { ":<C-U>tabmove 0 <cr>", "Tab first", opts = { silent = true } },
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
    ["<leader>X"] = { ":bufdo bd<CR>", "Close all buffers", opts = { noremap = true, silent = true } },
    ["<leader>bc"] = { ":BufOnly<cr>", "Close all buffers", opts = { noremap = true, silent = true } },
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
      ":<C-U>Telescope lsp_document_symbols theme=cursor previewer=false<cr>",
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
    ["<leader>QQ"] = { ":<C-U>quitall<cr>", "Quit", opts = { silent = true } },
    ["<C-m>"] = { ":<C-U>b#<cr>", "Last buffer", opts = { silent = true } },
    ["<leader>fc"] = { ":<C-U>Telescope lsp_incoming_calls<cr>", "Last buffer", opts = { silent = true } },
    ["<leader>ut"] = { ":<C-U>UndotreeToggle<cr>", "Undo tree", opts = { silent = true } },

    ["<leader>wl"] = { "<C-w>v", "Vertical Split" },
    ["<leader>wj"] = { "<C-w>s", "Horizontal Split" },
    ["<leader>wc"] = { "<C-w>o", "Close all splits" },
    ["gi"] = { "gi<Esc>zzi" },

    ["<leader>mc"] = { "<Plug>(VM-Find-Under)" },
    ["<M-C-j>"] = { "<Plug>(VM-Select-Cursor-Down)" },
    ["<M-C-k>"] = { "<Plug>(VM-Select-Cursor-Up)" },

    ["<leader>F"] = { "<cmd>lua require('spectre').toggle()<CR>", opts = { silent = true } },
    ["zo"] = { "zO" },
    ["<leader>wt"] = { ":<C-U>set wrap!<cr>", "Toggle word wrap", opts = { silent = true } },
    ["s"] = { ":<C-U>HopWord<cr>", "Hop word", opts = { silent = true } },
    ["//"] = { ":<C-U>HopPattern<cr>", "Hop word", opts = { silent = true } },
    ["<C-;>"] = { "<C-\\-n>", "Normal mode from terminal", opts = { silent = true } },
    ["<leader>nm"] = { ":<C-U>Noice <CR>", "Noice messages in a split", opts = { silent = true } },
    ["<leader>nn"] = { ":<C-U>NoiceDismiss<CR>", "Dismiss noise messages", opts = { silent = true } },
    ["<leader>i"] = { ":<C-U>IlluminateToggle<CR>", "Toggle vim illuminate", opts = { silent = true } },
    ["<leader>o"] = { ":<C-U>Outline<CR>", "Toggle outlines", opts = { silent = true } },
    ["<leader>mp"] = { ":<C-U>MarkdownPreviewToggle<CR>", "Preview Markdown", opts = { silent = true } },
    ["yl"] = { 'v$"+y', "Yank line", opts = { silent = true } },
    ["<leader>c"] = { ":lua require('toggle-checkbox').toggle()<CR>", "Toggle checkbox", opts = { silent = true } },
    ["<leader>rr"] = { ":e!<CR>", "Reload file", opts = { silent = true } },
    ["<leader>hn"] = { ":lua require('harpoon'):list():next()<Cr>" },
    ["<leader>hb"] = { ":lua require('harpoon'):list():prev()<Cr>" },
  },
  v = {
    ["<leader>sy"] = { '"+y', "Copy to system clipboard", { opts = { silent = true } } },
    ["<leader>sp"] = { '"+p', "Paste from system clipboard", opts = { silent = true } },
    ["<leader>mc"] = { "<Plug>(VM-Visual-Cursors)" },
  },
  i = {
    ["jr"] = { "<C-r>", "select register" },
  },
  t = {
    ["<C-h>"] = { "<C-\\><C-N>:<C-U>TmuxNavigateLeft<cr>", "Window left", opts = { silent = true } },
    ["<C-l>"] = { "<C-\\><C-N>:<C-U>TmuxNavigateRight<cr>", "Window right", opts = { silent = true } },
    ["<C-j>"] = { "<C-\\><C-N>:<C-U>TmuxNavigateDown<cr>", "Window down", opts = { silent = true } },
    ["<C-k>"] = { "<C-\\><C-N>:<C-U>TmuxNavigateUp<cr>", "Window up", opts = { silent = true } },
    ["<leader>wl"] = { "<C-\\><C-N><C-w>v", "Vertical Split" },
    ["<leader>wj"] = { "<C-\\><C-N><C-w>s", "Horizontal Split" },
    -- next tab
    ["gt"] = { "<C-\\><C-N>gt", "Next tab", opts = { silent = true } },
    ["gT"] = { "<C-\\><C-N>gT", "Prev tab", opts = { silent = true } },
  },
}

return M
