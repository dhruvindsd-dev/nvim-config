local present, null_ls = pcall(require, "null-ls")

if not present then
  return
end

local b = null_ls.builtins

local sources = {

  -- webdev stuff
  --  configure pretter to work with react, typescript, javascript, css, html
  b.formatting.prettier.with {
    filetypes = {
      "html",
      "markdown",
      "css",
      "scss",
      "json",
      "yaml",
      "javascript",
      "javascriptreact",
      "typescript",
      "typescriptreact",
    },
  },

  -- Lua
  b.formatting.stylua,

  -- cpp
  b.formatting.clang_format,

  b.formatting.black.with { extra_args = { "--line-length", "120", "--fast" } },
}

null_ls.setup {
  debug = false,
  sources = sources,
}
