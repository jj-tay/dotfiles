local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

-- if you just want default config for the servers then put them in a table
local servers = {
  "html",
  "cssls",
  "tsserver",
  "clangd",
  "ansiblels",
  "awk_ls",
  "bashls",
  "docker_compose_language_service",
  "dockerls",
  "dotls",
  "jqls",
  "jsonls",
  "marksman",
  "r_language_server",
  "sqlls",
  "terraformls",
  "texlab",
  "yamlls",
  "pyright"
}

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

-- 
-- lspconfig.pyright.setup { blabla}
