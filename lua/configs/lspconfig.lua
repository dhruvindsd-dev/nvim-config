-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()
local lspconfig = require "lspconfig"

-- EXAMPLE
local servers = {
  "html",
  "cssls",
  "html",
  "cssls",
  "ts_ls",
  "clangd",
  "emmet_ls",
  "bashls",
  "prismals",
  "lua_ls",
  "jsonls",
  "marksman",
}

local nvlsp = require "nvchad.configs.lspconfig"

local function attach(client, bufnr)
  nvlsp.on_attach(client, bufnr)
  local function opts(desc)
    return { buffer = bufnr, desc = "LSP " .. desc }
  end

  local map = vim.keymap.set
  map("n", "<leader>wl", "<C-w>v", opts "window v split")
  map("n", "<leader>wj", "<C-w>s", opts "window h split")
  map("n", "<leader>wc", "<C-w>o", opts "close splits")

  map("n", "gi", "gi<Esc>zzi", opts "insert mode at last position")

  map("n", "gr", ":<C-U>Telescope lsp_references <cr>", opts "telescope references")
  map("n", "gR", vim.lsp.buf.references, opts "references in quickfix")

  map("n", "gD", "<cmd>tab split | lua vim.lsp.buf.definition()<CR>", opts "go to definition in new tab")
end

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  }
end

lspconfig.cssmodules_ls.setup {
  on_attach = function(client)
    --  disabling `go to definition` for cssmodules_ls, since it interferes with typescript's go to definition
    client.server_capabilities.definitionProvider = false
    attach(client)
  end,

  -- optionally
  init_options = {
    camelCase = false,
  },
}

lspconfig.tailwindcss.setup {
  on_attach = attach,
  capabilities = nvlsp.capabilities,
  settings = {
    tailwindCSS = {
      experimental = {
        classRegex = {
          "cva\\(([^)]*)\\)",
          "[\"'`]([^\"'`]*).*?[\"'`]",
        },
      },
    },
  },
}

lspconfig.pyright.setup {
  on_attach = attach,
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

lspconfig.mdx_analyzer.setup {
  on_attach = attach,
  capabilities = nvlsp.capabilities,
  filetypes = { "markdown", "mdx" },
  settings = { { typescript = { enable = true } } },
  init_options = {
    typescript = {
      enable = true,
    },
  },
}

lspconfig.eslint.setup {
  on_attach = attach,
  capabilities = nvlsp.capabilities,
  filetypes = {
    "javascript",
    "javascriptreact",
    "javascript.jsx",
    "typescript",
    "typescriptreact",
    "typescript.tsx",
    "vue",
    "svelte",
    "astro",
    "markdown",
    "mdx",
  },
}
