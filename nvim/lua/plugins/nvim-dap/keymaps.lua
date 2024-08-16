
local M = {}
-- local function keymap(lhs, rhs, desc)
--   vim.keymap.set("n", lhs, rhs, { silent = true, desc = desc })
-- end
--
-- Functional wrapper for mapping custom keybindings
local function map(mode, lhs, rhs, opts)
    local options = { noremap = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

local function nmap(lhs, rhs, opts)
  map('n', lhs, rhs, opts)
end

function M.setup()
  local whichkey = require "which-key"
  whichkey.add({
    { "<leader>d", group = "Debug", nowait = false, remap = false },
    { "<leader>dC", "<cmd>lua require'dap'.set_breakpoint(vim.fn.input '[Condition] > ')<cr>", desc = "Conditional Breakpoint", nowait = false, remap = false },
    { "<leader>dE", "<cmd>lua require'dapui'.eval(vim.fn.input '[Expression] > ')<cr>", desc = "Evaluate Input", nowait = false, remap = false },
    { "<leader>dR", "<cmd>lua require'dap'.run_to_cursor()<cr>", desc = "Run to Cursor", nowait = false, remap = false },
    { "<leader>dS", "<cmd>lua require'dap.ui.widgets'.scopes()<cr>", desc = "Scopes", nowait = false, remap = false },
    { "<leader>dU", "<cmd>lua require'dapui'.toggle()<cr>", desc = "Toggle UI", nowait = false, remap = false },
    { "<leader>db", "<cmd>lua require'dap'.step_back()<cr>", desc = "Step Back", nowait = false, remap = false },
    { "<leader>dc", "<cmd>lua require'dap'.continue()<cr>", desc = "Continue", nowait = false, remap = false },
    { "<leader>dd", "<cmd>lua require'dap'.disconnect()<cr>", desc = "Disconnect", nowait = false, remap = false },
    { "<leader>de", "<cmd>lua require'dapui'.eval()<cr>", desc = "Evaluate", nowait = false, remap = false },
    { "<leader>dg", "<cmd>lua require'dap'.session()<cr>", desc = "Get Session", nowait = false, remap = false },
    { "<leader>dh", "<cmd>lua require'dap.ui.widgets'.hover()<cr>", desc = "Hover Variables", nowait = false, remap = false },
    { "<leader>di", "<cmd>lua require'dap'.step_into()<cr>", desc = "Step Into", nowait = false, remap = false },
    { "<leader>do", "<cmd>lua require'dap'.step_over()<cr>", desc = "Step Over", nowait = false, remap = false },
    { "<leader>dp", "<cmd>lua require'dap'.pause.toggle()<cr>", desc = "Pause", nowait = false, remap = false },
    { "<leader>dq", "<cmd>lua require'dap'.close()<cr>", desc = "Quit", nowait = false, remap = false },
    { "<leader>dr", "<cmd>lua require'dap'.repl.toggle()<cr>", desc = "Toggle Repl", nowait = false, remap = false },
    { "<leader>ds", "<cmd>lua require'dap'.continue()<cr>", desc = "Start", nowait = false, remap = false },
    { "<leader>dt", "<cmd>lua require'dap'.toggle_breakpoint()<cr>", desc = "Toggle Breakpoint", nowait = false, remap = false },
    { "<leader>du", "<cmd>lua require'dap'.step_out()<cr>", desc = "Step Out", nowait = false, remap = false },
    { "<leader>dx", "<cmd>lua require'dap'.terminate()<cr>", desc = "Terminate", nowait = false, remap = false },

    { "<leader>", group = "Debug", mode = "v", nowait = false, remap = false },
    { "<leader>e", "<cmd>lua require'dapui'.eval()<cr>", desc = "Evaluate", mode = "v", nowait = false, remap = false },
  })

  local lua                = "<cmd>lua "
  local cr                 = "<cr>"
  local dap                = "require('dap')"
  local dap_util           = "require('plugins.nvim-dap.util')"
  local exec_dir_forward   = dap_util..".execute('-exec set exec-direction forward');"
  local exec_dir_reverse   = dap_util..".execute('-exec set exec-direction reverse');"
  local continue           = dap..".continue();"
  local step_over          = dap..".step_over();"
  local step_into          = dap..".step_into();"
  local step_out           = dap..".step_out();"
  local toggle_breakpoints = dap..".toggle_breakpoint();"
  whichkey.add({
    { '<F5>', lua..exec_dir_forward..continue..cr,
      desc = 'DAP - Continue',
      nowait = false, remap = false
    },
    {'<F17>',
      lua..exec_dir_reverse..continue..cr,
     desc = 'DAP - Reverse Continue',
      nowait = false, remap = false,
    },
    {'<F8>', 
      lua..toggle_breakpoints..dap_util..'.store_breakpoints(false)'..cr,
     desc = 'DAP - Set Breakpoint', nowait = false, remap = false,
    },
    {'<F9>',
      lua..exec_dir_forward..step_over..cr,
     desc = 'DAP - Step Over', nowait = false, remap = false,
    },
    {'<F21>',
      lua..exec_dir_forward..step_over..cr,
     desc = 'DAP - Reverse Step Over', nowait = false, remap = false,
    },
    {'<F9>',
      lua..exec_dir_forward..step_into..cr,
     desc = 'DAP - Step Into', nowait = false, remap = false,
    },
    {'<F21>',
      lua..exec_dir_reverse..step_into..cr,
     desc = 'DAP - Reverse Step Into', nowait = false, remap = false,
    },
    {'<F10>',
      lua..exec_dir_forward..step_out..cr,
     desc = 'DAP - Step Out', nowait = false, remap = false,
    },
    {'<F22>',
      lua..exec_dir_reverse..step_out..cr,
     desc = 'DAP - Reverse Step Out', nowait = false, remap = false,
    },
  })
end

return M
