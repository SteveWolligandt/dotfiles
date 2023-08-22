local M = {}


-- local function keymap(lhs, rhs, desc)
--   vim.keymap.set("n", lhs, rhs, { silent = true, desc = desc })
-- end
--
-- Functional wrapper for mapping custom keybindings
function map(mode, lhs, rhs, opts)
    local options = { noremap = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end
function nmap(lhs, rhs, opts)
  map('n', lhs, rhs, opts)
end

function M.setup()
  local whichkey = require "which-key"
  local keymap = {
    d = {
      name = "Debug",
      R = { "<cmd>lua require'dap'.run_to_cursor()<cr>", "Run to Cursor" },
      E = { "<cmd>lua require'dapui'.eval(vim.fn.input '[Expression] > ')<cr>", "Evaluate Input" },
      C = { "<cmd>lua require'dap'.set_breakpoint(vim.fn.input '[Condition] > ')<cr>", "Conditional Breakpoint" },
      U = { "<cmd>lua require'dapui'.toggle()<cr>", "Toggle UI" },
      b = { "<cmd>lua require'dap'.step_back()<cr>", "Step Back" },
      c = { "<cmd>lua require'dap'.continue()<cr>", "Continue" },
      d = { "<cmd>lua require'dap'.disconnect()<cr>", "Disconnect" },
      e = { "<cmd>lua require'dapui'.eval()<cr>", "Evaluate" },
      g = { "<cmd>lua require'dap'.session()<cr>", "Get Session" },
      h = { "<cmd>lua require'dap.ui.widgets'.hover()<cr>", "Hover Variables" },
      S = { "<cmd>lua require'dap.ui.widgets'.scopes()<cr>", "Scopes" },
      i = { "<cmd>lua require'dap'.step_into()<cr>", "Step Into" },
      o = { "<cmd>lua require'dap'.step_over()<cr>", "Step Over" },
      p = { "<cmd>lua require'dap'.pause.toggle()<cr>", "Pause" },
      q = { "<cmd>lua require'dap'.close()<cr>", "Quit" },
      r = { "<cmd>lua require'dap'.repl.toggle()<cr>", "Toggle Repl" },
      s = { "<cmd>lua require'dap'.continue()<cr>", "Start" },
      t = { "<cmd>lua require'dap'.toggle_breakpoint()<cr>", "Toggle Breakpoint" },
      x = { "<cmd>lua require'dap'.terminate()<cr>", "Terminate" },
      u = { "<cmd>lua require'dap'.step_out()<cr>", "Step Out" },
    },
  }

  whichkey.register(keymap, {
    mode = "n",
    prefix = "<leader>",
    buffer = nil,
    silent = true,
    noremap = true,
    nowait = false,
  })

  local keymap_v = {
    name = "Debug",
    e = { "<cmd>lua require'dapui'.eval()<cr>", "Evaluate" },
  }
  whichkey.register(keymap_v, {
    mode = "v",
    prefix = "<leader>",
    buffer = nil,
    silent = true,
    noremap = true,
    nowait = false,
  })

  local lua                = ":lua "
  local cr                 = "<CR>"
  local dap                = "require('dap')"
  local dap_util           = "require('plugins.nvim-dap.util')"
  local exec_dir_forward   = dap_util..".execute('-exec set exec-direction forward');"
  local exec_dir_reverse   = dap_util..".execute('-exec set exec-direction reverse');"
  local continue           = dap..".continue();"
  local step_over          = dap..".step_over();"
  local step_into          = dap..".step_into();"
  local step_out           = dap..".step_out();"
  local toggle_breakpoints = dap..".toggle_breakpoint();"
  nmap("<F5>",
      lua..exec_dir_reverse..continue..cr,
      { silent = true })
  nmap("<F6>",
      lua..exec_dir_forward..continue..cr,
      { silent = true })
  nmap("<F8>",
      lua
      ..toggle_breakpoints
      ..dap_util..".store_breakpoints(false)"
      ..cr,
      { silent = true })
  nmap("<F9>",
      lua..exec_dir_reverse..step_over..cr,
      { silent = true })
  nmap("<F10>",
      lua..exec_dir_forward..step_over..cr,
      { silent = true })
  nmap("<F11>",
      lua..exec_dir_forward..step_into..cr,
      { silent = true })
  nmap("<C-F11>",
      lua..exec_dir_reverse..step_into..cr,
      { silent = true })
  nmap("<F12>",
      lua..exec_dir_forward..step_out..cr,
      { silent = true })
  nmap("<C-F12>",
      lua..exec_dir_reverse..step_out..cr,
      { silent = true })
end

return M
