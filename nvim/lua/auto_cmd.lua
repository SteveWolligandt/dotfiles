local aucmd_dict = {
  BufRead = {
    {
      pattern = "*",
      callback = function(_)
        print ('foo')
        require 'plugins.nvim-dap.util'.load_breakpoints()
      end,
    },
  },
}

for event, opt_tbls in pairs(aucmd_dict) do
  for _, opt_tbl in pairs(opt_tbls) do
    vim.api.nvim_create_autocmd(event, opt_tbl)
    print(opt_tbl.pattern)
  end
end
