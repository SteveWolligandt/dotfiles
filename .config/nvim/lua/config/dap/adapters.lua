local M = {}
--------------------------------------------------------------------------------
function M.init()
  M.tmpFile = os.tmpname()
  os.execute('whoami > '.. M.tmpFile)
  local whoamiFile = io.open(M.tmpFile, 'r')
  M.user = whoamiFile:read()
  whoamiFile:close()
  M.psCommand = 'ps -u '..M.user..' -U '..M.user..' u > '.. M.tmpFile
  vim.inspect(M)
end
--------------------------------------------------------------------------------
function M.inputAndWait(prompt)
  local co = coroutine.running()
  if co then
    cb = function(item)
      coroutine.resume(co, item)
    end
  end
  cb = vim.schedule_wrap(cb)

  vim.ui.input({
     prompt = "Enter program: ",
     default = '',
     completion = "file",
  }, cb)
  if co then
    return coroutine.yield()
  end
end
--------------------------------------------------------------------------------
function M.selectAndWait(items, prompt, format)
  local co = coroutine.running()
  if co then
    cb = function(item)
      coroutine.resume(co, item)
    end
  end
  cb = vim.schedule_wrap(cb)
  vim.ui.select(items, {
    prompt = prompt,
    format_item = format
  }, cb)
  if co then
    return coroutine.yield()
  end
end
--------------------------------------------------------------------------------
function M.processesWithName(name) 
  os.execute('ps | grep ' .. name .. ' > M.tmpFile')
  -- read the tmp file line by line
  local processes = {}
  for line in io.lines(M.tmpFile) do
    table.insert(processes, line)
  end
  return processes
end
--------------------------------------------------------------------------------
function M.processesOfUser() 
  os.execute(M.psCommand)
  -- read the tmp file line by line
  local processes = {}
  local first = true -- for omitting table header line
  for processString in io.lines(M.tmpFile) do
    if first then
      first = false
    else 
      local process = {}
      for token in string.gmatch(processString, '[^%s]+') do
        table.insert(process, token)
      end
      table.insert(processes, process)
    end
  end
  return processes
end
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
      name = 'Attach to StarCCM+ process',
      type = 'cppdbg',
      request = 'attach',
      MIMode = 'gdb',
      udb='live',
      miDebuggerPath = 'udb',
      setupCommands= {
				{
					description= "Enable pretty-printing for gdb",
					text= "-enable-pretty-printing",
					ignoreFailures= true,
				}
      },
      program = "${workspaceFolder}/lib/linux-x86_64-2.17/gnu11.2/lib/star-ccm+",
      processId = function()
        local process = M.selectAndWait(
          M.processesOfUser(),
          'Select process',
          function(process)
            return process[11] .. ' ('..process[2]..')'
          end)
        local pid = process[2]
        -- local path = process[11]
        -- print(pid .. ', ' .. path)
        -- dap.configurations.cpp[1].program = path
        return pid
      end,
    },

    {
      name = 'Debug Program',
      type = 'cppdbg',
      request = 'launch',
      MIMode = 'gdb',
      cwd = '${workspaceFolder}',
      udb='live',
      miDebuggerPath = 'udb',
      setupCommands= {
				{
					description= "Enable pretty-printing for gdb",
					text= "-enable-pretty-printing",
					ignoreFailures= true,
				}
      },
      stopAtEntry = true,
      program = function()
        local program = M.inputAndWait('Select program')
        print(program)
        return program
      end,
    },

    {
      name = 'Debug Program',
      type = 'cppdbg',
      request = 'launch',
      MIMode = 'gdb',
      cwd = '${workspaceFolder}',
      udb='live',
      miDebuggerPath = 'udb',
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
M.init()
return M
