-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"

-- EXAMPLE
local servers =
  { "html", "cssls", "html", "cssls", "tsserver", "clangd", "emmet_ls", "bashls", "prismals", "tailwindcss" }
local nvlsp = require "nvchad.configs.lspconfig"

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  }
end

-- configuring single server, example: typescript
-- lspconfig.tsserver.setup {
--   on_attach = nvlsp.on_attach,
--   on_init = nvlsp.on_init,
--   capabilities = nvlsp.capabilities,
-- }
--
lspconfig.cssmodules_ls.setup {
  on_attach = function(client)
    --  disabling `go to definition` for cssmodules_ls, since it interferes with typescript's go to definition
    client.server_capabilities.definitionProvider = false
    nvlsp.on_attach(client)
  end,

  -- optionally
  init_options = {
    camelCase = false,
  },
}

lspconfig.pyright.setup {
  on_attach = nvlsp.on_attach,
  capabilities = nvlsp.capabilities,
  settings = {
    python = {
      analysis = {
        autoSearchPaths = true,
        diagnosticMode = "workspace",
        useLibraryCodeForTypes = true,
      },
    },
  },
}
