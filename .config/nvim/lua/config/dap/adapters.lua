local M = {}

function M.pick_one(items, prompt, cb)
  local co
  if not cb then
    co = coroutine.running()
    if co then
      cb = function(item)
        coroutine.resume(co, item)
      end
    end
  end
  cb = vim.schedule_wrap(cb)
  if vim.ui then
    vim.ui.select(items, {
      prompt = prompt,
      format_item = function(item) return item end
    }, cb)
  else
    local result = M.pick_one_sync(items, prompt)
    cb(result)
  end
  if co then
    return coroutine.yield()
  end
end
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

  dap.configurations.cpp = {
    {
      name = 'Attach PID',
      type = 'cppdbg',
      request = 'attach',
      program = '/u/stewol9h/dev1/star/lib/linux-x86_64-2.17/gnu11.2/lib/StarPhysicsDataSource_gtest',
      processId = function()
        -- execute linux ps and get PIDs and process names. write the output to a tmp file
        local n = os.tmpname()
        os.execute('ps -eo pid,comm > '.. n)

        -- read the tmp file line by line
        local processes = {}
        local first = true -- for omitting table header line
        for line in io.lines(n) do
          if first then
            first = false
          else
            table.insert(processes, line)
          end
        end

        local pid = pick_one(processes, "Select process")
        local line = {}
        for token in string.gmatch(item, "[^%s]+") do
          table.insert(line, token)
        end
        pid = line[1]
        print(pid)
        return pid
      end,
    }
  }
end
return M
