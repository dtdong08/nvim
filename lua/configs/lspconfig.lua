local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities
local lspconfig = require "lspconfig"

-- automatic setup
local servers = { "clangd" }
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,
  }
end

lspconfig.lua_ls.setup {
  settings = {
    Lua = {
      runtime = {
        version = 'LuaJIT',
      },
      diagnostics = {
        globals = {
          'vim',
          'require'
        },
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true),
      },
    },
  },
}

lspconfig.tinymist.setup {
	settings = {
		formatterMode = "typstyle",
		exportPdf = "onType",
		semanticTokens = "disable"
	}
}

-- SETUP FOR CLANGD by @dattran
-- local servers = { clangd = {} }
-- require('mason').setup()
-- require('mason-tool-installer').setup { ensure_installed = { ' clangd' } }
-- require('mason-lspconfig').setup {
-- 	handlers = {
-- 		function(server_name)
-- 			local server = servers[server_name] or {}
-- 			server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
-- 			require('lspconfig')[server_name].setup(server)
-- 		end,
-- 	},
-- }
