local lsp = require('lsp-zero').preset({})

lsp.on_attach(function(client, bufnr)
  lsp.default_keymaps({buffer = bufnr})
  vim.keymap.set("n", "<leader>ca", function()
     vim.lsp.buf.code_action()
 end)
end)
lsp.skip_server_setup({'rust_analyzer'})

lsp.setup()

local dart_lsp = lsp.build_options('dartls', {})

require('flutter-tools').setup({
  lsp = {
    capabilities = dart_lsp.capabilities
  }
})
local rust_tools = require('rust-tools')

rust_tools.setup({
  server = {
    on_attach = function(_, bufnr)
      vim.keymap.set('n', '<leader>ca', rust_tools.hover_actions.hover_actions, {buffer = bufnr})
    end
  }
})

local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()

cmp.setup({
  mapping = {
    ['<Tab>'] = cmp.mapping.confirm({select = false}),
    ['<C-Space>'] = cmp.mapping.complete(),
  }
})

