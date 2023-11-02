local h = require "null-ls.helpers"
local methods = require "null-ls.methods"
local FORMATTING = methods.internal.FORMATTING

local present, null_ls = pcall(require, "null-ls")

if not present then
  return
end

local b = null_ls.builtins

local sources = {
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
  b.formatting.black.with { extra_args = { "--line-length", "120", "--fast" } },

  -- the `prima cli` does not output in stdout. Creating a custom formatter for it
  h.make_builtin {
    name = "prismaFmt",
    method = FORMATTING,
    filetypes = { "prisma" },
    generator_opts = {
      command = "prisma",
      args = { "format", "$FILENAME" },
      to_stdin = false,
    },
    factory = function(opts)
      -- ignore errors unless otherwise specified
      if opts.ignore_stderr == nil then
        opts.ignore_stderr = true
      end

      -- for formatters, to_temp_file only works if from_temp_file is also set
      if opts.to_temp_file then
        opts.from_temp_file = true
      end

      opts.on_output = function(_, done)
        return done
      end

      return require("null-ls.helpers").generator_factory(opts)
    end,
  },
}

null_ls.setup {
  debug = true,
  sources = sources,
}
