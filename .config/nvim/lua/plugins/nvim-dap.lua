return {
  'mfussenegger/nvim-dap',
  dependencies = {
    "theHamsta/nvim-dap-virtual-text",
    "rcarriga/nvim-dap-ui",
    "mfussenegger/nvim-dap-python",
    "nvim-telescope/telescope-dap.nvim",
  },
  config = function()
    require("config.dap").setup()
  end,
}
