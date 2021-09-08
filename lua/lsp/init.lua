require('lsp.null-ls')

local lspconfig = require('lspconfig')
local on_attach = require("lsp.on_attach")


local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

local servers = { 
	pyright = {
    on_attach = function(client, buffrn)
      -- use null-ls for formatting
      client.resolved_capabilities.document_formatting = false
      client.resolved_capabilities.document_range_formatting = false
    end
  },
	tsserver = {
    on_attach = function(client, buffrn)
      -- use null-ls for formatting
      client.resolved_capabilities.document_formatting = false
      client.resolved_capabilities.document_range_formatting = false
      local ts_utils = require("nvim-lsp-ts-utils")
      ts_utils.setup({})
      ts_utils.setup_client(client)
    end
  },
  gopls = {
    settings = {
      gopls = {
        analyses = {
          unusedparams = true,
        },
        staticcheck = true,
      },
    },
  },
  ["null-ls"] = {
    root_dir = lspconfig.util.root_pattern("package.json", "tsconfig.json", "jsconfig.json", "yarn.lock")
  },
}

for server, custom in pairs(servers) do
  local config = {
    autostart = true,
    on_attach = on_attach,
    capabilities = capabilities,
    flags = {
      debounce_text_changes = 200,
      allow_incremental_sync = true,
    }
  }

  if custom['capabilities'] ~= nil then
    config['capabilities'] = custom['capabilities']
  end

  if custom['settings'] ~= nil then
    config['settings'] = custom['settings']
  end

  if custom['on_attach'] ~= nil then
    config['on_attach'] = custom['on_attach']
  end

  if custom['root_dir'] ~= nil then
    config['root_dir'] = custom['root_dir']
  end

  lspconfig[server].setup(config)
end

-- go specifics 
function goimports(timeout_ms)
    local context = { only = { "source.organizeImports" } }
    vim.validate { context = { context, "t", true } }

    local params = vim.lsp.util.make_range_params()
    params.context = context

    -- See the implementation of the textDocument/codeAction callback
    -- (lua/vim/lsp/handler.lua) for how to do this properly.
    local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, timeout_ms)
    if not result or next(result) == nil then return end
    local actions = result[1].result
    if not actions then return end
    local action = actions[1]

    -- textDocument/codeAction can return either Command[] or CodeAction[]. If it
    -- is a CodeAction, it can have either an edit, a command or both. Edits
    -- should be executed first.
    if action.edit or type(action.command) == "table" then
      if action.edit then
        vim.lsp.util.apply_workspace_edit(action.edit)
      end
      if type(action.command) == "table" then
        vim.lsp.buf.execute_command(action.command)
      end
    else
      vim.lsp.buf.execute_command(action)
    end
end

vim.api.nvim_command [[autocmd BufWritePre *.go lua goimports(1000) ]]
