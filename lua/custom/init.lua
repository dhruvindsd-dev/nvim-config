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

-- spell check
vim.cmd "hi IlluminatedWordRead guibg=lightgreen guifg=black"

vim.opt.cursorline = true

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

return {
  AttachToPythonDebugger = AttachToPythonDebugger,
}
