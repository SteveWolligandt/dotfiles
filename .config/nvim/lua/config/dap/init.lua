local M = {}
local dap = require('dap')
local breakpoints = require('dap.breakpoints')

--- Check if a file or directory exists in this path
function exists(file)
   local ok, err, code = os.rename(file, file)
   if not ok then
      if code == 13 then
         -- Permission denied, but it exists
         return true
      end
   end
   return ok, err
end

--- Check if a directory exists in this path
function isdir(path)
   -- "/" works on both Unix and Windows
   return exists(path.."/")
end

function breakpoints_path()
  local cwd = vim.fn.getcwd()
  local cache_path = cwd .. '/.cache'
  print('checking for ' .. cache_path)
  if (not exists(cache_path)) then
    os.execute("mkdir " .. cache_path)
  end
  local cache_dap_path = cache_path .. '/dap'
  if (not exists(cache_dap_path)) then
    os.execute("mkdir " .. cache_dap_path)
  end
  local breakpoints_path = cache_dap_path .. '/breakpoints.json'
  if (not exists(breakpoints_path)) then
    local file = io.open(breakpoints_path, "w")
    if file ~= nil then
      file:write("{}")
      file:close()
    end
  end
  return breakpoints_path
end

function M.store_breakpoints(clear)
  local bp_path = breakpoints_path(), 'r'
  local bps_file = io.open(bp_path)
  if bps_file == nil then
    return
  end
  local load_bps_raw = bps_file:read("*a")
  local bps = vim.fn.json_decode(load_bps_raw)
  local bps = {}
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

function M.load_breakpoints()
  local fp = io.open(breakpoints_path(), 'r')
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
      breakpoints.set(opts, tonumber(loaded_buffers[path]), line)
    end
  end
end






local function configure()
  require("mason").setup()
  require("mason-nvim-dap").setup({
    ensure_installed = {'cpptools', 'jdtls'}
  })

  local dap_breakpoint = {
    error = {
      text = "⬤",
      texthl = "LspDiagnosticsSignError",
      linehl = "",
      numhl = "",
    },
    rejected = {
      text = "",
      texthl = "LspDiagnosticsSignHint",
      linehl = "",
      numhl = "",
    },
    stopped = {
      text = "⇨",
      texthl = "LspDiagnosticsSignInformation",
      linehl = "DiagnosticUnderlineInfo",
      numhl = "LspDiagnosticsSignInformation",
    },
  }

  vim.fn.sign_define("DapBreakpoint", dap_breakpoint.error)
  vim.fn.sign_define("DapStopped", dap_breakpoint.stopped)
  vim.fn.sign_define("DapBreakpointRejected", dap_breakpoint.rejected)
end

local function configure_exts()
  require("nvim-dap-virtual-text").setup {
    commented = true,
  }

  local dapui = require "dapui"
  dapui.setup {} -- use default
  dap.listeners.after.event_initialized["dapui_config"] = function()
    dapui.open()
  end
  dap.listeners.before.event_terminated["dapui_config"] = function()
    dapui.close()
  end
  dap.listeners.before.event_exited["dapui_config"] = function()
    dapui.close()
  end
end

local function configure_debuggers()
  require("config.dap.adapters").setup()
end

function M.setup()
  configure() -- Configuration
  configure_exts() -- Extensions
  configure_debuggers() -- Debugger
  require("config.dap.keymaps").setup() -- Keymaps
end

configure_debuggers()

local function evaluate_handler(err, resp)
  local utils = require('dap.utils')
  if err then
    local message = utils.fmt_error(err)
    if message then
      -- TODO display message somehow!
    end
    return
  end
end

function M.execute(text, callback)
  local session = dap.session()
  if session ~= nil then
    dap.session():evaluate(text, evaluate_handler, callback)
  end
end

return M
