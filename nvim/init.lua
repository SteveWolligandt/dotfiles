-- vim.o.concealcursor = 'nc'
-- vim.o.conceallevel = 2
require 'setup_lazy'
local lazy = require 'lazy'
lazy.setup('plugins')
require 'general_settings'
require 'general_keymaps'
require 'auto_cmd'
require 'search_selection'
