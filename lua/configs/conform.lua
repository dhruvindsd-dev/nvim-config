local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    html = { "prettierd" },
    markdown = { "prettierd" },
    bash = { "beautifysh" },
    css = { "prettierd" },
    scss = { "prettierd" },
    json = { "prettierd" },
    yaml = { "prettierd" },
    javascript = { "prettierd" },
    typescript = { "prettierd" },
    javascriptreact = { "prettierd" },
    typescriptreact = { "prettierd" },
    htmldjango = { "prettierd" },
    xhtml = { "prettierd" },
    graphql = { "prettierd" },
    python = { "isort", "black", "autoflake" },
  },
  formatters = {
    black = { prepend_args = { "--line-length", "120", "--fast" } },
    autoflake = { prepend_args = { "--remove-all-unused-imports" } },
  },

  -- format_on_save = {
  --   -- These options will be passed to conform.format()
  --   timeout_ms = 500,
  --   lsp_fallback = true,
  -- },
}

return options
