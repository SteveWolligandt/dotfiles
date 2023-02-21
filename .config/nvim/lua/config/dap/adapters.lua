local M = {}
function M.setup()
  require('dap').adapters.cpp = {
    type = 'executable';
    name = "cppdbg",
    command = '/u/stewol9h/.local/share/nvim/mason/packages/cpptools/extension/debugAdapters/bin/OpenDebugAD7',
    args = {},
    attach = {
      pidProperty = "processId",
      pidSelect = "ask"
    },
  }
end
return M
