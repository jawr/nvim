require("lsp.null-ls")

local lspconfig = require("lspconfig")
local on_attach = require("lsp.on_attach")

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)

local servers = {
	pyright = {
		on_attach = function(client, buffrn)
			-- use null-ls for formatting
			client.resolved_capabilities.document_formatting = false
			client.resolved_capabilities.document_range_formatting = false
		end,
	},
	tsserver = {
		on_attach = function(client, buffrn)
			-- use null-ls for formatting
			client.resolved_capabilities.document_formatting = false
			client.resolved_capabilities.document_range_formatting = false
			local ts_utils = require("nvim-lsp-ts-utils")
			ts_utils.setup({})
			ts_utils.setup_client(client)
		end,
	},
	gopls = {
		on_attach = function(client, buffrn)
			-- use null-ls for formatting
			client.resolved_capabilities.document_formatting = false
			client.resolved_capabilities.document_range_formatting = false
		end,
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
		root_dir = lspconfig.util.root_pattern(
			"package.json",
			"tsconfig.json",
			"jsconfig.json",
			"yarn.lock",
			".git",
			"go.mod"
		),
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
		},
	}

	if custom["capabilities"] ~= nil then
		config["capabilities"] = custom["capabilities"]
	end

	if custom["settings"] ~= nil then
		config["settings"] = custom["settings"]
	end

	if custom["on_attach"] ~= nil then
		config["on_attach"] = custom["on_attach"]
	end

	if custom["root_dir"] ~= nil then
		config["root_dir"] = custom["root_dir"]
	end

	lspconfig[server].setup(config)
end
