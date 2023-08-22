local M = {}
--------------------------------------------------------------------------------
function M.setup()
  local dap = require('dap')
  dap.adapters.cppdbg = {
    name = 'cppdbg',
    type = 'executable',
    command = vim.fn.stdpath('data') .. '/mason/bin/OpenDebugAD7',
  }
   dap.configurations.cpp = {
    {
      name = 'Debug Program',
      type = 'cppdbg',
      request = 'launch',
      MIMode = 'gdb',
      cwd = '${workspaceFolder}',
      -- udb='live',
      -- miDebuggerPath = 'udb',
      setupCommands= {
				{
					description= "Enable pretty-printing for gdb",
					text= "-enable-pretty-printing",
					ignoreFailures= true,
				}
      },
      stopAtEntry = true,
      program = 'main',
    },
   }
  dap.configurations.h = dap.configurations.cpp
end
return M
