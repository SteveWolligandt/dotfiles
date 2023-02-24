local M = {}

function M.setup()
  local dap = require('dap')

  dap.adapters.cppdbg = {
    name = "cpptools",
    type = "executable",
    port = "4711",
    command = vim.fn.stdpath("data") .. '/mason/bin/OpenDebugAD7',
  }

  dap.adapters.codelldb = {
    name = "codelldb server",
    type = 'server',
    port = "${port}",
    executable = {
      command = vim.fn.stdpath("data") .. '/mason/bin/codelldb',
      args = { "--port", "${port}" },
    }
  }
end
return M
