-- local autocmd = vim.api.nvim_create_autocmd

-- Auto resize panes when resizing nvim window
-- autocmd("VimResized", {
--   pattern = "*",
--   command = "tabdo wincmd =",
-- })
--
vim.g.copilot_no_tab_map = true
vim.g.copilot_assume_mapped = true
vim.g.copilot_tab_fallback = ""

-- enable indentation , set breakpoint
-- -- enable indentation
vim.cmd "set breakindent"
vim.cmd "set linebreak"

-- ident by an additional 2 characters on wrapped lines, when line >= 40 characters, put 'showbreak' at start of line
vim.cmd "set breakindentopt=shift:2,min:40,sbr"

-- append '󱞩' to indent
vim.cmd "set showbreak=󱞩"
vim.cmd "set rnu!"

-- map ctrl + arrow keys to resize windows
vim.cmd "nnoremap <A-Up> :resize +3<CR>"
vim.cmd "nnoremap <A-Down> :resize -3<CR>"
vim.cmd "nnoremap <A-Left> :vertical resize -3<CR>"
vim.cmd "nnoremap <A-Right> :vertical resize +3<CR>"
vim.cmd "set spell"

local function AttachToPythonDebugger()
  local dap = require "dap"
  dap.run {
    type = "python",
    request = "attach",
    name = "Attach to Python debugger",
    host = "127.0.0.1",
    port = 8010, -- Change this to the port used by your debugger
  }
end

vim.cmd [[
   augroup ilikecursorline
      autocmd VimEnter * :highlight CursorLine guibg=#333333
   augroup END

]]

vim.api.nvim_set_keymap("n", "<leader>ze", "", {
  noremap = true,
  silent = true,
  callback = function()
    vim.fn.system "tmux set status off"
    vim.cmd "ZenMode"
    vim.cmd "set laststatus=0"
  end,
})

vim.api.nvim_set_keymap("n", "<leader>zd", "", {
  noremap = true,
  silent = true,
  callback = function()
    vim.fn.system "tmux set status on"
    vim.cmd "ZenMode"
    vim.cmd "set laststatus=3"
  end,
})

return {
  AttachToPythonDebugger = AttachToPythonDebugger,
}
