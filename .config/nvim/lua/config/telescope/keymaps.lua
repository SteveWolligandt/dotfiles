local M = {}
local whichkey = require "which-key"

-- Functional wrapper for mapping custom keybindings
function map(mode, lhs, rhs, opts)
    local options = { noremap = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

function M.setup()
  local keymap = {
    t = {
      name = "Telescope",
      f = { '<cmd>Telescope find_files<cr>', 'Find Files' },
      e = { '<cmd>Telescope <cr>', 'Telescope'},
      c = { '<cmd>Telescope commands <cr>', 'Neovim Commands'},
      g = { '<cmd>Telescope live_grep <cr>', 'Grep'},
      b = { '<cmd>Telescope buffers <cr>', 'Buffers'},
      x = { '<cmd>Telescope file_browser <cr>', 'File Explorer'},
      p = { '<cmd>Telescope project <cr>', 'Project'},
      h = { '<cmd>Telescope help_tags <cr>', 'Help Tags'},
      d = { '<cmd>Telescope dap configurations <cr>', 'DAP Configurations'},
      t = { '<cmd>lua require("telescope").extensions.vstask.tasks() <cr>', 'Tasks'},
      -- vim.api.nvim_set_keymap('n', '<leader>tti', ':lua require("telescope").extensions.vstask.inputs() <cr>', { noremap = true })
      -- vim.api.nvim_set_keymap('n', '<leader>tth', ':lua require("telescope").extensions.vstask.history() <cr>', { noremap = true })
      -- vim.api.nvim_set_keymap('n', '<leader>ttl', ':lua require("telescope").extensions.vstask.launch() <cr>', { noremap = true })
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
end

return M
