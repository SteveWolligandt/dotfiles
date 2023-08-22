local M = {}
--------------------------------------------------------------------------------
M.initialized = false
--------------------------------------------------------------------------------
function M.breakpoints_path()
  local cwd = vim.fn.getcwd()
  local cache_path = cwd .. '/.cache'
  cache_path = vim.fn.resolve(cache_path)
  if (not M.exists(cache_path)) then
    os.execute("mkdir " .. cache_path)
  end
  local cache_dap_path = cache_path .. '/dap'
  cache_dap_path = vim.fn.resolve(cache_path)
  if (not M.exists(cache_dap_path)) then
    os.execute("mkdir " .. cache_dap_path)
  end
  local bp_path = cache_dap_path .. '/breakpoints.json'
  bp_path = vim.fn.resolve(bp_path)
  if (not M.exists(bp_path)) then
    local file = io.open(bp_path, "w")
    if file ~= nil then
      file:write("{}")
      file:close()
    -- else
    --   error('could not open breakpoints file', 1)
    end
  end
  return bp_path
end
--------------------------------------------------------------------------------
function M.store_breakpoints(clear)
  local bp_path = M.breakpoints_path()
  local bps_file = io.open(bp_path)
  if bps_file == nil then
    return
  end
  local load_bps_raw = bps_file:read("*a")
  local bps = vim.fn.json_decode(load_bps_raw)
  local breakpoints = require('dap.breakpoints')
  local breakpoints_by_buf = breakpoints.get()
  if (clear) then
    for _, bufrn in ipairs(vim.api.nvim_list_bufs()) do
      local file_path = vim.api.nvim_buf_get_name(bufrn)
      if (bps[file_path] ~= nil) then
        bps[file_path] = {}
      end
    end
  else
    for buf, buf_bps in pairs(breakpoints_by_buf) do
      bps[vim.api.nvim_buf_get_name(buf)] = buf_bps
    end
  end
  local fp = io.open(bp_path, 'w')
  local final = vim.fn.json_encode(bps)
  fp:write(final)
  fp:close()
end
--------------------------------------------------------------------------------
function M.load_breakpoints()
  local fp = io.open(M.breakpoints_path(), 'r')
  if fp == nil then return end
  local content = fp:read('*a')
  local bps = vim.fn.json_decode(content)
  local loaded_buffers = {}
  local found = false
  for _, buf in ipairs(vim.api.nvim_list_bufs()) do
    local file_name = vim.api.nvim_buf_get_name(buf)
    if (bps[file_name] ~= nil and bps[file_name] ~= {}) then
      found = true
    end
    loaded_buffers[file_name] = buf
  end
  if (found == false) then
    return
  end
  for path, buf_bps in pairs(bps) do
    for _, bp in pairs(buf_bps) do
      local line = bp.line
      local opts = {
        condition = bp.condition,
        log_message = bp.logMessage,
        hit_condition = bp.hitCondition
      }
      local breakpoints = require('dap.breakpoints')
      breakpoints.set(opts, tonumber(loaded_buffers[path]), line)
    end
  end
end
--------------------------------------------------------------------------------
function M.execute(text, callback)
  local dap = require 'dap'
  local session = dap.session()
  if session ~= nil then
    dap.session():evaluate(text, evaluate_handler, callback)
  end
end
--------------------------------------------------------------------------------
--- Check if a file or directory exists in this path
function M.exists(file)
   local ok, err, code = os.rename(file, file)
   if not ok then
      if code == 13 then
         -- Permission denied, but it exists
         return true
      end
   end
   return ok, err
end
--------------------------------------------------------------------------------
--- Check if a directory exists in this path
function M.isdir(path)
   -- "/" works on both Unix and Windows
   return M.exists(path.."/")
end
--------------------------------------------------------------------------------
function M.init()
  if not M.initialized then
    M.tmpFile = os.tmpname()
    os.execute('whoami > '.. M.tmpFile)
    local whoamiFile = io.open(M.tmpFile, 'r')
    M.user = whoamiFile:read()
    whoamiFile:close()
    M.psCommand = 'ps -u '..M.user..' -U '..M.user..' u > '.. M.tmpFile
    M.initialized = true
    vim.inspect(M)
  end
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
M.init()
--------------------------------------------------------------------------------
return M
