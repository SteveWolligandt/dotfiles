return {
  'majutsushi/tagbar',
   config = function()
     local map = vim.api.nvim_set_keymap
     local opts = { noremap = true, silent = true }
     map('n', '<F4>', '<Cmd>TagbarToggle<CR>', opts)
   end
}
