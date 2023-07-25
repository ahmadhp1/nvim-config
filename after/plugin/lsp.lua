---@diagnostic disable: undefined-global


local lsp = require('lsp-zero').preset({})

lsp.on_attach(function(client, bufnr)
    lsp.default_keymaps({ buffer = bufnr })
end)

lsp.skip_server_setup({ 'rust_analyzer' })

lsp.setup()

local dart_lsp = lsp.build_options('dartls', {})

require('flutter-tools').setup({
    lsp = {
        capabilities = dart_lsp.capabilities
    },
    debugger = {
        enabled = true,
        run_via_dap = false,
        register_configurations = function(_)
            print(" hello ");
            require("dap").configurations.dart = {
                {
                    name = "main_dev",
                    cwd = "${workspaceFoler}",
                    program = "lib/main_dev.dart",
                    request = "launch",
                    type = "dart",
                }
            }
            require("dap.ext.vscode").load_launchjs()
        end,
    },
})

local rust_tools = require('rust-tools')

rust_tools.setup({
    server = {
        on_attach = function(_, bufnr)
        end
    }
})

local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()

cmp.setup({
    mapping = {
        ['<Tab>'] = cmp.mapping.confirm({ select = false }),
        ['<C-Space>'] = cmp.mapping.complete(),
    }
})
