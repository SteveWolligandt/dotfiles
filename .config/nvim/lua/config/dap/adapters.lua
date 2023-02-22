local M = {}


function M.setup()
  local dap = require('dap')
  --M.start_c_debugger = function(args, mi_mode, mi_debugger_path)
  --  local dap = require "dap"
  --  if args and #args > 0 then
  --      last_gdb_config = {
  --          type = "cpp",
  --          name = args[1],
  --          request = "launch",
  --          program = table.remove(args, 1),
  --          args = args,
  --          cwd = vim.fn.getcwd(),
  --          externalConsole = false,
  --          MIMode = "gdb",
  --          MIDebuggerPath = "/usr/bin/gdb"
  --        }
  --  end
  --
  --  if not last_gdb_config then
  --      print('No binary to debug set! Use ":DebugC <binary> <args>" or ":DebugRust <binary> <args>"')
  --      return
  --  else 
  --      print('hooray')
  --  end
  --
  --  dap.run(last_gdb_config)
  --end

  dap.adapters.cpptools = {
    type = 'executable';
    name = "cpptools",
    command = os.getenv('HOME') .. '/.local/share/nvim/mason/packages/cpptools/extension/debugAdapters/bin/OpenDebugAD7',
    args = {},
    attach = {
      pidProperty = "processId",
      pidSelect = "ask"
    },
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
  --dap.setup('/usr/bin/python')
end
return M
